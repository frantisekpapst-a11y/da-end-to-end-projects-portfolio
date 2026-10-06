import sys
import pandas as pd
import pyodbc
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from scipy.stats import pearsonr, spearmanr


# %%
# ============================================================
# 1. SQL PŘIPOJENÍ
# ============================================================

connection_string = (
    "DRIVER={ODBC Driver 18 for SQL Server};"
    "SERVER=(localdb)\\DataAnalyticsLocalDB;"
    "DATABASE=fund_performance_analytics;"
    "Trusted_Connection=yes;"
    "Encrypt=no;"
)
connection = pyodbc.connect(connection_string)

print("Připojení k SQL Serveru je OK.")


# %%
# ============================================================
# 2. SQL DOTAZ PRO ANALYTICKÁ DATA
# ============================================================

query = """
SELECT
    f.fund_key,
    f.fund_name,
    f.fund_category,
    d.date_key,
    d.calendar_date,
    p.nav_value
FROM analytics.FactFundPrice p
JOIN analytics.DimFund f
    ON p.fund_key = f.fund_key
JOIN analytics.DimDate d
    ON p.date_key = d.date_key
ORDER BY
    f.fund_name,
    d.calendar_date;
"""


# %%
# ============================================================
# 3. NAČTENÍ DAT Z SQL DO PANDAS
# ============================================================

df = pd.read_sql(query, connection)


# %%
# ============================================================
# 4. ZÁKLADNÍ KONTROLA NAČTENÝCH DAT
#
# Cíl:
# Ověřit, že:
# - DataFrame není prázdný,
# - datum má správný datový typ,
# - NAV je číselná hodnota.
# ============================================================

if df.empty:
    print("CHYBA: ze SQL nebyla načtena žádná data.")
    connection.close()
    sys.exit(1)

df["calendar_date"] = pd.to_datetime(df['calendar_date'])

df["nav_value"] = pd.to_numeric(df['nav_value'])


# %%
# ============================================================
# 5. ZÁKLADNÍ KONTROLA DATASETU
#
# Cíl:
# Získat základní přehled o analytickém datasetu.
# ============================================================

print()
print("=" * 60)
print("ZÁKLADNÍ KONTROLA DAT")
print("=" * 60)
print('Počet načtených řádků: ' + str(len(df)))
print('Počet fondů: ' + str(df['fund_key'].nunique()))
print('První datum v datech: ' + str(df['calendar_date'].min().date()))
print('Poslední datum v datech: ' + str(df['calendar_date'].max().date()))


# %%
# ============================================================
# 6. UKONČENÍ SQL SPOJENÍ
#
# Cíl:
# Po načtení dat korektně uzavřít databázové spojení.
#
# Další analytická práce bude probíhat nad DataFrame v paměti.
# ============================================================

connection.close()

print()
print("Připojení k SQL Serveru bylo ukončeno.")


# %%
# ============================================================
# PLÁN ANALÝZY
# 1. Určit společné analytické období.
# 2. Vytvořit pracovní dataset pro společné období.
# 3. Připravit základní analytické proměnné:
#    - denní výnos;
#    - normalizované NAV;
#    - kumulativní výnos;
#    - průběžné maximum NAV;
#    - drawdown;
#    - rolling 12M return.
# 4. Provést EDA:
#    - vývoj hodnoty a výnosu;
#    - riziko a propady;
#    - stabilita výkonnosti;
#    - nejlepší a nejslabší období;
#    - rozdíly mezi kategoriemi;
#    - korelace a společné poklesy.
# 5. Spočítat a dokončit hlavní KPI:
#    - cumulative return;
#    - CAGR;
#    - annualized volatility;
#    - maximum drawdown;
#    - recovery time.
# 6. Formulovat hypotézy na základě EDA.
# 7. Provést vybrané SDA testy.
# 8. Připravit analytické výstupy pro SQL a Power BI.
# 9. Shrnutí a interpretace výsledků podle
#    analytických otázek.
# ============================================================
# %%
# ============================================================
# 1. SPOLEČNÉ ANALYTICKÉ OBDOBÍ
#
# Cíl:
# Zjistit první a poslední dostupné datum pro každý fond
# a z těchto hodnot určit období, ve kterém mají data
# všechny fondy.
#
# Společný začátek:
# nejpozdější first_date.
#
# Společný konec:
# nejdřívější last_date.
# ============================================================

fund_date_ranges = (
    df.groupby(['fund_key', 'fund_name'], as_index=False)
    .agg(
        first_date=("calendar_date", "min"),
        last_date=("calendar_date", "max")
    )
)

print()
print("=" * 60)
print("ROZSAH DAT PRO JEDNOTLIVÉ FONDY")
print("=" * 60)
print(fund_date_ranges)

common_start_date = (
    fund_date_ranges["first_date"].max()
)

common_end_date = (
    fund_date_ranges["last_date"].min()
)

