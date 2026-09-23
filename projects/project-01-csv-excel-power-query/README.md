# Project 01 - Logistics Performance & Service Level Analysis (CSV, Power Query & Excel)

## Přehled projektu

Projekt analyzuje výkonnost logistického procesu smyšlené distribuční společnosti, která řeší pozdní doručení a rostoucí přepravní náklady. Cílem je určit hlavní problémové oblasti, odlišit problémy vznikající ve skladech od problémů během přepravy a připravit podklady pro rozhodování managementu.

Projekt využívá **Excel, Power Query a Excel Data Model**. Dosavadní workflow pokrývá business zadání, přípravu a validaci dat, transformace, EDA, statistickou analýzu a KPI souhrn.

---

# 1. Business Understanding

## Business kontext

Společnost provozuje několik distribučních skladů a využívá více externích dopravců a přepravních služeb. Logistický proces zahrnuje zpracování objednávky ve skladu a následnou přepravu k zákazníkovi.

Management eviduje pozdní doručení, zákaznické stížnosti a rostoucí přepravní náklady. Není zřejmé, zda problémy vznikají především ve skladu, u dopravce nebo v jiné části procesu.

## Business problém

Část zásilek není doručena ve slíbeném termínu a současně se liší náklady i výkonnost jednotlivých dopravců a skladů. Management potřebuje datově podložený pohled na to, kde se problémy koncentrují.

## Business cíl

Cílem projektu je identifikovat hlavní zdroje nedodržování dodacích termínů a rozdílů v logistických nákladech a určit oblasti, na které má smysl zaměřit další provozní opatření.

Sekundárním cílem je podpořit zákaznickou zkušenost snížením počtu pozdních a problematických zásilek.

## Cílová skupina

Primárním uživatelem je **manažer logistiky**. Sekundárními uživateli jsou provozní a skladoví manažeři a management společnosti.

## Business rozhodnutí

Analýza podporuje zejména rozhodování o:
- výkonnosti a využívání jednotlivých dopravců;
- procesech v konkrétních skladech;
- využívání přepravních služeb;
- případné úpravě SLA nebo obchodních podmínek;
- prioritách pro další provozní analýzu.

## Analytické otázky

1. Jaký podíl doručených zásilek je doručen včas a jak se vyvíjí v čase?
2. Kteří dopravci mají nejvyšší a nejnižší podíl doručení včas a jak se liší jejich doba přepravy?
3. Jak velké je průměrné zpoždění pozdních zásilek?
4. Jak dlouho trvá zpracování objednávky ve skladu a jak se sklady liší?
5. Jak jednotlivé sklady plní expediční SLA?
6. Vznikají problémy s pozdním doručením spíše před expedicí ve skladu, nebo během následné přepravy?
7. Jak se liší přepravní náklady mezi dopravci a souvisí s včasností doručení?
8. Jak se s výkonem dopravců pojí zákaznické stížnosti a provozní výjimky?

## KPI

Hlavní KPI:
- **Podíl zásilek doručených včas (On-Time Delivery Rate)** – podíl doručených zásilek doručených nejpozději ve slíbeném termínu.
- **Podíl opožděných zásilek (Late Delivery Rate)** – podíl doručených zásilek doručených po slíbeném termínu.
- **Průměrné přepravní náklady na zásilku** – průměrná hodnota `Shipping_Cost`.
- **Podíl zásilek doručených na první pokus** – podíl doručených zásilek s jedním pokusem o doručení.
- **Podíl zásilek expedovaných v rámci SLA skladu** – podíl zásilek zpracovaných v rámci `Dispatch_SLA_Hours`.

Podpůrné metriky:
- průměrná doba přepravy;
- průměrná délka zpoždění;
- doba zpracování ve skladu;
- celková doba od přijetí objednávky do doručení;
- podíl zásilek se stížností;
- struktura provozních výjimek.

## Rozsah

### V rámci rozsahu

