# Zjištění a doporučení

Tento dokument shrnuje hlavní business zjištění projektu a doporučení vycházející z SQL a Power BI EDA.

Doporučení nejsou důkazem příčiny ani garancí výsledku. Slouží jako podklad pro další rozhodnutí a případné pilotní ověření.

---

# Hlavní zjištění

## 1. Zákaznická základna roste, ale tempo růstu zpomaluje

Počet aktivních zákazníků vzrostl z **22 176 v 09/2024** na **29 765 v 08/2026**, tedy o **7 589 zákazníků (+34,2 %)**.

Při srovnání leden až srpen:
```text
2025 → čistý přírůstek ~+166 zákazníků měsíčně
2026 → čistý přírůstek ~+71 zákazníků měsíčně
```

Současně nové aktivace mírně klesají, ukončení rostou a churn rate zůstává relativně stabilní.

**Business význam:** Počet zákazníků stále roste, ale pomaleji. Vedle počtu aktivních zákazníků je proto vhodné sledovat také nové aktivace, ukončení a reaktivace.

---

## 2. Churn rate je relativně stabilní

Měsíční míra churnu se pohybovala přibližně mezi **2,0–2,6 %**.

Srovnání leden až srpen:
```text
2025 → 2,31 %
2026 → 2,25 %
```

**Business význam:** Zpomalení růstu zákazníků není způsobeno výrazným zhoršením churnu.

---

## 3. Basic má nejvyšší churn

Celkový churn rate:
```text
Basic    → 2,52 %
Standard → 2,20 %
Premium  → 2,03 %
```

Basic zůstal nejvyšší i při porovnání stejného období:
```text
01–08/2025 → 2,53 %
01–08/2026 → 2,53 %
```

**Business význam:** Vyšší churn Basicu není výsledkem jediného krátkého období, proto je vhodný pro další retenční analýzu.

---

## 4. První půlrok je nejrizikovější

Míra odchodu podle délky předplatného:
```text
1–3 měsíce   → 3,36 %
4–6 měsíců   → 3,21 %
7–12 měsíců  → 2,47 %
13–24 měsíců → 2,03 %
25+ měsíců   → 1,68 %
```

Power BI EDA potvrdila stejný vzorec i podle tarifů.

**Business význam:** Retenční opatření má největší smysl testovat zejména během prvních šesti měsíců vztahu.

---

## 5. Důvody ukončení jsou rozloženy mezi více kategorií

Nejčastější důvody:

```text
Technical Issues   → 2 829
Price              → 2 819
Low Usage          → 2 741
Competitor         → 2 188
Content Selection  → 1 600
```

První tři důvody tvoří **57,7 % všech ukončení**.

**Business význam:** Data nepodporují závěr, že churn způsobuje jediný problém. Je vhodné sledovat technické problémy, cenu, využívání služby, konkurenci i obsah.

---

## 6. Profil důvodů se mezi tarify částečně liší

```text
Basic    → Low Usage / Technical Issues / Price
Standard → Technical Issues / Price / Low Usage
Premium  → Price / Low Usage / Technical Issues
```

**Business význam:** Jednotná retenční strategie pro všechny tarify nemusí být optimální.

---

## 7. Reaktivace pomáhají růstu, ale jejich míra klesá

Celkem bylo zaznamenáno **4 277 reaktivací**.

Průměrná doba do návratu:
```text
cca 120 dnů, tj.4 měsíce
```

Srovnání:
```text
01–08/2025 → 5,39 %
01–08/2026 → 2,64 %
```

**Business význam:** počet návratů roste, ale základna potenciálně reaktivovatelných zákazníků roste rychleji. Reaktivace pomáhají růstu, ale neměly by být jediným nástrojem kompenzace odchodů.

---

## 8. Tržby rostou

Měsíční tržby vzrostly:
```text
09/2024 → 7,81 mil. Kč
08/2026 → 10,55 mil. Kč
```

Celkově přibližně **+35 %**.

Srovnání leden až srpen:
```text
2025 → 69,6 mil. Kč
2026 → 81,8 mil. Kč
```

**Business význam:** Finanční vývoj zůstává pozitivní i při zpomalování čistého růstu zákaznické základny.

---

# Fakta vs. hypotézy

## Fakta podložená daty

```text
Basic má vyšší churn než Standard a Premium.

První půlrok má vyšší míru odchodu než pozdější fáze vztahu.

Technical Issues, Price a Low Usage patří mezi hlavní důvody ukončení.

Churn rate je během období relativně stabilní.

Měsíční tržby během období rostou.

Míra reaktivace v roce 2026 je nižší než ve srovnatelném období 2025.
```

## Hypotézy k ověření

Data sama o sobě nedokazují:
```text
že Basic má vyšší churn kvůli ceně;

že technické problémy přímo způsobují vyšší churn;

že změna ceny sníží churn;

že onboarding automaticky sníží odchod;

že Premium má nižší churn kvůli vyšší kvalitě služby.
```

Tyto body lze použít jako hypotézy pro další analýzu nebo pilot.

---

# Doporučení

| Oblast            | Doporučení | Vlastník |
| Prvních 6 měsíců  | Otestovat retenční pilot pro zákazníky v prvních 1–6 měsících. | Retention / Customer Success |
| Basic             | Samostatně analyzovat a testovat retenční opatření pro tarif Basic. | Product / Commercial |
| Technical Issues  | Prověřit nejčastější technické problémy spojené s ukončením. | Customer Support / Technical Operations |
| Price             | Ověřit cenovou citlivost jednotlivých tarifních segmentů. | Pricing / Product |
| Low Usage         | Prověřit, zda nízké využívání může být časným varovným signálem. | Product / CRM |
| Reactivace        | Testovat reaktivační komunikaci přibližně 3.–4. měsíc po ukončení. | CRM / Retention |
| Monitoring        | Sledovat společně aktivní zákazníky, nové aktivace, ukončení, churn a reaktivace. | Management / Analytics |

---

# Očekávaný přínos

Doporučení mohou pomoci lépe zaměřit retenční aktivity, prioritizovat problémové segmenty, rychleji zachytit změny v churnu a lépe propojit zákaznické a finanční KPI.

Skutečný dopad je potřeba ověřit po implementaci nebo pilotu.

---

# Doporučený další krok

Praktický postup:
```text
1. vybrat jednu retenční hypotézu
2. definovat cílovou skupinu
3. navrhnout pilot
4. stanovit KPI úspěchu
5. změřit výsledek
6. porovnat s kontrolní nebo předchozí skupinou
7. rozhodnout o případném rozšíření
```

Příklad:
```text
Zjištění
→ vysoký odchod v prvních 6 měsících

Hypotéza
→ cílená onboarding / retention komunikace může snížit odchod

Pilot
→ část nových zákazníků

KPI
→ churn rate po 3 a 6 měsících

Vyhodnocení
→ porovnání s kontrolní skupinou
```

---

# Omezení

- dataset je syntetický;
- historie pokrývá 24 měsíců;
- analýza je primárně popisná;
- chybí detailní informace o cenových změnách, marketingových kampaních a technických incidentech;
- evidovaný důvod ukončení nemusí být skutečnou hlavní příčinou;
- výsledky neprokazují kauzalitu;
- projekt neobsahuje prediktivní churn model ani experimentální ověření doporučení.

Výsledky proto slouží jako podklad pro rozhodování a další prověření, ne jako důkaz příčiny nebo garance výsledku.