print()
print("=" * 60)
print("SPOLEČNÉ ANALYTICKÉ OBDOBÍ")
print("=" * 60)
print('Začátek společného období: ' + str(common_start_date.date()))
print('Konec společného období: ' + str(common_end_date.date()))


# %%
# ============================================================
# 2. PRACOVNÍ DATASET PRO SPOLEČNÉ OBDOBÍ
#
# Cíl:
# Vytvořit pracovní DataFrame pouze pro období,
# ve kterém mají dostupná data všechny fondy.
#
# Tento DataFrame budeme dále používat pro:
# - EDA,
# - SDA,
# - výpočet KPI,
# - vzájemné porovnání fondů.
# ============================================================

analysis_df = df[df['calendar_date'].between(common_start_date, common_end_date)].copy()

print()
print("=" * 60)
print("KONTROLA SPOLEČNÉHO OBDOBÍ")
print("=" * 60)
print('Počet řádků ve společném období: ' + str(len(analysis_df)))
print('Počet fondů ve společném období: ' + str(analysis_df['fund_key'].nunique()))
print('První datum: ' + str(analysis_df['calendar_date'].min().date()))
print('Poslední datum: ' + str(analysis_df['calendar_date'].max().date()))


# %%
# ============================================================
# 3. PŘÍPRAVA ZÁKLADNÍCH ANALYTICKÝCH PROMĚNNÝCH
# 3.1 DENNÍ VÝNOS
#
# Cíl:
# Spočítat procentní změnu NAV mezi dvěma po sobě
# dostupnými oceněními pro každý fond zvlášť.
#
# Denní výnos:
# (aktuální NAV / předchozí NAV) - 1
# ============================================================

# Seřazení dat podle fondu a data.

analysis_df = (
    analysis_df.sort_values(by=['fund_key', 'calendar_date']).reset_index(drop=True)
)

# Rozdělení NAV hodnot podle fondů.

fund_groups = analysis_df.groupby('fund_key')

nav_by_fund = fund_groups[
    "nav_value"
]

# Výpočet změny oproti předchozímu dostupnému ocenění.

daily_returns = nav_by_fund.pct_change()

analysis_df["daily_return"] = daily_returns

print()
print("=" * 60)
print("KONTROLA DENNÍCH VÝNOSŮ")
print("=" * 60)
print('Počet chybějících daily_return: ' + str(analysis_df['daily_return'].isna().sum()))
print('Minimální denní výnos: ' + str(analysis_df['daily_return'].min()))
print('Maximální denní výnos: ' + str(analysis_df['daily_return'].max()))


# %%
# ============================================================
# 3.2 NORMALIZOVANÉ NAV A KUMULATIVNÍ VÝNOS
#
# Cíl:
# Převést fondy na společnou základnu 100
# a spočítat výnos od začátku společného období.
# ============================================================

# Získání počáteční NAV hodnoty pro každý fond.

first_nav = (
    analysis_df.groupby(['fund_key', 'fund_name'], as_index=False)
    .agg(
        first_nav=("nav_value", "first")
    )
)

print()
print("=" * 60)
print("POČÁTEČNÍ NAV VE SPOLEČNÉM OBDOBÍ")
print("=" * 60)
print(first_nav.to_string(index=False))

# Připojení počáteční NAV ke všem řádkům daného fondu.

analysis_df = analysis_df.merge(first_nav[['fund_key', 'first_nav']], on='fund_key', how='left')

# Výpočet normalizovaného NAV a kumulativního výnosu.

analysis_df["normalized_nav"] = (
    analysis_df["nav_value"]
    / analysis_df["first_nav"]
    * 100
)

analysis_df["cumulative_return"] = (
    analysis_df["nav_value"]
    / analysis_df["first_nav"]
    - 1
)


# %%
# ============================================================
# 3.3 PRŮBĚŽNÉ MAXIMUM NAV A DRAWDOWN
#
# Cíl:
# Připravit průběžné maximum NAV a drawdown,
# které použijeme při analýze rizika a propadů.
# ============================================================

# Výpočet průběžného maxima NAV pro každý fond.

analysis_df["running_max_nav"] = (
    analysis_df.groupby('fund_key')['nav_value'].cummax()
)

# Výpočet drawdownu vůči dosavadnímu maximu NAV.

analysis_df["drawdown"] = (
    analysis_df["nav_value"]
    / analysis_df["running_max_nav"]
    - 1
)


# %%
# ============================================================
# 3.4 ROLLING 12M RETURN
#
# Cíl:
# Připravit rolling 12M return jako změnu NAV vůči hodnotě
# před 252 dostupnými oceněními.
#
# Jde o aproximaci 12 měsíců založenou na počtu
# obchodních / oceněných dnů.
# ============================================================

# Výpočet rolling 12M return pro každý fond.

analysis_df["rolling_12m_return"] = (
    analysis_df.groupby('fund_key')['nav_value'].pct_change(periods=252)
)