- proces od přijetí objednávky po doručení;
- výkonnost dopravců a skladů;
- včasnost doručení a expediční SLA;
- doba zpracování a přepravy;
- přepravní náklady;
- první pokus o doručení;
- zákaznické stížnosti a provozní výjimky;
- vývoj hlavních KPI v čase;
- vybrané doplňkové pohledy tam, kde pomáhají interpretaci výsledků.

### Mimo rozsah

- optimalizace tras a kapacity vozového parku;
- predikce zpoždění pomocí machine learningu;
- detailní finanční analýza logistiky;
- řízení skladových zásob;
- hodnocení jednotlivých zaměstnanců;
- automatické přidělování dopravce;
- analýza všech možných kombinací dimenzí.

### Časové období

Data pokrývají období **1. 1. 2025 – 31. 12. 2026**.

### Geografický rozsah

Projekt pracuje s vybranými regiony střední Evropy.

### Sledované entity

Zásilka, objednávka, sklad, dopravce, region, typ přepravní služby a stížnost.

### Datové zdroje

Měsíční zásilkové CSV soubory, referenční tabulky dopravců, skladů, regionů a služeb a samostatný soubor stížností.

### Výstupy

- reprodukovatelně připravený analytický dataset;
- KPI a analytické souhrny;
- EDA a statistická analýza;
- management dashboard v Excelu;
- závěrečná interpretace a doporučení;
- dokumentace projektu.

## Předpoklady

- `Shipment_ID` jednoznačně identifikuje zásilku po odstranění potvrzených duplicit;
- časové údaje lze po transformaci vzájemně porovnat;
- SLA a přepravní náklady lze přiřadit ke konkrétním zásilkám;
- dataset je syntetický a představuje realistický model provozních dat, nikoliv data skutečné společnosti.

## Omezení

- dataset je cvičný a syntetický;
- některé skutečné příčiny zpoždění nemusí být v datech zachyceny;
- korelace není interpretována jako kauzalita;
- jednoduché porovnání dopravců nemusí zachytit všechny rozdíly ve službě, regionu nebo charakteru zásilek.

## Kritéria úspěchu

Projekt splňuje svůj analytický účel, pokud umožňuje:
- spolehlivě vypočítat a interpretovat hlavní KPI;
- oddělit výkon skladu od výkonu přepravy;
- identifikovat hlavní problémové oblasti;
- podložit závěry daty;
- reprodukovat přípravu dat pomocí uložených Power Query kroků.

---

# 2. Data Source Assessment

## Dostupné zdroje

Projekt pracuje se syntetickými CSV daty simulujícími pravidelné exporty z logistického systému:
- `shipments_YYYY_MM.csv` – 24 měsíčních souborů se zásilkami;
- `carriers.csv` – dopravci;
- `warehouses.csv` – sklady a jejich expediční SLA;
- `regions.csv` – regiony;
- `service_levels.csv` – přepravní služby;
- `complaints.csv` – zákaznické stížnosti.

## Význam dat a granularita

- `Shipments` – 1 řádek = 1 zásilka;
- `Complaints` – 1 řádek = 1 stížnost;
- `Carriers` – 1 řádek = 1 dopravce;
- `Warehouses` – 1 řádek = 1 sklad;
- `Regions` – 1 řádek = 1 region;
- `Service Levels` – 1 řádek = 1 přepravní služba.

## Klíče a vazby

Primary keys:
- `Shipment_ID`;
- `Complaint_ID`;
- `Carrier_ID`;
- `Warehouse_ID`;
- `Region_ID`;
- `Service_ID`.

`Order_ID` je business identifikátor objednávky, ale nemusí být unikátní na úrovni zásilky.

Hlavní vazby:
- Carrier 1:N Shipments;
- Warehouse 1:N Shipments;
- Region 1:N Shipments;
- Service Level 1:N Shipments;
- Shipment 1:N Complaints.

## Datové typy

