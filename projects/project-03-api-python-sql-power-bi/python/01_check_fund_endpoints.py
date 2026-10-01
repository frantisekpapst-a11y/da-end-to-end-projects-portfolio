import requests


# ============================================================
# 1. SEZNAM FONDŮ
#
# Cíl:
# Definovat fondy, jejich názvy a technické fund_id,
# které používá ČSOB endpoint.
#
# fund_name:
# název fondu pro přehledný výstup
#
# fund_id:
# technický identifikátor používaný v URL endpointu
# ============================================================

FUNDS = [
    {
        "fund_name": "ČSOB Akciový pro digitalizaci zodpovědný",
        "fund_id": "BE6339813873_1",
    },
    {
        "fund_name": "ČSOB Akciový srdce Evropy",
        "fund_id": "CZ0008472610_1",
    },
    {
        "fund_name": "ČSOB Premium Velmi odvážný",
        "fund_id": "BE6285921308_13",
    },
    {
        "fund_name": "ČSOB Premium Velmi odvážný zodpovědný",
        "fund_id": "CZ0008477080_13",
    },
    {
        "fund_name": "ČSOB Krátkodobý",
        "fund_id": "BE0173476400_2",
    },
    {
        "fund_name": "ČSOB Dluhopisový",
        "fund_id": "770000001147_2",
    },
]


# ============================================================
# 2. HTTP SESSION
#
# Cíl:
# Vytvořit jednu společnou session pro komunikaci s webem ČSOB.
#
# Obyčejný requests.get() vracel chybu 500.
# Session + vhodné HTTP headers vrací data správně.
# Session zároveň umožňuje používat stejné nastavení
# pro všechny endpointy.
# ============================================================

session = requests.Session()


# ============================================================
# 3. HTTP HEADERS
#
# Cíl:
# Nastavit informace, které se budou posílat
# s každým requestem přes session.
#
# User-Agent:
# klient se představí podobně jako běžný webový prohlížeč
# Accept:
# říká serveru, jaký typ odpovědi umíme přijmout
# Referer:
# uvádí webový kontext, ze kterého request přichází
# ============================================================

session.headers.update({
    "User-Agent": (
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
        "AppleWebKit/537.36 (KHTML, like Gecko) "
        "Chrome/140.0 Safari/537.36"
    ),
    "Accept": "application/json, text/plain, */*",
    "Referer": "https://www.csob.cz/",
})


# ============================================================
# 4. POČÍTADLO ÚSPĚŠNÝCH ENDPOINTŮ
#
# Cíl:
# Spočítat, kolik z celkových 6 endpointů
# prošlo základní kontrolou.
# ============================================================

successful_endpoints = 0


# ============================================================
# 5. KONTROLA ENDPOINTŮ
#
# Cíl:
# Pro každý fond:
# - sestavit URL
# - poslat GET request
# - ověřit HTTP status
# - ověřit, že odpověď je JSON
# - ověřit, že JSON není prázdný
#
# Tento skript data dále netransformuje ani neukládá.
# Jeho úkolem je pouze ověřit datový zdroj.
# ============================================================

for fund in FUNDS:
    # Sestavení URL pro právě kontrolovaný fond
    url = (
        "https://www.csob.cz/spa/fund/funds-detail/funds/"
        + fund["fund_id"]
        + "/prices"
    )

    print()
    print("Kontroluji: " + fund["fund_name"])
    print("URL: " + url)

    try:
        # Odeslání GET requestu.
        # timeout=30 zabrání tomu, aby skript čekal neomezeně dlouho.
        response = session.get(url, timeout=30)

        print("HTTP status: " + str(response.status_code))

        # ====================================================
        # 5.1 HTTP STATUS
        #
        # HTTP 200 = request proběhl úspěšně.
        #
        # Pokud server vrátí jiný status
        # (např. 404 nebo 500),
        # tento fond přeskočíme pomocí continue.
        # ====================================================

        if response.status_code != 200:
            print("CHYBA: endpoint není dostupný.")
            continue

        # ====================================================
        # 5.2 JSON RESPONSE
        #
        # Převede JSON odpověď serveru
        # na Python datovou strukturu.
        #
        # U tohoto endpointu očekáváme list záznamů.
        # ====================================================

        data = response.json()

        # ====================================================
        # 5.3 PRÁZDNÁ DATA
        #
        # Samotný HTTP status 200 ještě neznamená,
        # že endpoint skutečně obsahuje data.
        #
        # Pokud je výsledný list prázdný,
        # fond přeskočíme.
        # ====================================================

        if not data:
            print("CHYBA: endpoint vrátil prázdná data.")
            continue

        # ====================================================
        # 5.4 ÚSPĚŠNÝ ENDPOINT
        #
        # Pokud jsme se dostali až sem:
        # - request proběhl
        # - HTTP status je 200
        # - odpověď je JSON
        # - JSON obsahuje záznamy
        # ====================================================

        print("OK: endpoint vrátil " + str(len(data)) + " záznamů.")

        successful_endpoints += 1

    # ========================================================
    # 5.5 CHYBA REQUESTU
    #
    # Zachytí chyby při HTTP komunikaci,
    # například timeout nebo problém s připojením.
    # ========================================================

    except requests.RequestException as error:
        print("CHYBA REQUESTU: " + str(error))

    # ========================================================
    # 5.6 CHYBA JSON
    #
    # Zachytí situaci, kdy server odpoví,
    # ale odpověď není možné převést na JSON.
    #
    # Například kdyby endpoint místo JSONu
    # vrátil HTML stránku.
    # ========================================================

    except ValueError as error:
        print("CHYBA JSON: " + str(error))

# ============================================================
# 6. SOUHRN
#
# Cíl:
# Vypsat, kolik endpointů prošlo kontrolou.
# ============================================================

print()
print("=" * 60)
print("SOUHRN")
print("=" * 60)
print(
    "Úspěšné endpointy: "
    + str(successful_endpoints)
    + " / "
    + str(len(FUNDS))
)