print()
print("=" * 60)
print("KONTROLA ROLLING 12M RETURN")
print("=" * 60)
print(
    "Počet chybějících rolling_12m_return: "
    + str(analysis_df["rolling_12m_return"].isna().sum())
)
print('Minimální rolling 12M return: ' + str(analysis_df['rolling_12m_return'].min()))
print('Maximální rolling 12M return: ' + str(analysis_df['rolling_12m_return'].max()))


# %%
# ============================================================
# 4. EDA
# 4.1 VÝVOJ HODNOTY A VÝNOSU
#
# Analytická otázka:
# Jak se vyvíjela hodnota a výnos jednotlivých fondů
# ve společném období?
#
# Cíl:
# Porovnat:
# - denní výnosy;
# - normalizovaný vývoj NAV;
# - kumulativní výnos.
# ============================================================

# Souhrn denních výnosů podle fondu.

daily_return_summary = (
    analysis_df.groupby(['fund_key', 'fund_name', 'fund_category'], as_index=False)
    .agg(
        min_daily_return=("daily_return", "min"),
        max_daily_return=("daily_return", "max"),
        mean_daily_return=("daily_return", "mean"),
        median_daily_return=("daily_return", "median")
    )
)

print()
print("=" * 60)
print("SOUHRN DENNÍCH VÝNOSŮ PODLE FONDU")
print("=" * 60)
print(daily_return_summary.to_string(index=False))

# Kontrola normalizovaného NAV a kumulativního výnosu.

eda_return_check = (
    analysis_df.groupby(['fund_key', 'fund_name'], as_index=False)
    .agg(
        first_normalized_nav=("normalized_nav", "first"),
        last_normalized_nav=("normalized_nav", "last"),
        first_cumulative_return=("cumulative_return", "first"),
        last_cumulative_return=("cumulative_return", "last")
    )
)

print()
print("=" * 60)
print("KONTROLA VÝVOJE HODNOTY A VÝNOSU")
print("=" * 60)
print(eda_return_check.to_string(index=False))

# Graf vývoje normalizovaného NAV.

plt.figure(figsize=(12, 7))

for fund_name in analysis_df["fund_name"].unique():
    fund_data = analysis_df[
        analysis_df["fund_name"] == fund_name
    ]

    plt.plot(fund_data['calendar_date'], fund_data['normalized_nav'], label=fund_name)

plt.title('Vývoj normalizovaného NAV ve společném období')

plt.xlabel('Datum')

plt.ylabel('Normalizované NAV')

plt.legend()

plt.grid()

plt.gca().xaxis.set_major_locator(mdates.MonthLocator(interval=6))

plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m'))

plt.tight_layout()

plt.show()


# %%
# ============================================================
# 4.2 RIZIKO A PROPADY
#
# Analytická otázka:
# Jak se fondy liší z hlediska rizika a velikosti propadů?
#
# Cíl:
# Porovnat:
# - maximum drawdown;
# - datum dna největšího propadu;
# - dobu zotavení;
# - průběh drawdownů v čase.
# ============================================================

# Výpočet maximum drawdown pro každý fond.

max_drawdown_summary = (
    analysis_df.groupby(['fund_key', 'fund_name', 'fund_category'], as_index=False)
    .agg(
        max_drawdown=("drawdown", "min")
    )
)

print()
print("=" * 60)
print("MAXIMUM DRAWDOWN PODLE FONDU")
print("=" * 60)
print(max_drawdown_summary.to_string(index=False))

# Získání indexu řádku s největším propadem pro každý fond.

max_drawdown_index = (
    analysis_df.groupby('fund_key')['drawdown'].idxmin()
)

# Získání řádků s největším propadem pro každý fond.

max_drawdown_rows = analysis_df.loc[
    max_drawdown_index,
    [
        "fund_key",
        "fund_name",
        "fund_category",
        "calendar_date",
        "nav_value",
        "running_max_nav",
        "drawdown"
    ]
]

print()
print("=" * 60)
print("DNA MAXIMUM DRAWDOWNU")
print("=" * 60)
print(max_drawdown_rows.to_string(index=False))

# Hledání zotavení z největšího propadu pro každý fond.

recovery_results = []

for _, row in max_drawdown_rows.iterrows():
    fund_key = row["fund_key"]
    fund_name = row["fund_name"]
    fund_category = row["fund_category"]
    drawdown_date = row["calendar_date"]
    previous_max_nav = row["running_max_nav"]
    recovery_data = analysis_df[
        (analysis_df["fund_key"] == fund_key)
        &
        (analysis_df["calendar_date"] > drawdown_date)
    ]
    recovery_data = recovery_data[
        recovery_data["nav_value"] >= previous_max_nav
    ]

    # Fond se během společného období zotavil.

    if not recovery_data.empty:
        recovery_date = (
            recovery_data.iloc[0]["calendar_date"]
        )
        recovery_days = (
            recovery_date - drawdown_date
        ).days
        recovered = True

    # Fond se do konce společného období nezotavil.

    else:
        recovery_date = pd.NaT
        recovery_days = None
        recovered = False

    recovery_results.append(
        {
            "fund_key": fund_key,
            "fund_name": fund_name,
            "fund_category": fund_category,
            "drawdown_date": drawdown_date,
            "previous_max_nav": previous_max_nav,
            "recovery_date": recovery_date,
            "recovery_days": recovery_days,
            "recovered": recovered
        }
    )

