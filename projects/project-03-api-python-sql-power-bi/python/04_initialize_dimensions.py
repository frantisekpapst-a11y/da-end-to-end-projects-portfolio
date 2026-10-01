from datetime import datetime, date, timedelta
import pyodbc


# ============================================================
# 1. METADATA FONDŮ
#
# Cíl:
# Připravit statická metadata pro analytics.DimFund.
#
# DimFund obsahuje popisné informace o fondech:
# - identifikátory,
# - název a kategorii,
# - měnu,
# - datum vzniku,
# - rizikovost,
# - náklady,
# - benchmark,
# - odkaz na KID.
#
# Tato data se nebudou načítat každý den.
# Skript při opakovaném spuštění existující fondy přeskočí,
# aby nevznikaly duplicity.
# ============================================================

FUND_METADATA = [
    {
        "fund_id": "BE6339813873_1",
        "isin": "BE6339813873",
        "fund_name": "ČSOB Akciový pro digitalizaci zodpovědný",
        "fund_category": "Akciový",
        "currency": "CZK",
        "inception_date": "2023-04-28",
        "sri": 5,
        "recommended_holding_period": "8 let",
        "entry_fee_pct": 3.00,
        "ongoing_costs_pct": 1.77,
        "benchmark": "MSCI All Countries World - Net Return Index",
        "kid_url": "https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_BE6339813873_CS.PDF"
    },
    {
        "fund_id": "CZ0008472610_1",
        "isin": "CZ0008472610",
        "fund_name": "ČSOB Akciový srdce Evropy",
        "fund_category": "Akciový",
        "currency": "CZK",
        "inception_date": "2007-05-03",
        "sri": 4,
        "recommended_holding_period": "8 let",
        "entry_fee_pct": 3.00,
        "ongoing_costs_pct": 2.57,
        "benchmark": None,
        "kid_url": "https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_CZ0008472610_CS.PDF"
    },
    {
        "fund_id": "BE6285921308_13",
        "isin": "BE6285921308",
        "fund_name": "ČSOB Premium Velmi odvážný",
        "fund_category": "Smíšený",
        "currency": "CZK",
        "inception_date": "2016-08-02",
        "sri": 3,
        "recommended_holding_period": "7 let",
        "entry_fee_pct": 1.50,
        "ongoing_costs_pct": 1.69,
        "benchmark": (
            "80% MSCI All Countries World CZK Hedged - Net Return Index, "
            "10% JP Morgan GBI Czech Republic 1-5Y CZK - Total Return Index, "
            "6% iBoxx Eur Corporates 1-5Y CZK Hedged - Total Return Index, "
            "2% JP Morgan EMU Investment Grade 1-5Y CZK Hedged - Total Return Index, "
            "1% JP Morgan EMBI CZK Hedged - Total Return Index, "
            "1% JP Morgan GBI EM Global Diversified CZK - Total Return Index"
        ),
        "kid_url": "https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_BE6285921308_CS.PDF"
    },
    {
        "fund_id": "CZ0008477080_13",
        "isin": "CZ0008477080",
        "fund_name": "ČSOB Premium Velmi odvážný zodpovědný",
        "fund_category": "Smíšený",
        "currency": "CZK",
        "inception_date": "2022-06-01",
        "sri": 3,
        "recommended_holding_period": "7 let",
        "entry_fee_pct": 1.50,
        "ongoing_costs_pct": 2.81,
        "benchmark": (
            "80% MSCI All Countries World CZK Hedged - Net Return Index, "
            "10% JP Morgan GBI Czech Republic 1-5Y CZK - Total Return Index, "
            "6% iBoxx Eur Corporates 1-5Y CZK Hedged - Total Return Index, "
            "2% JP Morgan EMU Investment Grade 1-5Y CZK Hedged - Total Return Index, "
            "1% JP Morgan EMBI+ CZK Hedged - Total Return Index, "
            "1% JP Morgan GBI EM Global Diversified CZK - Total Return Index"
        ),
        "kid_url": "https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_CZ0008477080_CS.PDF"
    },
    {
        "fund_id": "BE0173476400_2",
        "isin": "BE0173476400",
        "fund_name": "ČSOB Krátkodobý",
        "fund_category": "Dluhopisový",
        "currency": "CZK",
        "inception_date": "2000-03-31",
        "sri": 2,
        "recommended_holding_period": "3 roky",
        "entry_fee_pct": 0.25,
        "ongoing_costs_pct": 0.59,
        "benchmark": (
            "20% JP Morgan GBI Czech Republic 1-3Y CZK - Total Return Index, "
            "80% JP Morgan Euro Cash 1M CZK Hedged - Total Return Index"
        ),
        "kid_url": "https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_BE0173476400_CS.PDF"
    },
    {
        "fund_id": "770000001147_2",
        "isin": "770000001147",
        "fund_name": "ČSOB Dluhopisový",
        "fund_category": "Dluhopisový",
        "currency": "CZK",
        "inception_date": "1990-12-01",
        "sri": 2,
        "recommended_holding_period": "3 roky",
        "entry_fee_pct": 0.50,
        "ongoing_costs_pct": 0.98,
        "benchmark": (
            "70% J.P. Morgan GBI Czech Republic Unhedged CZK, "
            "30% iBoxx Euro Corporates 1-5 Total Return Index"
        ),
        "kid_url": "https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_770000001147_CS.PDF"
    }
]


