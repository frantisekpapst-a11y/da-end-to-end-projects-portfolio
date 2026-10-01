import json
import sys
from pathlib import Path
from datetime import datetime
import requests

# ============================================================
# 1. SEZNAM FONDŮ
#
# Cíl:
# Definovat fondy, jejich názvy a technické fund_id,
# které používá ČSOB endpoint.
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
# 2. CESTA K PROJEKTU A RAW SLOŽCE
#
# Cíl:
# Odvodit cestu k projektu podle umístění tohoto .py souboru.
#
# Díky tomu nezáleží na tom, z jaké složky skript spustíme.
# ============================================================

project_folder = Path(__file__).resolve().parent.parent

raw_folder = project_folder / "data" / "raw" / "funds_prices"

raw_folder.mkdir(parents=True, exist_ok=True)


# ============================================================
# 3. HTTP SESSION
#
# Cíl:
# Použít stejné nastavení, které fungovalo v 01_check_fund_endpoints.py.
# ============================================================

session = requests.Session()

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
# 4. TIMESTAMP BĚHU A POČÍTADLO SNAPSHOTŮ
#
# Cíl:
# Použít jeden společný timestamp pro celý acquisition run
# a evidovat počet úspěšně uložených snapshotů.
#
# Díky společnému timestampu lze snadno poznat,
# které raw soubory vznikly během stejného běhu pipeline.
# ============================================================

download_time = datetime.now()

timestamp = download_time.strftime("%Y-%m-%d_%H%M%S")

saved_snapshots = 0


# ============================================================
# 5. NAČTENÍ A ULOŽENÍ VŠECH FONDŮ
#
# Cíl:
# Pro každý fond:
# - sestavit URL,
# - načíst JSON data,
# - ověřit úspěšnou odpověď,
# - uložit raw JSON snapshot.
#
# Pokud jeden fond selže, skript zpracuje zbývající fondy.
# Celkový stav se vyhodnotí až na konci.
# ============================================================

for fund in FUNDS:
    url = (
        "https://www.csob.cz/spa/fund/funds-detail/funds/"
        + fund["fund_id"]
        + "/prices"
    )

    print()
    print("Načítám: " + fund["fund_name"])
    print("URL: " + url)

    try:
        response = session.get(url, timeout=30)

        print("HTTP status: " + str(response.status_code))

        if response.status_code != 200:
            print("CHYBA: data se nepodařilo načíst.")
            continue

        data = response.json()

        if not data:
            print("CHYBA: endpoint vrátil prázdná data.")
            continue

        file_name = fund["fund_id"] + "_" + timestamp + ".json"

        file_path = raw_folder / file_name

        with open(file_path, "w", encoding="utf-8") as file:
            json.dump(
                data,
                file,
                ensure_ascii=False,
                indent=2
            )

        print("Raw data uložena do:")
        print(str(file_path))

        saved_snapshots += 1

    except requests.RequestException as error:
        print("CHYBA REQUESTU: " + str(error))

    except ValueError as error:
        print("CHYBA JSON: " + str(error))

# ============================================================
# 6. SOUHRN
#
# Cíl:
# Vypsat počet úspěšně uložených raw snapshotů
# a vyhodnotit celkový stav acquisition fáze.
# ============================================================

print()
print("=" * 60)
print("SOUHRN")
print("=" * 60)
print(
    "Uložené raw snapshoty: "
    + str(saved_snapshots)
    + " / "
    + str(len(FUNDS))
)

# ============================================================
# 7. CELKOVÝ VÝSLEDEK A EXIT CODE
#
# Cíl:
# Předat operačnímu systému výsledek acquisition fáze.
#
# exit code 0
# = všech 6 fondů bylo úspěšně načteno a uloženo
#
# exit code 1
# = alespoň jeden fond nebyl úspěšně uložen
#
# Tento výsledek používá run_pipeline.bat.
# ============================================================

if saved_snapshots == len(FUNDS):
    print("CELKOVÝ VÝSLEDEK: OK")
    sys.exit(0)

else:
    failed_snapshots = len(FUNDS) - saved_snapshots

    print("Neúspěšné snapshoty: " + str(failed_snapshots))
    print("CELKOVÝ VÝSLEDEK: CHYBA")

    sys.exit(1)