Použité typy zahrnují text, Date/DateTime, desetinná a celá čísla a boolean hodnoty. Zdrojová data obsahovala nekonzistence, zejména rozdílné desetinné oddělovače a různé zápisy logických hodnot. Typy byly sjednoceny v Power Query.

## Objem, historie a frekvence

Data pokrývají roky 2025–2026 a obsahují přibližně **250 000 zásilek** v 24 měsíčních souborech. Zásilková data jsou koncipována jako měsíční exporty, referenční tabulky se mění méně často.

## Kvalita a použitelnost

Raw data záměrně obsahují běžné provozní problémy: duplicity, missing values, nekonzistentní textové a logické hodnoty, neplatné referenční klíče a několik časových nekonzistencí. Pro analytické použití proto vyžadují cleaning a validaci.

## Přístupová omezení

Projekt simuluje situaci bez přímého přístupu do provozní databáze. Analytik pracuje s CSV exporty uloženými v lokální projektové struktuře.

## Osobní a citlivá data

Dataset neobsahuje skutečná osobní ani důvěrná data. Data jsou syntetická a mohou být publikována v portfolio repozitáři.

## Ownership a licence

Pro simulovaný scénář je Data Ownerem logistické oddělení a technickým vlastníkem zdrojového systému interní IT/provozní tým. Syntetická data nemají smluvní omezení třetích stran.

---

# 3. Architecture Decision

## Výběr nástrojů

Projekt používá:
- CSV soubory jako raw zdroj;
- Power Query pro načtení, cleaning, validaci, joiny a výpočty;
- Excel pro analýzu a reporting;
- Excel Data Model pro uložení finální analytické tabulky.

Řešení odpovídá objemu přibližně 250 tisíc zásilek a cíli projektu bez zbytečné infrastruktury.

## Role Power Query

Power Query zajišťuje:
- kombinaci 24 měsíčních exportů;
- načtení referenčních dat a stížností;
- datové typy a textovou standardizaci;
- odstranění přesných duplicit;
- validaci klíčů a business pravidel;
- left outer joiny;
- agregaci stížností;
- výpočet analytických atributů;
- přípravu `fact_shipments_clean`.

## Forma úložiště

Raw data jsou uložena jako CSV soubory. SQL databáze, Data Warehouse ani Data Lake nebyly pro tento rozsah potřeba.

## Datové vrstvy

```text
Raw
→ Staging
→ Clean / Analytical
```

- **Raw** – původní soubory v `data/raw/`.
- **Staging** – `stg_shipments_raw`.
- **Clean / Analytical** – `fact_shipments_clean`, načtená do Excel Data Modelu.

## Automatizace

Externí scheduler ani pipeline se nepoužívají. Obnovení se spouští ručně v Excelu, ale Power Query automaticky znovu provede uložené transformační kroky a načte soubory ze zdrojové složky.

## Zamítnuté alternativy

- **SQL databáze** – pro tento rozsah by zvýšila složitost bez odpovídajícího přínosu.
- **Python pro cleaning** – stejné transformace jsou záměrně realizovány v Power Query.
- **Power BI** – první projekt je zaměřen na reporting v Excelu.

## Přiměřenost řešení

Každý použitý nástroj má jasnou roli, raw data zůstávají oddělena od transformované vrstvy a proces lze obnovit bez ručního spojování měsíčních souborů.

---

# 4. Data Acquisition & Raw Layer

## Získání dat

Zásilková data byla načtena z 24 měsíčních CSV souborů přes Power Query **From Folder / Combine**. Referenční tabulky a stížnosti byly načteny jako samostatné CSV zdroje.

## Raw vrstva

Původní soubory jsou uloženy v:

```text
data/raw/
```

Raw data nejsou ručně opravována ani přepisována.

## Oddělení raw dat

```text
data/raw/
    ↓
stg_shipments_raw
    ↓
fact_shipments_clean
    ↓
Excel Data Model
    ↓
analýza a reporting
```

## Reprodukovatelnost

