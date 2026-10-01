import json
import sys
from pathlib import Path
import pandas as pd
import pyodbc


# ============================================================
# 1. SEZNAM FONDŮ
#
# Cíl:
# Definovat fondy, jejichž NAV historie (ceny) se bude načítat
# z raw JSON souborů do analytics.FactFundPrice.
#
# fund_id používáme:
# - pro nalezení raw souboru,
# - pro nalezení odpovídajícího fund_key v DimFund.
# ============================================================

FUNDS = [
    {'fund_name': 'ČSOB Akciový pro digitalizaci zodpovědný', 'fund_id': 'BE6339813873_1'},
    {'fund_name': 'ČSOB Akciový srdce Evropy', 'fund_id': 'CZ0008472610_1'},
    {'fund_name': 'ČSOB Premium Velmi odvážný', 'fund_id': 'BE6285921308_13'},
    {'fund_name': 'ČSOB Premium Velmi odvážný zodpovědný', 'fund_id': 'CZ0008477080_13'},
    {'fund_name': 'ČSOB Krátkodobý', 'fund_id': 'BE0173476400_2'},
    {'fund_name': 'ČSOB Dluhopisový', 'fund_id': '770000001147_2'}
]


# ============================================================
# 2. FUNKCE PRO NALEZENÍ NEJNOVĚJŠÍHO RAW SOUBORU
#
# Cíl:
# Najít nejnovější JSON snapshot pro konkrétní fund_id.
#
# Názvy raw souborů obsahují timestamp,
# proto lze pomocí max() vybrat nejnovější soubor.
#
# Pokud soubor neexistuje, funkce vrátí None.
# ============================================================

def get_latest_file(raw_folder, fund_id):
    files = list(raw_folder.glob(fund_id + '_*.json'))

    if not files:
        return None

    latest_file = max(files)

    return latest_file


# ============================================================
# 3. FUNKCE PRO NAČTENÍ RAW JSON
#
# Cíl:
# Načíst raw JSON snapshot do Pythonu.
#
# Raw JSON zůstává nezměněný v raw vrstvě.
# Tento skript z něj pouze čte data pro SQL load.
# ============================================================