# Převod výsledků recovery time do DataFrame.

recovery_summary = pd.DataFrame(recovery_results)

print()
print("=" * 60)
print("DOBA ZOTAVENÍ PO MAXIMUM DRAWDOWNU")
print("=" * 60)
print(recovery_summary.to_string(index=False))

# Graf průběhu drawdownu všech fondů.

plt.figure(figsize=(12, 7))

for fund_name in analysis_df["fund_name"].unique():
    fund_data = analysis_df[
        analysis_df["fund_name"] == fund_name
    ]

    plt.plot(fund_data['calendar_date'], fund_data['drawdown'] * 100, label=fund_name)

plt.title('Vývoj drawdownu ve společném období')

plt.xlabel('Datum')

plt.ylabel('Drawdown (%)')

plt.axhline(y=0)

plt.legend()

plt.grid()

plt.gca().xaxis.set_major_locator(mdates.MonthLocator(interval=6))

plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m'))

plt.tight_layout()

plt.show()

# ============================================================
# DISTRIBUCE DENNÍCH VÝNOSŮ
#
# Cíl:
# Doplňkově porovnat:
# - rozptyl denních výnosů,
# - medián,
# - výskyt extrémních hodnot.
# ============================================================

analysis_df.boxplot(column='daily_return', by='fund_name', figsize=(14, 7), rot=45)

plt.title('Distribuce denních výnosů podle fondu')

plt.suptitle("")

plt.xlabel('Fond')

plt.ylabel('Denní výnos')

plt.tight_layout()

plt.show()


# %%
# ============================================================
# 4.3 STABILITA VÝKONNOSTI
#
# Analytická otázka:
# Jak stabilní byla výkonnost jednotlivých fondů v čase?
#
# Cíl:
# Porovnat:
# - minimum a maximum rolling 12M return;
# - průměr a medián rolling 12M return;
# - průběh rolling 12M return v čase.
# ============================================================

# Souhrn rolling 12M return podle fondu.

rolling_12m_summary = (
    analysis_df.groupby(['fund_key', 'fund_name', 'fund_category'], as_index=False)
    .agg(
        min_rolling_12m_return=("rolling_12m_return", "min"),
        max_rolling_12m_return=("rolling_12m_return", "max"),
        mean_rolling_12m_return=("rolling_12m_return", "mean"),
        median_rolling_12m_return=("rolling_12m_return", "median")
    )
)

print()
print("=" * 60)
print("ROLLING 12M RETURN PODLE FONDU")
print("=" * 60)
print(rolling_12m_summary.to_string(index=False))

# Graf vývoje rolling 12M return.

plt.figure(figsize=(12, 7))

for fund_name in analysis_df["fund_name"].unique():
    fund_data = analysis_df[
        analysis_df["fund_name"] == fund_name
    ]
    plt.plot(fund_data['calendar_date'], fund_data['rolling_12m_return'] * 100, label=fund_name)

plt.title('Vývoj rolling 12M return ve společném období')

plt.xlabel('Datum')

plt.ylabel('Rolling 12M return (%)')

plt.axhline(y=0)

plt.legend()

plt.grid()

plt.gca().xaxis.set_major_locator(mdates.MonthLocator(interval=6))

plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m'))

plt.tight_layout()

plt.show()


# %%
# ============================================================
# 4.4 NEJLEPŠÍ A NEJSLABŠÍ OBDOBÍ
#
# Analytická otázka:
# Jaká byla nejlepší a nejslabší období výkonnosti
# jednotlivých fondů?
#
# Cíl:
# Najít pro každý fond:
# - nejvyšší rolling 12M return,
# - nejnižší rolling 12M return,
# - začátek rolling 12M období,
# - konec rolling 12M období.
# ============================================================

# Získání počátečního data rolling 12M období.

analysis_df["rolling_12m_start_date"] = (
    analysis_df.groupby('fund_key')['calendar_date'].shift(periods=252)
)

# Získání indexu nejlepšího rolling 12M return pro každý fond.

best_12m_index = (
    analysis_df.groupby('fund_key')['rolling_12m_return'].idxmax()
)

# Získání indexu nejslabšího rolling 12M return pro každý fond.

worst_12m_index = (
    analysis_df.groupby('fund_key')['rolling_12m_return'].idxmin()
)

# Získání řádků s nejlepším rolling 12M return.

