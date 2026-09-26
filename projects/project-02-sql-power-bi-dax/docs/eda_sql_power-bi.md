# Exploratory Data Analysis

Tento dokument shrnuje hlavní výsledky SQL EDA a ověření v Power BI.

Analýza odpovídá na pět hlavních otázek:
```text
1. Jak se vyvíjí zákaznická základna, churn a retence?
2. Kteří zákazníci odcházejí a proč?
3. Jak se odchod mění s délkou předplatného?
4. Jak často se zákazníci vracejí?
5. Jaký je finanční význam zákaznické základny a churnu?
```

---

# 1. Zákaznická základna, churn a retence

Počet aktivních zákazníků vzrostl z **22 176 v 09/2024** na **29 765 v 08/2026**, tedy o **7 589 zákazníků (+34,2 %)**.

Měsíční churn rate se během období pohyboval přibližně mezi **2,0–2,6 %** a zůstal relativně stabilní.

Při srovnání leden–srpen 2025 a 2026:

| Ukazatel                          | 2025 | 2026 |
| Průměrné nové aktivace / měsíc    | ~749 | ~736 |
| Průměrná ukončení / měsíc         | ~583 | ~665 |
| Průměrný rozdíl aktivace − ukončení | +166 | +71 |

V červenci a srpnu 2026 byl rozdíl mezi novými aktivacemi a ukončeními záporný:
```text
07/2026 → -62
08/2026 → -36
```

Zákaznická základna přesto dále rostla, mimo jiné díky reaktivacím.

### Závěr

```text
zákaznická základna roste
+
churn rate zůstává stabilní
+
tempo čistého růstu v roce 2026 zpomaluje
```

---

# 2. Churn podle zákaznických segmentů

## Tarif

| Tarif     | Počet churnů  | Míra churnu |
| Basic     | 5 326         | 2,52 % |
| Standard  | 6 128         | 2,20 % |
| Premium   | 2 581         | 2,03 % |

Basic má nejvyšší churn rate.

Power BI meziroční kontrola potvrdila stejný vzorec:

```text
Basic
2025 → 2,53 %
2026 → 2,53 %

Standard
2025 → 2,25 %
2026 → 2,15 %

Premium
2025 → 2,09 %
2026 → 1,99 %
```

## Region

| Region            | Počet churnů  | Míra churnu |
| Moravian-Silesian | 2 737         | 2,47 % |
| Other             | 2 634         | 2,34 % |
| Central Bohemia   | 2 252         | 2,29 % |
| South Moravia     | 2 727         | 2,26 % |
| Prague            | 3 685         | 2,10 % |

Praha má nejvyšší absolutní počet churnů, ale současně nejnižší churn rate.

Regionální pořadí není tak stabilní jako tarifní.
V Power BI srovnání:

```text
01–08/2025
Moravian-Silesian → 2,56 %
Prague → 2,14 %

01–08/2026
Other → 2,36 %
Moravian-Silesian → 2,35 %
Prague → 2,05 %
```

## První vs. reaktivované předplatné

| Typ předplatného  | Počet churnů  | Míra churnu |
| Reaktivované      | 1 022         | 3,14 % |
| První             | 13 013        | 2,22 % |

Reaktivovaná předplatná mají churn vyšší o **0,92 procentního bodu**.

### Závěr

```text
nejvyšší churn rate
→ Basic

regionální rozdíly
→ méně stabilní

reaktivované předplatné
→ vyšší churn než první
```

---

# 3. Důvody ukončení

| Důvod ukončení    | Počet ukončení | Podíl |
| Technical Issues  | 2 829 | 19,47 % |
| Price             | 2 819 | 19,40 % |
| Low Usage         | 2 741 | 18,87 % |
| Competitor        | 2 188 | 15,06 % |
| Content Selection | 1 600 | 11,01 % |
| Moving            | 1 030 | 7,09 % |
| Other             | 1 024 | 7,05 % |
| Neuvedeno         | 297   | 2,04 % |

První tři důvody tvoří **57,7 %** všech ukončení, prvních pět **83,8 %**.

Mezi lednem–srpnem 2025 a 2026 vzrostla většina hlavních důvodů.

### Závěr

Růst ukončení není způsoben jedním důvodem. Největší roli hrají zejména:
```text
Technical Issues
Price
Low Usage
Competitor
```