Načtení i transformace jsou uloženy v Power Query. Po přidání dalšího měsíčního souboru lze proces znovu spustit pomocí Excel Refresh.

## Původ dat

Ve zpracovaných zásilkách zůstává atribut `Zdroj.Název`, který umožňuje dohledat původní měsíční CSV soubor.

---

# 5. Data Quality, Cleaning & Validation

## Chybějící hodnoty

Missing values nebyly plošně doplňovány. Jejich význam byl posuzován podle business kontextu:
- `Exception_Reason` může být prázdný bez provozní výjimky;
- `Delivery_DateTime` může chybět u nedoručené zásilky;
- chybějící `Shipping_Cost` nebo `Weight_Kg` zůstávají jako null a nevstupují do příslušného průměru.

## Duplicity

Zdroj obsahoval:
```text
250 287 řádků
250 000 unikátních Shipment_ID
```

Bylo potvrzeno 287 přesných duplicit celých řádků, které byly odstraněny. Výsledná hlavní tabulka obsahuje **250 000 unikátních zásilek**.

U stížností byly odstraněny přesné duplicity podle `Complaint_ID`. Opakované `Shipment_ID` jsou přípustné, protože jedna zásilka může mít více stížností.

## Datové typy a standardizace

Datové typy byly sjednoceny v Power Query. Zvláštní úpravy zahrnovaly:
- `Shipping_Cost` a `Weight_Kg` – sjednocení desetinných oddělovačů;
- `Returned_Flag` – sjednocení hodnot TRUE/FALSE, Yes/No a 1/0;
- textové a ID atributy – Trim/Clean a sjednocení velikosti písmen tam, kde to bylo vhodné.

## Klíče a referenční integrita

Vazby `Carrier_ID`, `Warehouse_ID`, `Region_ID` a `Service_ID` byly ověřeny pomocí left outer merge proti referenčním tabulkám.

Neplatné klíče nebyly automaticky opravovány ani mazány. Byly označeny příznaky:
- `Carrier_Key_Valid`;
- `Warehouse_Key_Valid`;
- `Region_Key_Valid`;
- `Service_Key_Valid`.

## Časová návaznost

Bylo ověřeno logické pořadí hlavních událostí:
```text
Order_DateTime <= Dispatch_DateTime
Dispatch_DateTime <= First_Attempt_DateTime
Dispatch_DateTime <= Delivery_DateTime
First_Attempt_DateTime <= Delivery_DateTime
Promised_Delivery_Date >= Dispatch_DateTime
```

Nekonzistentní záznamy byly ponechány dohledatelné pomocí validačních flagů a nebyly bez znalosti správné zdrojové hodnoty přepisovány.

## Business pravidla

Další validační pravidla kontrolují zejména:
- kladnou přepravní cenu a hmotnost;
- minimálně jeden pokus o doručení;
- datum doručení u stavu `Delivered`;
- konzistenci `Returned_Flag` a `Delivery_Status`;
- stav doručení ve vztahu k `Delivery_DateTime`;
- slíbené datum doručení ve vztahu k expedici.

## Odsouhlasení dat

```text
Raw řádky:                 250 287
Unikátní Shipment_ID:      250 000
Odstraněné duplicity:          287
Clean řádky:               250 000
```

Referenční joiny byly provedeny jako left outer, aby během validace nedocházelo k automatickému vyřazení zásilek.

---

# 6. Transformation & Business Logic

## Filtrování

Hlavní analytická tabulka neobsahuje plošné business filtrování. Trvale byly odstraněny pouze potvrzené přesné duplicity. Neplatné klíče a validační problémy zůstávají označené pomocí flagů.

## Joiny

Do `fact_shipments_clean` byly pomocí left outer joinu připojeny:
- `dim_carriers`;
- `dim_warehouses`;
- `dim_regions`;
- `dim_service_levels`.

Tento typ joinu zachovává zásilku i při neplatném referenčním klíči.

## Agregace stížností