best_12m_rows = analysis_df.loc[
    best_12m_index,
    [
        "fund_key",
        "fund_name",
        "fund_category",
        "rolling_12m_start_date",
        "calendar_date",
        "rolling_12m_return"
    ]
]

# Získání řádků s nejslabším rolling 12M return.

worst_12m_rows = analysis_df.loc[
    worst_12m_index,
    [
        "fund_key",
        "fund_name",
        "fund_category",
        "rolling_12m_start_date",
        "calendar_date",
        "rolling_12m_return"
    ]
]

print()
print("=" * 60)
print("NEJLEPŠÍ 12M OBDOBÍ")
print("=" * 60)
print(best_12m_rows.to_string(index=False))
print()
print("=" * 60)
print("NEJSLABŠÍ 12M OBDOBÍ")
print("=" * 60)
print(worst_12m_rows.to_string(index=False))


# %%
# ============================================================
# 4.5 ROZDÍLY MEZI KATEGORIEMI
#
# Analytická otázka:
# Jaké rozdíly lze pozorovat mezi vybranými akciovými,
# smíšenými a dluhopisovými fondy?
#
# Poznámka:
# V každé kategorii jsou pouze 2 záměrně vybrané fondy.
# Výsledky proto popisují pouze tento vybraný vzorek
# a nelze je zobecňovat na celé kategorie fondů.
# ============================================================

# Přehled dosud vypočtených metrik podle jednotlivých fondů.

category_comparison = (
    analysis_df.groupby(['fund_key', 'fund_name', 'fund_category'])
    .agg(
        cumulative_return=("cumulative_return", "last"),
        maximum_drawdown=("drawdown", "min"),
        rolling_12m_min=("rolling_12m_return", "min"),
        rolling_12m_max=("rolling_12m_return", "max"),
        rolling_12m_mean=("rolling_12m_return", "mean")
    )
    .reset_index()
)

print()
print("=" * 60)
print("POROVNÁNÍ FONDŮ PODLE KATEGORIÍ")
print("=" * 60)
print(category_comparison.to_string(index=False))


# %%
# ============================================================
# 4.6 KORELACE A SPOLEČNÉ POKLESY
#
# Analytická otázka:
# Do jaké míry se fondy pohybují společně
# a jak se chovají během poklesů?
#
# Cíl:
# - porovnat korelaci denních výnosů;
# - identifikovat společné poklesové dny;
# - ověřit pozorování z předchozí EDA.
# ============================================================

# Převod denních výnosů z long do wide formátu.

daily_return_pivot = analysis_df.pivot(
    index="calendar_date",
    columns="fund_name",
    values="daily_return"
)

# Výpočet korelace denních výnosů.

return_correlation = (
    daily_return_pivot.corr()
)

print()
print("=" * 60)
print("KORELACE DENNÍCH VÝNOSŮ")
print("=" * 60)
print(return_correlation.to_string())

# ============================================================
# SPOLEČNÉ POKLESY
#
# Cíl:
# Zjistit, kolik fondů mělo ve stejný den záporný výnos.
#
# Používáme pouze dny, kdy je dostupný denní výnos
# pro všech 6 fondů.
# ============================================================

# Výpočet počtu klesajících fondů v jednotlivých dnech.

common_declines = (
    (daily_return_pivot.dropna() < 0).sum(axis=1)
)

print()
print("=" * 60)
print("POČET KLESAJÍCÍCH FONDŮ PODLE DNE")
print("=" * 60)
print(common_declines.head(10).to_string())

# Výběr dnů, kdy klesalo alespoň 5 z 6 fondů.

strong_common_declines = common_declines[
    common_declines >= 5
]

print()
print("=" * 60)
print("DNY, KDY KLESALO ALESPOŇ 5 Z 6 FONDŮ")
print("=" * 60)
print(strong_common_declines.to_string())

# Souhrn podle počtu klesajících fondů.

decline_summary = (
    common_declines.value_counts().sort_index()
)

print()
print("=" * 60)
print("SOUHRN POČTU KLESAJÍCÍCH FONDŮ")
print("=" * 60)
print(decline_summary.to_string())

# Počet dnů, kdy klesalo všech 6 fondů.

all_funds_decline_days = (common_declines == 6).sum()

# Počet dnů, kdy klesalo alespoň 5 z 6 fondů.

strong_common_decline_days = (common_declines >= 5).sum()

print()
print("=" * 60)
print("SOUHRN SPOLEČNÝCH POKLESŮ")
print("=" * 60)
print('Počet dnů, kdy klesalo všech 6 fondů: ' + str(all_funds_decline_days))
print('Počet dnů, kdy klesalo alespoň 5 z 6 fondů: ' + str(strong_common_decline_days))


# %%
# ============================================================
# 5. HLAVNÍ KPI
#
# Cíl:
# Dokončit a sjednotit hlavní KPI:
# - cumulative return;
# - CAGR;
# - annualized volatility;
# - maximum drawdown;
# - recovery time.
# ============================================================
# ============================================================
# 5.1 CAGR
#
# Cíl:
# Spočítat průměrné roční tempo růstu za celé
# společné analytické období.
#
# CAGR zohledňuje složené úročení a délku období.
# ============================================================