# ============================================================
# 2. PŘEVOD DATUMU VZNIKU FONDŮ
#
# Cíl:
# Převést inception_date z textového formátu YYYY-MM-DD
# na Python date.
#
# SQL sloupec inception_date má datový typ DATE,
# proto je vhodné předávat skutečné datum místo textu.
# ============================================================

for fund in FUND_METADATA:
    fund["inception_date"] = datetime.strptime(fund['inception_date'], '%Y-%m-%d').date()


# ============================================================
# 3. NASTAVENÍ KALENDÁŘE PRO DIMDATE
#
# Cíl:
# Vytvořit souvislý kalendář pro reporting a Power BI.
#
# Začátek:
# 2005-01-03 = nejstarší dostupné datum NAV v projektu.
# Konec:
# 31. 12. následujícího roku.
#
# DimDate obsahuje všechny kalendářní dny,
# tedy i víkendy a dny bez NAV hodnoty.
# ============================================================

calendar_start_date = date(2005, 1, 3)

calendar_end_date = date(date.today().year + 1, 12, 31)

MONTH_NAMES = [
    "",
    "Leden",
    "Únor",
    "Březen",
    "Duben",
    "Květen",
    "Červen",
    "Červenec",
    "Srpen",
    "Září",
    "Říjen",
    "Listopad",
    "Prosinec"
]

DAY_NAMES = ['', 'Pondělí', 'Úterý', 'Středa', 'Čtvrtek', 'Pátek', 'Sobota', 'Neděle']


# ============================================================
# 4. PŘIPOJENÍ K SQL SERVERU
#
# Cíl:
# Připojit Python k databázi fund_performance_analytics.
#
# Používáme:
# - SQL Server LocalDB,
# - ODBC Driver 18,
# - Windows autentizaci.
#
# Přes cursor budeme posílat SQL dotazy a INSERTy.
# ============================================================

connection_string = (
    "DRIVER={ODBC Driver 18 for SQL Server};"
    "SERVER=(localdb)\\DataAnalyticsLocalDB;"
    "DATABASE=fund_performance_analytics;"
    "Trusted_Connection=yes;"
    "Encrypt=no;"
)

connection = pyodbc.connect(connection_string)

cursor = connection.cursor()

print("Připojení k SQL Serveru je OK.")


# ============================================================
# 5. SQL INSERT PRO DIMFUND
#
# Cíl:
# Připravit parametrizovaný SQL INSERT pro DimFund.
#
# Otazníky jsou zástupná místa pro hodnoty,
# které se předávají přes cursor.execute().
# ============================================================

insert_fund_query = """
INSERT INTO analytics.DimFund (
    fund_id,
    isin,
    fund_name,
    fund_category,
    currency,
    inception_date,
    sri,
    recommended_holding_period,
    entry_fee_pct,
    ongoing_costs_pct,
    benchmark,
    kid_url
)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
"""


# ============================================================
# 6. NAPLNĚNÍ DIMFUND
#
# Cíl:
# Vložit metadata fondů do analytics.DimFund.
#
# Před každým insertem kontrolujeme fund_id.
# Pokud fond už existuje, přeskočíme ho.
#
# Díky tomu je možné skript spustit opakovaně
# bez vytvoření duplicit.
# ============================================================

inserted_funds = 0

skipped_funds = 0