`complaints.csv` má granularitu 1 řádek = 1 stížnost. Dotaz `agg_complaints_by_shipment` agreguje stížnosti podle `Shipment_ID` a vytváří `Complaint_Count`.

Po left outer merge do hlavní tabulky mají zásilky bez stížnosti `Complaint_Count = 0`.

## Výpočty

V Power Query byly vytvořeny:
- `Warehouse_Processing_Hours` – čas od objednávky do expedice;
- `Transit_Time_Days` – čas od expedice do doručení;
- `Total_Fulfilment_Lead_Time_Days` – čas od objednávky do doručení;
- `Delay_Days` – rozdíl skutečného a slíbeného data doručení;
- `On_Time_Flag` a `Late_Flag`;
- `First_Attempt_Success_Flag`;
- `Warehouse_SLA_Flag`;
- `Complaint_Count`;
- `Has_Complaint`.

## Faktová a dimenzní data

Hlavní analytická tabulka je `fact_shipments_clean` s granularitou:
```text
1 řádek = 1 zásilka
```

Obsahuje původní zásilkové atributy, popisné atributy z referenčních tabulek, validační flagy, časové metriky a agregované informace o stížnostech.

Referenční dotazy:
- `dim_carriers`;
- `dim_warehouses`;
- `dim_regions`;
- `dim_service_levels`.

Pomocné dotazy:
- `fact_complaints`;
- `agg_complaints_by_shipment`.

## Zlatá / analytická vrstva

`fact_shipments_clean` je načtena do **Excel Data Modelu**. Ostatní technické a referenční dotazy jsou ponechány jako **connection only**.

## Transformační tok

```text
24 shipment CSV
→ From Folder / Combine
→ stg_shipments_raw
→ datové typy a textová standardizace
→ odstranění přesných duplicit
→ validace klíčů a business pravidel
→ left outer joiny
→ analytické výpočty
→ agregace stížností
→ fact_shipments_clean
→ Excel Data Model
```

---

# 7. Exploratory Data Analysis

## Trendy

Měsíční podíl zásilek doručených včas byl od ledna do října v obou letech relativně stabilní kolem 83–85 %. V listopadu a prosinci výrazně klesl. Ve stejném období rostl měsíční objem zásilek.

## Porovnání dopravců

Mezi dopravci se lišila včasnost, doba přepravy i náklady:
- Central Express dosáhl nejvyššího podílu doručení včas **85,74 %** a nejkratší průměrné doby přepravy **2,59 dne**;
- Euroship měl nejnižší podíl doručení včas **77,11 %** a nejdelší průměrnou dobu přepravy **2,87 dne**;
- průměrné přepravní náklady se pohybovaly přibližně od **153,80 Kč** do **179,18 Kč**;
- podíl doručení na první pokus byl u všech dopravců vysoký **92,03–93,96 %**, proto nebyl dále rozvíjen jako hlavní vysvětlující faktor.

## Porovnání skladů

Brno mělo nejkratší průměrnou dobu zpracování **10,69 h**, Katowice nejdelší **14,55 h**. Absolutní dobu zpracování však nebylo vhodné porovnávat bez SLA limitu.

Po rozdělení na sklady s 18h a 24h SLA vyšla Ostrava jako slabší sklad v rámci 18h skupiny: využívala přibližně **68,70 %** dostupného SLA času a její SLA Rate byla **79,99 %**, zatímco Brno využívalo **59,37 %** a dosahovalo **86,77 %**.

## Stížnosti a provozní výjimky

Podíl zásilek se stížností byl mezi dopravci nízký, ale lišil se: Central Express **2,18 %**, Euroship **2,59 %**.

Nejčastější evidované výjimky byly:
- provozní problém dopravce – **21,56 %**;
- kapacitní problém dopravce – **19,22 %**.

Další drill-down nebyl vzhledem k rozsahu projektu prioritní.

## Délka zpoždění