# Výpočet délky společného období v letech.

analysis_years = (
    (common_end_date - common_start_date).days
    / 365.25
)

print()
print("=" * 60)
print("DÉLKA SPOLEČNÉHO OBDOBÍ")
print("=" * 60)
print('Počet let: ' + str(analysis_years))

# Výpočet počáteční a konečné NAV hodnoty pro každý fond.

cagr_summary = (
    analysis_df.groupby(['fund_key', 'fund_name', 'fund_category'], as_index=False)
    .agg(
        first_nav=("nav_value", "first"),
        last_nav=("nav_value", "last")
    )
)

# Výpočet CAGR.

cagr_summary["cagr"] = (
    (
        cagr_summary["last_nav"]
        / cagr_summary["first_nav"]
    )
    ** (1 / analysis_years)
    - 1
)

print()
print("=" * 60)
print("CAGR PODLE FONDU")
print("=" * 60)
print(cagr_summary.to_string(index=False))

# ============================================================
# 5.2 ANUALIZOVANÁ VOLATILITA
#
# Cíl:
# Spočítat volatilitu denních výnosů
# a převést ji na roční úroveň.
#
# Annualized volatility:
# směrodatná odchylka denních výnosů
# × odmocnina z 252.
# ============================================================

annualized_volatility_summary = (
    analysis_df.groupby(['fund_key', 'fund_name', 'fund_category'], as_index=False)
    .agg(
        daily_volatility=("daily_return", "std")
    )
)

annualized_volatility_summary["annualized_volatility"] = (
    annualized_volatility_summary["daily_volatility"]
    * (252 ** 0.5)
)

print()
print("=" * 60)
print("ANUALIZOVANÁ VOLATILITA PODLE FONDU")
print("=" * 60)
print(annualized_volatility_summary.to_string(index=False))

# ============================================================
# 5.3 FINÁLNÍ KPI SOUHRN
#
# Cíl:
# Spojit všechny hlavní KPI do jedné tabulky:
# - cumulative return;
# - CAGR;
# - annualized volatility;
# - maximum drawdown;
# - recovery time.
# ============================================================

# Základ finální KPI tabulky.

kpi_summary = category_comparison[
    ['fund_key', 'fund_name', 'fund_category', 'cumulative_return', 'maximum_drawdown']
]

# Připojení CAGR.

kpi_summary = kpi_summary.merge(cagr_summary[['fund_key', 'cagr']], on='fund_key', how='left')

# Připojení annualized volatility.

kpi_summary = kpi_summary.merge(
    annualized_volatility_summary[
        ['fund_key', 'annualized_volatility']
    ],
    on="fund_key",
    how="left"
)

# Připojení recovery time.

kpi_summary = kpi_summary.merge(
    recovery_summary[
        ['fund_key', 'recovery_days', 'recovered']
    ],
    on="fund_key",
    how="left"
)

print()
print("=" * 60)
print("FINÁLNÍ KPI SOUHRN")
print("=" * 60)
print(kpi_summary.to_string(index=False))


# %%
# ============================================================
# 6. HYPOTÉZY NA ZÁKLADĚ EDA
#&#x20;
# Hypotéza 1 – souvislost denních výnosů obou smíšených fondů:
#
# H0: Mezi denními výnosy fondů ČSOB Premium Velmi odvážný
# a ČSOB Premium Velmi odvážný zodpovědný není statisticky
# významná souvislost.
# H1: Mezi denními výnosy těchto dvou fondů existuje kladná
# statisticky významná souvislost.
#
# Hypotéza 2 – souvislost fondu Digitalizace se smíšenými fondy:
# H0: Mezi denními výnosy fondu Digitalizace a vybraných&#x20;
# smíšených fondů není statisticky významná souvislost.
# H1: Mezi denními výnosy fondu Digitalizace a vybraných&#x20;
# smíšených fondů existuje kladná statisticky významná&#x20;
# souvislost.
#
# Obě hypotézy budou ověřeny pomocí Pearsonovy a Spearmanovy
# korelace.
# ============================================================
# %%
# ============================================================
# 7. SDA
# 7.1 OVĚŘENÍ SOUVISLOSTI OBOU SMÍŠENÝCH FONDŮ
#
# Hypotéza:
#
# H0:
# Mezi denními výnosy obou smíšených fondů
# není kladná korelace.
#
# H1:
# Mezi denními výnosy obou smíšených fondů
# existuje kladná korelace.
#
# Použité testy:
# - Pearsonova korelace;
# - Spearmanova korelace.
# ============================================================

fund_a = "ČSOB Premium Velmi odvážný"
fund_b = "ČSOB Premium Velmi odvážný zodpovědný"

# Výběr pouze dnů, kdy mají oba fondy dostupný denní výnos.