for fund in FUND_METADATA:
    cursor.execute(
        """
        SELECT 1
        FROM analytics.DimFund
        WHERE fund_id = ?
        """,
        fund["fund_id"]
    )

    row = cursor.fetchone()

    if row is not None:
        skipped_funds += 1

        continue

    cursor.execute(
        insert_fund_query,
        fund["fund_id"],
        fund["isin"],
        fund["fund_name"],
        fund["fund_category"],
        fund["currency"],
        fund["inception_date"],
        fund["sri"],
        fund["recommended_holding_period"],
        fund["entry_fee_pct"],
        fund["ongoing_costs_pct"],
        fund["benchmark"],
        fund["kid_url"]
    )

    inserted_funds += 1


# ============================================================
# 7. SQL INSERT PRO DIMDATE
#
# Cíl:
# Připravit INSERT pro jednotlivé kalendářní dny.
#
# Každý řádek obsahuje:
# - datum,
# - rok,
# - kvartál,
# - měsíc,
# - rok-měsíc,
# - den v týdnu.
#
# date_key má formát YYYYMMDD,
# například 20260929.
# ============================================================

insert_date_query = """
INSERT INTO analytics.DimDate (
    date_key,
    calendar_date,
    calendar_year,
    calendar_quarter,
    month_number,
    month_name,
    year_month,
    day_of_week,
    day_name
)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
"""


# ============================================================
# 8. NAPLNĚNÍ DIMDATE
#
# Cíl:
# Projít každý kalendářní den od calendar_start_date
# do calendar_end_date a vložit ho do DimDate.
#
# timedelta(days=1) posouvá current_date vždy
# o jeden kalendářní den dopředu.
#
# Před insertem kontrolujeme, zda datum už existuje.
# Pokud ano, datum přeskočíme.
# ============================================================

inserted_dates = 0

skipped_dates = 0

current_date = calendar_start_date

while current_date <= calendar_end_date:
    date_key = int(current_date.strftime('%Y%m%d'))
    calendar_year = current_date.year
    calendar_quarter = (
        (current_date.month - 1) // 3
    ) + 1
    month_number = current_date.month
    month_name = MONTH_NAMES[
        month_number
    ]
    year_month = current_date.strftime('%Y-%m')
    day_of_week = current_date.isoweekday()
    day_name = DAY_NAMES[
        day_of_week
    ]

    cursor.execute(
        """
        SELECT 1
        FROM analytics.DimDate
        WHERE calendar_date = ?
        """,
        current_date
    )

    row = cursor.fetchone()

    if row is not None:
        skipped_dates += 1

    else:
        cursor.execute(
            insert_date_query,
            date_key,
            current_date,
            calendar_year,
            calendar_quarter,
            month_number,
            month_name,
            year_month,
            day_of_week,
            day_name
        )

        inserted_dates += 1

    current_date = current_date + timedelta(days=1)


# ============================================================
# 9. ULOŽENÍ ZMĚN
#
# Cíl:
# Trvale uložit všechny INSERTy do databáze.
#
# Dokud neproběhne commit(),
# změny nemusí být trvale zapsané.
# ============================================================

connection.commit()


# ============================================================
# 10. KONTROLA VÝSLEDKU
#
# Cíl:
# Ověřit počet řádků v obou dimenzích
# a rozsah vytvořeného kalendáře.
#
# Výstup slouží jako rychlá kontrola,
# že inicializace proběhla správně.
# ============================================================

cursor.execute('SELECT COUNT(*) FROM analytics.DimFund')

fund_count = cursor.fetchone()[0]

cursor.execute('SELECT COUNT(*) FROM analytics.DimDate')

date_count = cursor.fetchone()[0]

cursor.execute(
    """
    SELECT
        MIN(calendar_date),
        MAX(calendar_date)
    FROM analytics.DimDate
    """
)

date_range = cursor.fetchone()

first_date = date_range[0]

last_date = date_range[1]

print()
print("============================================")
print("INICIALIZACE DIMENZÍ - VÝSLEDEK")
print("============================================")
print()
print("DIMFUND")
print('Nově vložené fondy: ' + str(inserted_funds))
print('Přeskočené existující fondy: ' + str(skipped_funds))
print('Celkový počet fondů: ' + str(fund_count))
print()
print("DIMDATE")
print('Nově vložená data: ' + str(inserted_dates))
print('Přeskočená existující data: ' + str(skipped_dates))
print('Celkový počet kalendářních dnů: ' + str(date_count))
print('První datum: ' + str(first_date))
print('Poslední datum: ' + str(last_date))


# ============================================================
# 11. UKONČENÍ SQL SPOJENÍ
#
# Cíl:
# Korektně zavřít cursor a databázové spojení
# po dokončení všech operací.
# ============================================================

cursor.close()

connection.close()

print()
print("Připojení k SQL Serveru bylo ukončeno.")