U pozdních zásilek se průměrná délka zpoždění mezi dopravci pohybovala pouze mezi **1,13 a 1,19 dne**. Rozdíly ve včasnosti byly proto výraznější v četnosti zpoždění než v jeho délce.

## Hypotézy

EDA vedla k ověření zejména těchto vztahů:
- měsíční objem zásilek × podíl doručení včas;
- průměrná doba přepravy × podíl doručení včas;
- průměrné přepravní náklady × podíl doručení včas;
- podíl stížností × podíl doručení včas;
- podíl opožděných zásilek × průměrná délka zpoždění.

Tyto vztahy byly následně ověřeny v části Statistical Data Analysis.

---

# 8. Statistical Data Analysis

Statistická analýza byla použita pro ověření vztahů identifikovaných během EDA. Hlavní metodou byla Pearsonova korelace doplněná bodovým grafem a lineární trendovou přímkou.

## Korelace

| Vztah | Pearson r | R² | Interpretace |
|---|---:|---:|---|
| Měsíční objem zásilek × podíl doručení včas | -0,871 | 0,759 | Silná negativní lineární souvislost |
| Průměrná doba přepravy × podíl doručení včas | -0,995 | 0,991 | Velmi silná negativní lineární souvislost |
| Průměrné přepravní náklady × podíl doručení včas | 0,893 | 0,797 | Silná pozitivní lineární souvislost |
| Podíl stížností × podíl doručení včas | -0,971 | 0,943 | Velmi silná negativní lineární souvislost |
| Podíl opožděných zásilek × průměrná délka zpoždění | 0,918 | 0,843 | Silná pozitivní lineární souvislost |

Korelace na úrovni dopravců vycházejí pouze ze **6 agregovaných hodnot**, proto slouží jako podpůrný analytický signál, nikoliv jako obecný důkaz. Časová korelace vychází z 24 měsíčních pozorování.

## Jednoduchá regrese

Lineární trendová přímka a R² byly použity jako vizuální doplnění korelační analýzy. Nešlo o predikční model, ale o kontrolu, zda pozorovaný vztah odpovídá přibližně lineárnímu průběhu.

## Interpretace statistických výsledků

Analýza ukázala zejména:
- vyšší měsíční objem zásilek souvisel s nižší včasností, především během listopadu a prosince;
- delší průměrná doba přepravy byla mezi dopravci velmi silně spojena s nižší včasností;
- vyšší průměrné přepravní náklady byly spojeny s vyšší včasností;
- vyšší podíl stížností byl spojen s nižší včasností;
- dopravci s vyšším podílem opožděných zásilek měli tendenci vykazovat i mírně delší zpoždění.

Výsledky popisují statistickou souvislost, nikoliv příčinu. Do vztahů mohou vstupovat další faktory, například sezónnost, skladové SLA nebo rozdílné charakteristiky přepravních služeb.

---

# 9. Datový a sémantický model

## Granularita fact table

`fact_shipments_clean` má granularitu:
```text
1 řádek = 1 zásilka
```

Po odstranění přesných duplicit obsahuje **250 000 zásilek**.

## Struktura modelu

Do Excel Data Modelu je načtena pouze široká analytická tabulka `fact_shipments_clean`.

Referenční dotazy `dim_carriers`, `dim_warehouses`, `dim_regions` a `dim_service_levels` zůstávají jako connection only. Jejich popisné atributy byly připojeny do hlavní tabulky již v Power Query.

Model proto v tomto projektu nepoužívá samostatné relační star schema ani vztahy mezi více tabulkami v Excel Data Modelu.

## Calculated Columns

Row-level výpočty a validační příznaky vznikají v Power Query, nikoliv jako calculated columns v Data Modelu. Tím zůstává business logika soustředěna v transformační vrstvě.

## Formátování

V analytických výstupech jsou používány odpovídající formáty pro procenta, měnu, počet zásilek, hodiny a dny.

---

# 10. KPI

## KPI souhrn