pair_data = (
    daily_return_pivot[[fund_a, fund_b]].dropna()
)

# Pearsonova korelace.

pearson_result = pearsonr(pair_data[fund_a], pair_data[fund_b], alternative='greater')

# Spearmanova korelace.

spearman_result = spearmanr(pair_data[fund_a], pair_data[fund_b], alternative='greater')

print()
print("=" * 60)
print("SDA – OBA SMÍŠENÉ FONDY")
print("=" * 60)
print('Počet společných pozorování: ' + str(len(pair_data)))
print()
print('Pearson correlation: ' + str(pearson_result.statistic))
print('Pearson p-value: ' + str(pearson_result.pvalue))
print()
print('Spearman correlation: ' + str(spearman_result.statistic))
print('Spearman p-value: ' + str(spearman_result.pvalue))

# ============================================================
# 7.2 OVĚŘENÍ SOUVISLOSTI FONDU DIGITALIZACE
# SE SMÍŠENÝMI FONDY
#
# Cíl:
# Ověřit dvě silné korelace nalezené v EDA:
#
# - Digitalizace × Premium Velmi odvážný;
# - Digitalizace × Premium Velmi odvážný zodpovědný.
#
# Použité testy:
# - Pearsonova korelace;
# - Spearmanova korelace.
# ============================================================

fund_digitalization = (
    "ČSOB Akciový pro digitalizaci zodpovědný"
)

fund_mixed_1 = (
    "ČSOB Premium Velmi odvážný"
)

fund_mixed_2 = (
    "ČSOB Premium Velmi odvážný zodpovědný"
)

# ============================================================
# Digitalizace × Premium Velmi odvážný
# ============================================================

pair_data_1 = (
    daily_return_pivot[[fund_digitalization, fund_mixed_1]].dropna()
)

pearson_result_1 = pearsonr(
    pair_data_1[fund_digitalization],
    pair_data_1[fund_mixed_1],
    alternative="greater"
)

spearman_result_1 = spearmanr(
    pair_data_1[fund_digitalization],
    pair_data_1[fund_mixed_1],
    alternative="greater"
)

print()
print("=" * 60)
print("SDA – DIGITALIZACE × PREMIUM VELMI ODVÁŽNÝ")
print("=" * 60)
print('Počet společných pozorování: ' + str(len(pair_data_1)))
print()
print('Pearson correlation: ' + str(pearson_result_1.statistic))
print('Pearson p-value: ' + str(pearson_result_1.pvalue))
print()
print('Spearman correlation: ' + str(spearman_result_1.statistic))
print('Spearman p-value: ' + str(spearman_result_1.pvalue))

# ============================================================
# Digitalizace × Premium Velmi odvážný zodpovědný
# ============================================================

pair_data_2 = (
    daily_return_pivot[[fund_digitalization, fund_mixed_2]].dropna()
)

pearson_result_2 = pearsonr(
    pair_data_2[fund_digitalization],
    pair_data_2[fund_mixed_2],
    alternative="greater"
)

spearman_result_2 = spearmanr(
    pair_data_2[fund_digitalization],
    pair_data_2[fund_mixed_2],
    alternative="greater"
)

print()
print("=" * 60)
print("SDA – DIGITALIZACE × PREMIUM VELMI ODVÁŽNÝ ZODPOVĚDNÝ")
print("=" * 60)
print('Počet společných pozorování: ' + str(len(pair_data_2)))
print()
print('Pearson correlation: ' + str(pearson_result_2.statistic))
print('Pearson p-value: ' + str(pearson_result_2.pvalue))
print()
print('Spearman correlation: ' + str(spearman_result_2.statistic))
print('Spearman p-value: ' + str(spearman_result_2.pvalue))


# %%
# # ============================================================
# 8. PŘÍPRAVA ANALYTICKÝCH VÝSTUPŮ PRO SQL
#
# Cíl:
# Připravit dva DataFrame:
#
# 1. daily_output_df
#    → denní analytické metriky
#
# 2. summary_output_df
#    → souhrnné KPI podle fondu
# ============================================================

# ============================================================
# 8.1 DENNÍ ANALYTICKÝ VÝSTUP
# ============================================================

daily_output_df = analysis_df[
    [
        "fund_key",
        "date_key",
        "daily_return",
        "normalized_nav",
        "cumulative_return",
        "drawdown",
        "rolling_12m_return"
    ]
].copy()

print()
print("=" * 60)
print("DAILY OUTPUT PRO SQL")
print("=" * 60)
print(daily_output_df.head(10).to_string(index=False))
print()
print('Počet řádků: ' + str(len(daily_output_df)))
print()
print('Sloupce: ' + str(daily_output_df.columns.tolist()))

# ============================================================
# 8.2 SOUHRNNÝ KPI VÝSTUP
# ============================================================