def load_raw_json(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        data = json.load(file)

    return data


# ============================================================
# 4. FUNKCE PRO PŘÍPRAVU DAT PRO SQL
#
# Cíl:
# Převést raw data do DataFrame a připravit sloupce,
# které odpovídají grainu FactFundPrice.
#
# Raw data obsahují:
# - timestamp v milisekundách,
# - NAV hodnotu.
#
# Timestamp převádíme na lokální datum Europe/Prague.
#
# date_key vytváříme ve formátu YYYYMMDD,
# například 20260929.
# ============================================================

def prepare_dataframe(data):
    df = pd.DataFrame(data, columns=['timestamp_ms', 'nav_value'])

    df["date"] = (
        pd.to_datetime(df['timestamp_ms'], unit='ms', utc=True).dt.tz_convert('Europe/Prague')
        .dt.date
    )

    df["date_key"] = (
        pd.to_datetime(df['date']).dt.strftime('%Y%m%d').astype(int)
    )

    return df


# ============================================================
# 5. CESTA K PROJEKTU A RAW SLOŽCE
#
# Cíl:
# Odvodit cestu k projektu podle umístění tohoto .py souboru.
#
# Díky tomu skript funguje bez ohledu na to,
# z jaké složky je spuštěn.
# ============================================================

project_folder = (
    Path(__file__).resolve()
    .parent
    .parent
)

raw_folder = (
    project_folder
    / "data"
    / "raw"
    / "funds_prices"
)


# ============================================================
# 6. PŘIPOJENÍ K SQL SERVERU
#
# Cíl:
# Připojit Python k databázi fund_performance_analytics.
#
# Z databáze budeme:
# - číst fund_key z DimFund,
# - kontrolovat již existující data,
# - zapisovat nové NAV hodnoty do FactFundPrice.
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
# 7. SQL INSERT PRO FACTFUNDPRICE
#
# Cíl:
# Připravit parametrizovaný INSERT pro fact tabulku.
#
# FactFundPrice obsahuje grain:
# jeden fond + jeden kalendářní den.
#
# load_timestamp není potřeba zadávat,
# protože SQL jej automaticky vytvoří pomocí SYSDATETIME().
# ============================================================

insert_query = """
INSERT INTO analytics.FactFundPrice (
    fund_key,
    date_key,
    nav_value
)
VALUES (?, ?, ?)
"""


# ============================================================
# 8. SOUHRNNÁ POČÍTADLA
#
# Cíl:
# Evidovat počet nově vložených řádků
# a fondů, u kterých load selhal.
# ============================================================

total_inserted_rows = 0

failed_funds = 0


# ============================================================
# 9. INCREMENTAL LOAD FONDŮ
#
# Cíl:
# Pro každý fond:
# 1. najít nejnovější raw snapshot,
# 2. připravit datum a date_key,
# 3. získat fund_key z DimFund,
# 4. zjistit, která data již existují ve FactFundPrice,
# 5. vložit pouze nové řádky.
#
# Díky tomu lze skript spouštět opakovaně
# bez vytváření duplicit.
# ============================================================

for fund in FUNDS:
    print()
    print("=" * 60)
    print('Načítám: ' + fund['fund_name'])
    print("=" * 60)
    latest_file = get_latest_file(raw_folder, fund['fund_id'])

    if latest_file is None:
        print('CHYBA: nebyl nalezen raw soubor.')
        failed_funds += 1

        continue

    print('Raw soubor: ' + latest_file.name)
    data = load_raw_json(latest_file)
    df = prepare_dataframe(data)
    cursor.execute(
        """
        SELECT fund_key
        FROM analytics.DimFund
        WHERE fund_id = ?
        """,
        fund["fund_id"]
    )
    row = cursor.fetchone()

    if row is None:
        print('CHYBA: fond nebyl nalezen v analytics.DimFund.')
        failed_funds += 1

        continue

    fund_key = row[0]
    cursor.execute(
        """
        SELECT date_key
        FROM analytics.FactFundPrice
        WHERE fund_key = ?
        """,
        fund_key
    )
    existing_rows = cursor.fetchall()
    existing_date_keys = set()

    for row in existing_rows:
        existing_date_keys.add(row[0])

    new_rows = df[
        ~df['date_key'].isin(existing_date_keys)
    ]
    rows_to_insert = []

    for row in new_rows.itertuples():
        rows_to_insert.append((fund_key, int(row.date_key), float(row.nav_value)))

    if not rows_to_insert:
        print('Žádná nová data k vložení.')

        continue

    cursor.executemany(insert_query, rows_to_insert)
    inserted_rows = len(rows_to_insert)
    total_inserted_rows += inserted_rows
    print('Nově vložené řádky: ' + str(inserted_rows))


# ============================================================
# 10. COMMIT NEBO ROLLBACK
#
# Cíl:
# Potvrdit SQL změny pouze tehdy,
# pokud load všech fondů proběhl bez chyby.
#
# Pokud alespoň jeden fond selže,
# nepotvrzené změny se vrátí pomocí rollback().
#
# Tím chráníme poslední správný stav databáze
# a nevytváříme částečně dokončený load.
# ============================================================

if failed_funds == 0:
    connection.commit()
    print()
    print("SQL změny byly potvrzeny.")

else:
    connection.rollback()
    print()
    print('SQL změny nebyly potvrzeny. Byl proveden rollback.')


# ============================================================
# 11. KONTROLA VÝSLEDKU
#
# Cíl:
# Ověřit celkový počet řádků ve FactFundPrice
# po dokončení incremental loadu.
#
# Pokud proběhl rollback,
# počet řádků zůstane na posledním správném stavu.
# ============================================================

cursor.execute(
    """
    SELECT COUNT(*)
    FROM analytics.FactFundPrice
    """
)

fact_row_count = cursor.fetchone()[0]

print()
print("=" * 60)
print("SQL LOAD - SOUHRN")
print("=" * 60)
print('Nově připravené řádky: ' + str(total_inserted_rows))
print('Fondy s chybou: ' + str(failed_funds))
print('Celkový počet řádků ve FactFundPrice: ' + str(fact_row_count))


# ============================================================
# 12. UKONČENÍ SQL SPOJENÍ
#
# Cíl:
# Korektně zavřít cursor a databázové spojení
# po dokončení loadu.
# ============================================================

cursor.close()

connection.close()

print()
print("Připojení k SQL Serveru bylo ukončeno.")


# ============================================================
# 13. CELKOVÝ VÝSLEDEK A EXIT CODE
#
# Cíl:
# Předat operačnímu systému výsledek SQL load fáze.
#
# exit code 0
# = všechny fondy byly zpracovány bez chyby
#
# exit code 1
# = alespoň jeden fond selhal
#
# Tento výsledek používá run_pipeline.bat.
# ============================================================

if failed_funds == 0:
    print("CELKOVÝ VÝSLEDEK: OK")
    sys.exit(0)

else:
    print("CELKOVÝ VÝSLEDEK: CHYBA")
    sys.exit(1)