| KPI / metrika | Hodnota |
|---|---:|
| Podíl zásilek doručených včas | 81,52 % |
| Podíl opožděných zásilek | 18,48 % |
| Průměrné přepravní náklady na zásilku | 165,03 Kč |
| Podíl zásilek doručených na první pokus | 93,57 % |
| Podíl zásilek expedovaných v rámci SLA skladu | 85,08 % |
| Průměrná doba přepravy | 2,73 dne |
| Průměrná délka zpoždění | 1,17 dne |

## Výpočet KPI

KPI vycházejí z odvozených atributů a flagů připravených v Power Query a jsou agregovány v Excel Data Modelu prostřednictvím kontingenčních tabulek.

Podílové KPI jsou počítány nad odpovídající populací, například On-Time a Late Rate pouze nad doručenými zásilkami.

---

# 11. Dashboard

## Cílová skupina

Dashboard je určen především pro manažera logistiky a provozní management.

Cílem je umožnit rychle vyhodnotit celkovou výkonnost logistického procesu a následně identifikovat rozdíly mezi dopravci, sklady a jednotlivými obdobími.

## Informační hierarchie

Dashboard je uspořádán podle této logiky:
```text
hlavní KPI
→ podpůrné metriky
→ časový vývoj
→ porovnání dopravců a skladů
→ provozní výjimky
→ detailní přehled dopravců
```

## KPI karty

Hlavní část dashboardu obsahuje čtyři KPI:
- Podíl zásilek doručených včas;
- Podíl zásilek expedovaných v rámci SLA;
- Průměrné přepravní náklady na zásilku;
- Podíl zásilek doručených na první pokus.

Doplňkově jsou zobrazeny:
- Průměrná doba přepravy;
- Průměrná délka zpoždění;
- Průměrná doba zpracování ve skladu;
- Podíl zásilek se stížností.

## Trendy

Měsíční vývoj logistické výkonnosti je zobrazen pomocí spojnicového grafu za období 2025–2026.

Graf porovnává:
- podíl zásilek doručených včas;
- podíl zásilek expedovaných v rámci SLA.

Časová osa používá měsíční granularitu a zachovává chronologické pořadí období.

## Porovnání kategorií

Pro hlavní kategoriální porovnání jsou použity vodorovné pruhové grafy:
- Podíl zásilek doručených včas podle dopravce;
- Podíl zásilek expedovaných v rámci SLA podle skladu;
- Struktura provozních výjimek.

## Tabulkové detaily

Dashboard obsahuje detailní přehled výkonnosti dopravců.

Tabulka zobrazuje:
- včasnost;
- průměrné přepravní náklady;
- průměrnou dobu přepravy;
- podíl zásilek se stížností;
- počet zásilek.

Tabulka doplňuje grafické porovnání o přesné hodnoty a umožňuje posoudit více ukazatelů současně.

## Filtry a slicery

Dashboard lze filtrovat podle:
- roku a měsíce;
- dopravce;
- skladu.

Rok, dopravce a sklad jsou ovládány pomocí slicerů. Měsíční období je řízeno časovou osou.

Filtry jsou napojeny na dashboardové kontingenční tabulky a ovlivňují KPI, grafy i detailní přehledy.

## Čitelnost

Dashboard je vytvořen jako jednostránkový management report.

Hlavní KPI jsou vizuálně zvýrazněna oproti podpůrným metrikám.

## Omezení počtu vizuálů

Dashboard obsahuje pouze vizuály navazující na hlavní business otázky projektu.

Detailní bodové grafy a korelační analýzy z části SDA nejsou součástí dashboardu.

## Podpora rozhodování

Dashboard podporuje zejména rozhodování o:
- výkonnosti jednotlivých dopravců;
- výkonnosti jednotlivých skladů;
- vývoji včasnosti a plnění SLA v čase;
- vztahu mezi kvalitou služby a přepravními náklady;
- oblastech, které vyžadují další provozní prověření.

---