summary_output_df = kpi_summary[
    [
        "fund_key",
        "cumulative_return",
        "cagr",
        "annualized_volatility",
        "maximum_drawdown",
        "recovery_days",
        "recovered"
    ]
].copy()

summary_output_df["period_start"] = common_start_date

summary_output_df["period_end"] = common_end_date

summary_output_df = summary_output_df[
    [
        "fund_key",
        "period_start",
        "period_end",
        "cumulative_return",
        "cagr",
        "annualized_volatility",
        "maximum_drawdown",
        "recovery_days",
        "recovered"
    ]
]

print()
print("=" * 60)
print("SUMMARY OUTPUT PRO SQL")
print("=" * 60)
print(summary_output_df.to_string(index=False))
print()
print('Počet řádků: ' + str(len(summary_output_df)))
print()
print('Sloupce: ' + str(summary_output_df.columns.tolist()))

# ============================================================
# 8.3 ZÁPIS ANALYTICKÝCH VÝSTUPŮ DO SQL
#
# Cíl:
# Uložit analytické výstupy z Pythonu do SQL Serveru.
#
# Analytické tabulky obsahují odvozené výsledky,
# proto při novém výpočtu provedeme full refresh:
#
# 1. odstranit předchozí analytické výsledky;
# 2. vložit aktuální výsledky;
# 3. potvrdit změny pouze při úspěšném zápisu.
# ============================================================

connection = pyodbc.connect(connection_string)

cursor = connection.cursor()

print()
print("Připojení k SQL Serveru je OK.")

daily_insert_query = """
INSERT INTO analytics.FactFundPerformanceDaily (
    fund_key,
    date_key,
    daily_return,
    normalized_nav,
    cumulative_return,
    drawdown,
    rolling_12m_return
)
VALUES (?, ?, ?, ?, ?, ?, ?)
"""

summary_insert_query = """

INSERT INTO analytics.FundPerformanceSummary (
    fund_key,
    period_start,
    period_end,
    cumulative_return,
    cagr,
    annualized_volatility,
    maximum_drawdown,
    recovery_days,
    recovered
)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
"""

daily_rows_to_insert = []

for row in daily_output_df.itertuples(index=False):
    daily_rows_to_insert.append(
        (
            int(row.fund_key),
            int(row.date_key),
            None if pd.isna(row.daily_return)
            else float(row.daily_return),
            float(row.normalized_nav),
            float(row.cumulative_return),
            float(row.drawdown),
            None if pd.isna(row.rolling_12m_return)
            else float(row.rolling_12m_return)
        )
    )

summary_rows_to_insert = []
for row in summary_output_df.itertuples(index=False):
    summary_rows_to_insert.append(
        (
            int(row.fund_key),
            pd.to_datetime(row.period_start).date(),
            pd.to_datetime(row.period_end).date(),
            float(row.cumulative_return),
            float(row.cagr),
            float(row.annualized_volatility),
            float(row.maximum_drawdown),
            None if pd.isna(row.recovery_days)
            else int(row.recovery_days),
            int(row.recovered)
        )
    )

sql_write_success = True

try:
    cursor.execute(
        """
        DELETE FROM analytics.FundPerformanceSummary
        """
    )
    cursor.execute(
        """
        DELETE FROM analytics.FactFundPerformanceDaily
        """
    )

    cursor.executemany(daily_insert_query, daily_rows_to_insert)

    cursor.executemany(summary_insert_query, summary_rows_to_insert)

except Exception as error:
    sql_write_success = False
    print()
    print("CHYBA při zápisu analytických výstupů do SQL:")
    print(str(error))

if sql_write_success:
    connection.commit()
    print()
    print("SQL změny byly potvrzeny.")

else:
    connection.rollback()
    print()
    print("SQL změny nebyly potvrzeny. Byl proveden rollback.")

cursor.execute(
    """
    SELECT COUNT(*)
    FROM analytics.FactFundPerformanceDaily
    """
)

daily_row_count = cursor.fetchone()[0]

cursor.execute(
    """
    SELECT COUNT(*)
    FROM analytics.FundPerformanceSummary
    """
)

summary_row_count = cursor.fetchone()[0]

print()
print("=" * 60)
print("SQL ANALYTICKÉ VÝSTUPY - SOUHRN")
print("=" * 60)
print('Připravené denní řádky: ' + str(len(daily_rows_to_insert)))
print('Řádky ve FactFundPerformanceDaily: ' + str(daily_row_count))
print('Připravené KPI řádky: ' + str(len(summary_rows_to_insert)))
print('Řádky ve FundPerformanceSummary: ' + str(summary_row_count))

cursor.close()

connection.close()

print()
print("Připojení k SQL Serveru bylo ukončeno.")


# ============================================================
# CELKOVÝ VÝSLEDEK A EXIT CODE
# ============================================================

if sql_write_success:
    print("CELKOVÝ VÝSLEDEK: OK")
    sys.exit(0)

else:
    print("CELKOVÝ VÝSLEDEK: CHYBA")
    sys.exit(1)