---

# 4. Délka předplatného

| Délka předplatného    | Zákaznické měsíce | Ukončení | Míra odchodu |
| 1–3 měsíce            | 65 874            | 2 215 | 3,36 % |
| 4–6 měsíců            | 61 618            | 1 977 | 3,21 % |
| 7–12 měsíců           | 117 003           | 2 895 | 2,47 % |
| 13–24 měsíců          | 229 373           | 4 645 | 2,03 % |
| 25+ měsíců            | 166 110           | 2 796 | 1,68 % |

Míra odchodu s délkou vztahu postupně klesá.

Power BI meziroční kontrola potvrdila stejný vzorec:

```text
01–08/2025
1–3 měsíce  → 3,29 %
4–6 měsíců  → 3,17 %
25+ měsíců  → 1,71 %

01–08/2026
1–3 měsíce  → 3,47 %
4–6 měsíců  → 3,34 %
25+ měsíců  → 1,70 %
```

### Závěr

```text
prvních 6 měsíců
→ nejrizikovější fáze zákaznického vztahu
```

---

# 5. Reaktivace

Za sledované období bylo zaznamenáno:
```text
4 277 reaktivací
```

Průměrná doba do návratu:
```text
cca  120 dní
```

Rozsah:
```text
minimum → 1 den
maximum → 330 dní
```

### Závěr

Absolutní počet reaktivací roste, ale míra klesá. Základna potenciálně reaktivovatelných zákazníků roste rychleji než počet samotných návratů.

---

# 6. Tržby

Měsíční tržby vzrostly:
```text
09/2024 → 7,81 mil. Kč
08/2026 → 10,55 mil. Kč
```

Celkový růst je přibližně **35 %**.

## Tržby podle tarifu

| Tarif     | Tržby         | Podíl |
| Standard  | 100 756 300   | 45,6 % |
| Premium   | 65 765 705    | 29,7 % |
| Basic     | 54 651 267    | 24,7 % |

## Tržby podle regionu

| Region            | Tržby         | Podíl |
| Prague            | 62 816 476    | 28,4 % |
| South Moravia     | 43 357 040    | 19,6 % |
| Other             | 40 358 578    | 18,2 % |
| Moravian-Silesian | 39 465 899    | 17,8 % |
| Central Bohemia   | 35 175 279    | 15,9 % |

## Tržby podle typu předplatného

| Typ           | Tržby         | Podíl |
| První         | 208 417 382   | 94,2 % |
| Reaktivované  | 12 755 890    | 5,8 % |

Tržby zákazníků v měsíci ukončení byly typicky kolem **180–240 tis. Kč měsíčně**.

Průměr leden–srpen:

```text
2025 → ~197 tis. Kč
2026 → ~225 tis. Kč
```

Tyto hodnoty nepředstavují budoucí ztracené tržby, ale skutečné tržby zákazníků v měsíci ukončení.

---

# 7. Power BI EDA

Power BI umožnil např. porovnat profily tarifů.

| Tarif     | Churn     | Nejčastější důvody                    | Nejrizikovější období |
| Basic     | 2,52 %    | Low Usage, Technical Issues, Price    | 4–6 měsíců |
| Standard  | 2,20 %    | Technical Issues, Price, Low Usage    | 1–3 měsíce |
| Premium   | 2,03 %    | Price, Low Usage, Technical Issues    | 4–6 měsíců |

Společný vzorec:
```text
první půlrok
→ nejrizikovější část vztahu
```

Tarify se liší hlavně intenzitou churnu a částečně strukturou důvodů ukončení.

---

# 8. Shrnutí EDA

Nejdůležitější analytická zjištění:
```text
zákaznická základna během období roste

tempo čistého růstu v roce 2026 zpomaluje

churn rate zůstává relativně stabilní

Basic má nejvyšší churn rate

reaktivovaná předplatná mají vyšší churn než první

první půlrok je nejrizikovější fáze vztahu

Technical Issues, Price a Low Usage patří mezi hlavní důvody ukončení

počet reaktivací roste, ale jejich míra klesá

měsíční tržby během období rostou
```

SQL EDA poskytla přesné výpočty a Power BI EDA umožnila interaktivně ověřit, zda hlavní vzorce zůstávají viditelné i při filtrování podle období a tarifu.