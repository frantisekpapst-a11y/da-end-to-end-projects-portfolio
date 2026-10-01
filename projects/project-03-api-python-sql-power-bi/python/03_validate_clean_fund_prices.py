import json
import sys
from pathlib import Path
import pandas as pd


# ============================================================
# 1. SEZNAM FONDŮ
#
# Cíl:
# Definovat fondy, které budou ve validačním procesu
# postupně zkontrolovány.
#
# fund_id používáme:
# - pro vyhledání správného raw JSON souboru,
# - jako technický identifikátor fondu.
#
# fund_name používáme pro čitelný výstup v terminálu.
# ============================================================

FUNDS = [
    {
        "fund_name": "ČSOB Akciový pro digitalizaci zodpovědný",
        "fund_id": "BE6339813873_1"
    },
    {
        "fund_name": "ČSOB Akciový srdce Evropy",
        "fund_id": "CZ0008472610_1"
    },
    {
        "fund_name": "ČSOB Premium Velmi odvážný",
        "fund_id": "BE6285921308_13"
    },
    {
        "fund_name": "ČSOB Premium Velmi odvážný zodpovědný",
        "fund_id": "CZ0008477080_13"
    },
    {
        "fund_name": "ČSOB Krátkodobý",
        "fund_id": "BE0173476400_2"
    },
    {
        "fund_name": "ČSOB Dluhopisový",
        "fund_id": "770000001147_2"
    }
]


# ============================================================
# 2. FUNKCE PRO NALEZENÍ NEJNOVĚJŠÍHO RAW SOUBORU
#
# Cíl:
# Najít nejnovější JSON snapshot pro konkrétní fund_id.
#
# Raw soubory používají název:
# fund_id + timestamp + .json
#
# Díky tomu lze pomocí max() vybrat nejnovější soubor.
#
# Pokud pro fond žádný soubor neexistuje, funkce vrátí None.
# ============================================================

def get_latest_file(raw_folder, fund_id):
    files = list(raw_folder.glob(fund_id + "_*.json"))

    if not files:
        return None

    latest_file = max(files)
    return latest_file


# ============================================================
# 3. FUNKCE PRO NAČTENÍ RAW JSON
#
# Cíl:
# Načíst uložený raw JSON snapshot do Pythonu.
#
# json.load() převede obsah JSON souboru
# na Python datovou strukturu.
#
# with open() zajistí korektní otevření
# a následné zavření souboru.
# ============================================================

def load_raw_json(file_path):
    with open(file_path, "r", encoding="utf-8") as file:
        data = json.load(file)

    return data


# ============================================================
# 4. FUNKCE PRO TECHNICKOU TRANSFORMACI DAT
#
# Cíl:
# Převést raw data do pandas DataFrame
# a připravit datum pro další validaci a SQL load.
#
# Raw endpoint vrací:
# - timestamp v milisekundách,
# - NAV hodnotu.
#
# Timestamp převádíme:
# milliseconds -> UTC -> Europe/Prague -> date.
#
# Raw timestamp i původní NAV zůstávají zachované.
# ============================================================


def prepare_dataframe(data):
    df = pd.DataFrame(
        data,
        columns=[
            "timestamp_ms",
            "nav_value"
        ]
    )

    df["date"] = (
        pd.to_datetime(
            df["timestamp_ms"],
            unit="ms",
            utc=True
        )
        .dt.tz_convert("Europe/Prague")
    )

    df["date"] = df["date"].dt.date

    return df


# ============================================================
# 5. FUNKCE PRO BEZPEČNÝ TECHNICKÝ CLEANING
#
# Cíl:
# Odstranit pouze úplně identické řádky,
# které nepřinášejí novou informaci.
#
# Záměrně neopravujeme:
# - chybějící hodnoty,
# - záporné nebo nulové NAV,
# - konfliktní hodnoty pro stejný timestamp,
# - chronologické pořadí.
#
# Tyto problémy mají být odhaleny validací,
# ne automaticky skryty cleaningem.
# ============================================================

def clean_dataframe(df):
    rows_before = len(df)

    df = df.drop_duplicates()

    rows_after = len(df)

    removed_duplicates = rows_before - rows_after

    print("Odstraněné přesné duplicity: " + str(removed_duplicates))

    df = df.reset_index(drop=True)

    return df


# ============================================================
# 6. FUNKCE PRO VALIDACI DAT
#
# Cíl:
# Ověřit základní technickou a business kvalitu dat
# před jejich načtením do SQL.
#
# Kontrolujeme:
# - missing values,
# - duplicitní timestampy,
# - NAV <= 0,
# - chronologické pořadí.
#
# Pokud některá kontrola selže,
# validation_ok se nastaví na False.
# ============================================================

