# Analytical Model and KPI

Tento dokument stručně popisuje analytickou vrstvu, Power BI model a hlavní KPI projektu.

```text
clean
→ analytics
→ Power BI model
→ DAX
→ dashboard
```

---

# 1. Analytical Layer

Hlavní fact tabulka:
```text
analytics.FactZakaznikMesic
```

Granularita:
```text
1 řádek = 1 zákazník × 1 relevantní měsíc
```

Období:
```text
09/2024–08/2026
```

Počet řádků:
```text
756 235
```

Fact tabulka obsahuje měsíční stav zákazníka od jeho první aktivace. Neaktivní měsíce mezi ukončením a případnou reaktivací zůstávají zachované, protože jsou potřebné pro výpočet základny reaktivace.

## Hlavní business logika

| Atribut                   | Význam |
| `aktivni_na_zacatku`      | zákazník byl aktivní poslední den předchozího měsíce |
| `aktivni_na_konci`        | zákazník byl aktivní poslední den aktuálního měsíce |
| `nova_aktivace`           | první aktivace zákazníka |
| `ukonceni_predplatneho`   | předplatné skončilo v aktuálním měsíci |
| `churn`                   | zákazník byl aktivní na začátku měsíce a během měsíce ukončil předplatné |
| `reaktivace`              | nové předplatné zákazníka, který už měl předchozí předplatné |
| `baze_reaktivace`         | zákazník už dříve odešel a na začátku měsíce je neaktivní |
| `typ_predplatneho`        | `Prvni` / `Reaktivovane` |
| `delka_predplatneho_mesice` | délka aktuálního předplatného v měsících |
| `duvod_zruseni`           | důvod ukončení v měsíci odchodu |
| `doba_do_reaktivace_dny`  | počet dní mezi ukončením a návratem |
| `trzby`                   | měsíční fakturovaná částka |

Případy podpory byly agregovány na úroveň:
```text
1 zákazník × 1 měsíc
```

a uloženy jako:
```text
pocet_pripadu_podpory
```

---

# 2. Fact and Dimensions

Analytická vrstva používá jednoduché hvězdicové schéma.

## Fact
```text
analytics.FactZakaznikMesic
```

## Dimensions
```text
analytics.DimZakaznik
```

```text
analytics.DimTarif
```

```text
analytics.DimMesic
```

Počty řádků:
```text
FactZakaznikMesic → 756 235
DimZakaznik       → 40 000
DimTarif          → 3
DimMesic          → 24
```

---

# 3. Power BI Model

Power BI načítá pouze analytickou vrstvu.

Power Query slouží hlavně pro načtení dat a kontrolu datových typů. Hlavní transformační a business logika zůstává v SQL.

Vztahy:
```text
DimZakaznik[zakaznik_id]    1 → * FactZakaznikMesic[zakaznik_id]
DimTarif[tarif_id]          1 → * FactZakaznikMesic[tarif_id]
DimMesic[mesic]             1 → * FactZakaznikMesic[mesic]
```

Všechny vztahy jsou aktivní a jednosměrné z dimenze do fact tabulky.

Pro analýzu délky předplatného byly použity skupiny:

```text
1–3 měsíce
4–6 měsíců
7–12 měsíců
13–24 měsíců
25+ měsíců
```

---

# 4. KPI and DAX

Míry jsou uloženy v tabulce:
```text
KPI_miry
```

Hlavních KPI je pět:
```text
Aktivní zákazníci
Nové aktivace
Míra churnu
Míra reaktivace
Tržby
```

## Aktivní zákazníci

```DAX
Aktivni zakaznici =
CALCULATE(
    COUNTROWS('analytics FactZakaznikMesic');
    'analytics FactZakaznikMesic'[aktivni_na_konci] = TRUE()
)
```

## Nové aktivace

```DAX
Nove aktivace =
CALCULATE(
    COUNTROWS('analytics FactZakaznikMesic');
    'analytics FactZakaznikMesic'[nova_aktivace] = TRUE()
)
```

## Míra churnu

```DAX
Mira churnu =
DIVIDE(
    [Pocet churnu];
    [Zakaznici na zacatku mesice];
    0
)
```

## Míra reaktivace

```DAX
Mira reaktivace =
DIVIDE(
    [Pocet reaktivaci];
    [Baze reaktivace]
)
```

## Tržby

```DAX
Mesicni trzby =
SUM('analytics FactZakaznikMesic'[trzby])
```

Podpůrné míry pro analýzu délky předplatného:
```DAX
Mira odchodu podle delky =
DIVIDE(
    [Pocet ukonceni];
    [Pocet zakaznickych mesicu]
)
```

Tato measure používá všechna ukončení předplatného, ne pouze churn z počáteční zákaznické základny.

---

# 5. Validace analytické vrstvy

Po vytvoření analytics vrstvy byly ověřeny hlavní počty a business pravidla:
```text
Ppčet řádků ve fact     → 756 235
Zákazníci               → 40 000
Období                  → 09/2024–08/2026
Nové aktivace           → 18 000
Ukončení                → 14 528
Churn                   → 14 035
Reaktivace              → 4 277
Tržby                   → 221 173 272
```

Kontroly business logiky:
```text
churn logic errors        → 0
reactivation logic errors → 0
```

Kontroly vazeb na dimenze:
```text
missing customer links → 0
missing tariff links   → 0
missing month links    → 0
```

---

# 6. Validace DAX proti SQL

Hlavní DAX KPI byly ověřeny proti SQL.

Příklad pro 08/2026:
```text
Aktivní zákazníci → 29 765
Nové aktivace     → 653
Churn             → 667
Míra churnu       → 2,26 %
Reaktivace        → 245
Míra reaktivace   → 2,50 %
Tržby             → 10 549 662
```

Power BI hodnoty odpovídaly SQL výsledkům.

---

# Výsledek

Projekt používá tento model:
```text
clean
→ FactZakaznikMesic + Dimensions
→ Power BI relationships
→ DAX measures
→ KPI
→ dashboard
```

SQL obsahuje business logiku a Power BI zajišťuje dynamické výpočty podle aktuálního filtru.