def validate_dataframe(df):
    validation_ok = True

    missing_values = df.isna().sum().sum()

    print()
    print("Počet missing values: " + str(missing_values))

    if missing_values > 0:
        print("CHYBA: data obsahují missing values.")
        validation_ok = False

    duplicate_timestamps = df["timestamp_ms"].duplicated().sum()

    print("Počet duplicitních timestampů: " + str(duplicate_timestamps))

    if duplicate_timestamps > 0:
        print("CHYBA: nalezen duplicitní timestamp.")
        validation_ok = False

    invalid_nav = (df["nav_value"] <= 0).sum()

    print("Počet NAV <= 0: " + str(invalid_nav))

    if invalid_nav > 0:
        print("CHYBA: nalezena neplatná NAV hodnota.")
        validation_ok = False

    chronological_order = df["date"].is_monotonic_increasing

    print("Chronologické pořadí: " + str(chronological_order))

    if not chronological_order:
        print("CHYBA: data nejsou chronologicky seřazená.")
        validation_ok = False

    return validation_ok


# ============================================================
# 7. CESTA K PROJEKTU A RAW SLOŽCE
#
# Cíl:
# Odvodit cestu k projektu podle umístění tohoto .py souboru.
#
# __file__
# = aktuální Python soubor
#
# .parent
# = složka python
#
# .parent.parent
# = hlavní složka projektu
#
# Díky tomu nezáleží na tom,
# z jaké složky skript spustíme.
# ============================================================

project_folder = Path(__file__).resolve().parent.parent

raw_folder = project_folder / "data" / "raw" / "funds_prices"


# ============================================================
# 8. SOUHRNNÁ POČÍTADLA VALIDACE
#
# Cíl:
# Evidovat počet úspěšných a neúspěšných validací.
#
# Na konci skriptu podle nich vytvoříme
# celkový výsledek validační fáze.
# ============================================================

successful_validations = 0
failed_validations = 0


# ============================================================
# 9. VALIDACE VŠECH FONDŮ
#
# Cíl:
# Pro každý fond:
# 1. najít nejnovější raw snapshot,
# 2. načíst JSON,
# 3. připravit DataFrame,
# 4. provést bezpečný cleaning,
# 5. validovat data,
# 6. zaznamenat výsledek.
#
# Pokud raw soubor neexistuje,
# fond je označen jako neúspěšný
# a skript pokračuje dalším fondem.
# ============================================================

for fund in FUNDS:
    fund_id = fund["fund_id"]

    print()
    print("=" * 60)
    print("Kontroluji: " + fund["fund_name"])
    print("=" * 60)

    latest_file = get_latest_file(raw_folder, fund_id)

    if latest_file is None:
        print("CHYBA: pro fond nebyl nalezen žádný raw soubor.")
        failed_validations += 1
        continue

    print("Nejnovější raw soubor:")
    print(latest_file)

    data = load_raw_json(latest_file)

    print("Počet načtených záznamů: " + str(len(data)))

    df = prepare_dataframe(data)

    df = clean_dataframe(df)

    validation_ok = validate_dataframe(df)

    print("První datum: " + str(df["date"].min()))
    print("Poslední datum: " + str(df["date"].max()))

    if validation_ok:
        print("VALIDACE OK")
        successful_validations += 1

    else:
        print("VALIDACE CHYBA")
        failed_validations += 1


# ============================================================
# 10. SOUHRN VALIDACE
#
# Cíl:
# Zobrazit celkový výsledek validační fáze
# pro všech šest sledovaných fondů.
#
# Pokud všechny fondy projdou,
# failed_validations bude 0.
# ============================================================

print()
print("=" * 60)
print("SOUHRN VALIDACE")
print("=" * 60)
print(
    "Úspěšné validace: "
    + str(successful_validations)
    + " / "
    + str(len(FUNDS))
)
print("Neúspěšné validace: " + str(failed_validations))


# ============================================================
# 11. EXIT CODE PRO AUTOMATIZACI
#
# Cíl:
# Předat operačnímu systému informaci,
# zda validační fáze proběhla úspěšně.
#
# exit code 0
# = validace proběhla úspěšně
#
# exit code 1
# = alespoň jedna validace selhala
#
# Později tento výsledek využije .bat soubor.
# Pokud validace selže, SQL load se nespustí.
# ============================================================

if failed_validations == 0:
    print("CELKOVÝ VÝSLEDEK: OK")
    sys.exit(0)

else:
    print("CELKOVÝ VÝSLEDEK: CHYBA")
    sys.exit(1)