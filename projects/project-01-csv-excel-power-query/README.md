# Project 01 (CSV, Excel & Power Query) - Logistics Performance & Service Level Analysis

## Přehled projektu

Projekt se zaměřuje na analýzu výkonnosti logistického procesu smyšlené distribuční společnosti, kdy firma v posledním období zaznamenává zvýšený počet stížností na pozdní doručení a současně rostoucí náklady na přepravu. Cílem projektu je pomocí dat identifikovat hlavní oblasti problémů, odlišit problémy vznikající ve skladech od problémů během samotné přepravy a vytvořit podklady pro rozhodování managementu.

Tento úvodní projekt je realizován především v nástrojích **Excel, Power Query, SQL databáze** a  zahrnuje kompletní analytické workflow od definice business problému přes přípravu a kontrolu dat až po analýzu, vizualizaci, interpretaci výsledků a management reporting.

---

# 1. Business Understanding

## Business Context

Společnost provozuje několik distribučních skladů a pro doručování zásilek zákazníkům využívá více externích dopravců a několik typů přepravních služeb.

Logistický proces zahrnuje dvě hlavní části:
1. zpracování objednávky a přípravu zásilky ve skladu;
2. přepravu zásilky od expedice ze skladu po její doručení zákazníkovi.

Spolehlivost tohoto procesu přímo ovlivňuje zákaznickou zkušenost, provozní náklady i vztahy společnosti s externími dopravci.

Management v posledním období zaznamenává více stížností na pozdní doručení a současně rostoucí přepravní náklady. Není však zřejmé, zda problém vzniká především ve skladech, u jednotlivých dopravců, v určitých regionech, u konkrétních typů přepravních služeb nebo jejich kombinací.

## Business Problem

Část zásilek není doručována v dohodnutých termínech, zákazníci si na pozdní doručení stěžují a současně rostou náklady na přepravu.

Management v současnosti nemá dostatečně podložené informace k určení, kde problémy vznikají a které části logistického procesu mají největší vliv na nedodržování termínů a růst nákladů.

## Business Goals

Cílem projektu je proto identifikovat hlavní příčiny nedodržování dodacích termínů a růstu logistických nákladů a určit oblasti, ve kterých lze zvýšit spolehlivost logistického procesu při současné kontrole nákladů.

Sekundárním cílem je zlepšení zákaznické zkušenosti prostřednictvím snížení počtu pozdních a problematických zásilek.

Cílem není obecně zkrátit dobu doručení všech zásilek, protože různé přepravní služby mohou mít rozdílně sjednané dodací lhůty.

## Target Users

### Primární uživatel

**Manažer logistiky**

Výstup analýzy má sloužit především pro hodnocení, řízení a rozhodování o případných změnách  v logistickém procesu.

### Sekundární uživatelé

* Provozní manažer;
* Manažer skladu;
* management společnosti.

Management bude potřebovat především souhrnný pohled na KPI a hlavní problémové oblasti, zatímco provozní uživatelé budou potřebovat možnost analyzovat konkrétní sklady, dopravce, regiony nebo typy služeb.

## Business Decision

Analýza má poskytnout podklady zejména pro rozhodnutí:
* zda změnit způsob rozdělování zásilek mezi jednotlivé dopravce;
* zda řešit nedostatečný výkon konkrétních dopravců;
* zda upravit procesy v konkrétních skladech;
* zda změnit způsob využívání jednotlivých typů přepravních služeb;
* zda jednat s dopravci o úpravě SLA nebo obchodních podmínek;
* které regiony, sklady, dopravce nebo jejich kombinace je potřeba řešit prioritně.

## Analytical Questions

Analýza se zaměří především na následující otázky:
1. Jaký podíl zásilek je doručen v rámci sjednaného termínu a jak se tento podíl vyvíjí v čase?
2. Kteří dopravci mají nejvyšší a nejnižší **On-Time Delivery Rate**?
3. Jak velké je zpoždění zásilek doručených po slíbeném termínu?
4. Jak se výkonnost dopravců liší podle regionu a typu přepravní služby?
5. Jak dlouho trvá zpracování objednávky od jejího přijetí do expedice a jak se v tomto ukazateli liší jednotlivé sklady?
6. Vznikají problémy s pozdním doručením primárně před expedicí ve skladu, nebo během přepravy?
7. Jaké jsou přepravní náklady a jak se liší podle dopravce, typu služby, regionu a skladu?
8. Existuje souvislost mezi náklady na přepravu a spolehlivostí doručení?
9. Jak často dochází k neúspěšnému prvnímu pokusu o doručení a ve kterých oblastech se tyto případy koncentrují?
10. Existují konkrétní kombinace dopravce, skladu, regionu a typu služby, které vytvářejí nepřiměřeně vysoký podíl pozdních zásilek nebo logistických nákladů?

Při interpretaci výsledků bude rozlišováno mezi zjištěnou korelací a prokázanou příčinou. Samotná koncentrace problémů v určité kategorii totiž nemusí dokazovat, že tato kategorie problém způsobuje.

## KPI

### Podíl zásilek doručených v termínu podle SLA (On-Time Delivery Rate)

Ukazatel vyjadřuje spolehlivost doručování a bude jedním z hlavních KPI projektu.

### Podíl zásilek doručených po termínu (Late Delivery Rate)

Ukazatel doplňuje **On-Time Delivery Rate** a umožňuje sledovat rozsah problému s opožděnými zásilkami.

### Průměrné přepravní náklady na zásilku (Average Shipping Cost per Shipment)

Při porovnávání jednotlivých dopravců nebo dalších skupin bude nutné zohlednit rozdíly např. v typu služby, regionu, charakteru zásilky a dalších faktorech, které mohou cenu ovlivňovat.

### Podíl zásilek doručených napoprvé (First Attempt Delivery Success Rate)

Ukazatel pomáhá identifikovat problémy spojené s opakovaným doručováním a potenciálními dodatečnými náklady.

### Podíl zásilek expedovaných v termínu od přijetí obejdávky (Warehouse Dispatch SLA Rate)

Ukazatel umožňuje oddělit výkonnost skladu od následné výkonnosti dopravce.

### Další metriky

Vedle hlavních KPI budou využity také podpůrné metriky:
**Average Delivery Time** - průměrná doba mezi expedicí zásilky a jejím doručením.

**Median Delivery Time** - medián doby mezi expedicí zásilky a jejím doručením. Umožňuje omezit vliv extrémních hodnot na interpretaci typické doby doručení.

**Average Delay Days** - průměrná délka zpoždění pouze u zásilek doručených po slíbeném termínu.

**Warehouse Processing Time** - doba mezi přijetím objednávky a expedicí zásilky.

**Transit Time** - doba mezi expedicí zásilky a jejím doručením.

**Total Fulfilment Lead Time** - celková doba mezi přijetím objednávky a doručením zásilky.

KPI a metriky budou analyzovány podle relevantních dimenzí, například:
* dopravce;
* sklad;
* region;
* typ přepravní služby;
* časové období.

## Scope

### In scope

Projekt bude zahrnovat:
* analýzu procesu od přijetí objednávky po doručení zásilky;
* výkonnost jednotlivých skladů;
* výkonnost jednotlivých dopravců;
* dodržování sjednaných dodacích termínů;
* dobu zpracování zásilek ve skladu;
* dobu přepravy;
* přepravní náklady;
* neúspěšné první pokusy o doručení;
* analýzu podle regionu a typu přepravní služby;
* analýzu vývoje hlavních KPI v čase;
* identifikaci problémových kombinací faktorů;
* přípravu management reportu a interaktivního dashboardu v Excelu.

### Out of scope

Do projektu nebudou v této fázi zahrnuty např.:
* optimalizace tras jednotlivých vozidel;
* plánování kapacity vozového parku;
* predikce budoucích zpoždění pomocí machine learningu;
* detailní finanční analýza celého logistického oddělení;
* analýza skladových zásob a řízení zásob;
* hodnocení individuálního výkonu zaměstnanců;
* automatické rozhodování o přidělení dopravce konkrétní zásilce.

### Časové období

Projekt bude pracovat přibližně se dvěma roky historických dat. Přesné období bude stanoveno po vytvoření a kontrole zdrojových dat.

### Geografický rozsah

Projekt bude zahrnovat distribuční síť společnosti ve vybraných zemích a regionech střední Evropy.  Přesná geografická struktura bude stanovena při návrhu datasetu.

### Sledované entity

Hlavní sledované entity budou:
* zásilka;
* objednávka;
* sklad;
* dopravce;
* region;
* typ přepravní služby.

### Datové zdroje

Projekt bude pracovat s provozními daty o zásilkách a s referenčními daty potřebnými pro jejich interpretaci. Konkrétní struktura datových zdrojů bude definována ve fázi **Data Source Assessment**.

### Očekávané výstupy

Projekt má vytvořit:
* vyčištěný a reprodukovatelně připravený datový základ;
* sadu definovaných KPI a podpůrných metrik;
* detailní analytické výstupy;
* management dashboard v Excelu;
* hlavní zjištění a jejich interpretaci;
* doporučení vycházející z výsledků analýzy;
* dokumentaci analytického postupu.

## Assumptions

V této fázi projekt pracuje s následujícími předpoklady:
* dostupná data umožní jednoznačně identifikovat jednotlivé zásilky;
* budou dostupná data potřebná k určení okamžiku přijetí objednávky, expedice a doručení;
* pro jednotlivé přepravní služby bude možné určit očekávanou nebo smluvní dobu doručení;
* přepravní náklady budou přiřaditelné ke konkrétním zásilkám;
* bude možné určit sklad a dopravce odpovědné za jednotlivé části logistického procesu;
* časové údaje budou po případné transformaci vzájemně porovnatelné;
* vytvořený dataset bude představovat realistický model provozních dat, nikoliv skutečná interní data konkrétní společnosti.

Předpoklady budou během projektu ověřovány a v případě potřeby upraveny.

## Limitations

V této fázi jsou očekávána zejména následující omezení:
* projekt bude založen na cvičném datasetu vytvořeném pro účely portfolia;
* výsledky proto nebudou popisovat skutečnou konkrétní společnost;
* některé skutečné příčiny zpoždění nemusí být z dostupných dat přímo zjistitelné;
* zjištěná souvislost mezi faktorem a výsledkem nebude automaticky interpretována jako kauzální vztah;
* jednoduché porovnání průměrných nákladů nebo dodacích dob mezi dopravci nemusí být férové bez zohlednění rozdílného typu zásilek, regionů a služeb;
* přesná omezení dat budou doplněna po dokončení **Data Source Assessment** a datové kontroly.

## Success Criteria

Projekt bude považován za úspěšný, pokud:
* umožní spolehlivě vypočítat a interpretovat definovaná KPI;
* umožní oddělit problémy vznikající ve skladu od problémů vznikajících během přepravy;
* identifikuje hlavní oblasti, ve kterých se koncentrují pozdní zásilky nebo zvýšené náklady;
* poskytne managementu srozumitelný souhrnný pohled a současně možnost detailnější analýzy;
* analytické závěry budou přímo podloženy daty;
* doporučení budou navazovat na skutečně zjištěné problémy;
* proces přípravy dat bude reprodukovatelný a nebude závislý na manuálních zásazích při každém obnovení.

---

# 2. Data Source Assessment

## Dostupné zdroje

Projekt pracuje se syntetickými daty simulujícími pravidelné exporty z provozního logistického systému společnosti. Hlavním zdrojem jsou měsíční CSV soubory obsahující údaje o jednotlivých zásilkách. Vedle hlavních provozních dat jsou k dispozici samostatné referenční a doplňkové datové zdroje.

Použité zdroje:
* `shipments_YYYY_MM.csv` – měsíční provozní data o zásilkách;
* `carriers.csv` – referenční data o dopravcích;
* `warehouses.csv` – referenční data o skladech;
* `regions.csv` – referenční geografická data;
* `service_levels.csv` – referenční data o přepravních službách a jejich SLA;
* `complaints.csv` – data o evidovaných zákaznických stížnostech.

Měsíční soubory se zásilkami budou načítány ze společné zdrojové složky pomocí Power Query. Řešení je navrženo tak, aby bylo možné přidat nový měsíční export bez manuálního spojování souborů.

## Význam dat

### Shipments

Hlavní provozní dataset obsahující informace o jednotlivých zásilkách od přijetí objednávky přes expedici ze skladu až po doručení zákazníkovi.

### Carriers

Referenční data o externích dopravcích využívaných společností.

### Warehouses

Referenční data o distribučních skladech včetně interního SLA pro expedici objednávek.

### Regions

Referenční data popisující cílové geografické oblasti zásilek.

### Service Levels

Referenční data o používaných přepravních službách a jejich smluvní nebo očekávané době doručení.

### Complaints

Faktická data o zákaznických stížnostech spojených s konkrétními zásilkami.

## Granularita

Jednotlivé datové zdroje pracují s rozdílnou granularitou:
* `Shipments` – 1 řádek = 1 zásilka;
* `Complaints` – 1 řádek = 1 stížnost;
* `Carriers` – 1 řádek = 1 dopravce;
* `Warehouses` – 1 řádek = 1 sklad;
* `Regions` – 1 řádek = 1 cílový region;
* `Service Levels` – 1 řádek = 1 přepravní služba.

## Klíče a vazby

### Primary keys

* `Shipments` → `Shipment_ID`;
* `Complaints` → `Complaint_ID`;
* `Carriers` → `Carrier_ID`;
* `Warehouses` → `Warehouse_ID`;
* `Regions` → `Region_ID`;
* `Service Levels` → `Service_ID`.

### Business keys

`Order_ID` představuje business identifikátor objednávky.

Jedna objednávka může vést k více samostatným zásilkám, proto `Order_ID` není unikátním klíčem hlavní zásilkové tabulky.

### Foreign keys

Hlavní tabulka `Shipments` obsahuje:
* `Carrier_ID`;
* `Warehouse_ID`;
* `Region_ID`;
* `Service_ID`.

Tabulka `Complaints` obsahuje:
* `Shipment_ID`.

### Hlavní vazby

* Carrier 1:N Shipments;
* Warehouse 1:N Shipments;
* Region 1:N Shipments;
* Service Level 1:N Shipments;
* Shipment 1:N Complaints.

Součástí kontroly dat bude také ověření referenční integrity. Raw data budou záměrně obsahovat malé množství neplatných nebo neexistujících referenčních klíčů.

## Datové typy

Očekávané datové typy zahrnují:
* identifikátory – text;
* datumy a časové údaje – Date nebo DateTime;
* přepravní náklady a hmotnost – desetinná čísla;
* počet pokusů o doručení – celé číslo;
* logické příznaky – boolean;
* kategoriální atributy – text.

Datové typy nebudou ve všech souborech konzistentní. Mohou se objevit například:
* číselné hodnoty uložené jako text;
* nekonzistentní datumové formáty;
* různé zápisy logických hodnot;
* neočekávané textové hodnoty;
* prázdné nebo chybně interpretované hodnoty.

Kontrola a sjednocení datových typů bude součástí transformací v Power Query.

## Objem, historie a růst

Projekt pracuje s daty přibližně za období:
**1. 1. 2025 – 31. 12. 2026**.

Hlavní zásilková data obsahují přibližně:
**250 000 zásilek**.

Data jsou rozdělena do:
**24 měsíčních CSV souborů**.

Dataset obsahuje sezónní změny v provozním zatížení.

Systém je navržen tak, že s každým novým reportingovým obdobím vznikne další měsíční CSV soubor. Power Query má být schopno nový soubor automaticky zahrnout do existujícího procesu načítání a transformací.

## Frekvence změn

Hlavní zásilková data jsou pro účely projektu aktualizována měsíčně.

Data o stížnostech jsou rovněž součástí pravidelného reportingového cyklu.

Referenční tabulky se mění nepravidelně a méně často než provozní data.

Výsledný management reporting je proto primárně navržen jako měsíčně aktualizovaný výstup.

## Kvalita a použitelnost

Zdrojová data jsou záměrně vytvořena jako realistická raw provozní data a nejsou určena k přímému použití bez kontroly a transformací.

Chyby a nekonzistence mají simulovat běžné problémy v provozních exportech. Jejich množství však nemá znemožnit použití datasetu nebo uměle vytvářet problémy bez business významu.

Data budou pro analytické použití připravena pomocí Power Query.

## Přístupová omezení

Projekt simuluje situaci, kdy analytik nemá přímý přístup do provozní databáze. Pro analytickou práci jsou proto poskytovány pravidelné exporty ze zdrojového systému ve formě CSV souborů.

Zdrojová data budou v rámci projektu uložena v lokální projektové struktuře.

Analytik má přístup ke všem souborům potřebným pro vytvoření reportingu.

Projekt nesimuluje autentizaci, správu uživatelských oprávnění ani přímé napojení na produkční informační systémy.

## Osobní a citlivá data

Dataset neobsahuje skutečná osobní data. Veškeré provozní, obchodní a zákaznické informace jsou syntetické a nepředstavují data skutečné společnosti nebo skutečných osob.

Z tohoto důvodu mohou být data i výsledný projekt publikovány v portfolio repozitáři.

## Ownership a licence

Data jsou syntetická a vytvořená výhradně pro účely tohoto portfolio projektu.

Pro účely simulovaného business scénáře je Data Ownerem logistické oddělení společnosti a technickým vlastníkem zdrojového systému je interní IT / provozní tým.

Na syntetická zdrojová data se nevztahují smluvní omezení třetích stran.

Data mohou být použita, ukládána a publikována společně s projektem na GitHubu.

Případná licence celého repozitáře bude stanovena při finalizaci projektu.

---

# 3. Architecture Decision

## Výběr nástrojů

Projekt je záměrně postaven jako lehké analytické řešení využívající především:

- CSV soubory jako zdrojovou vrstvu;
- Power Query pro načtení, spojení, cleaning, validaci a transformace;
- Excel jako analytické a reportingové prostředí;
- Excel Data Model pro uložení připravené analytické tabulky.

Architektura odpovídá rozsahu projektu, objemu přibližně 250 tisíc zásilek a cíli procvičit pokročilejší analytickou práci v Excelu a Power Query bez zavádění zbytečné infrastruktury.

## Role SQL

SQL není v tomto projektu součástí analytického workflow.

Zdrojová data jsou poskytována jako pravidelné CSV exporty a jejich objem je pro Power Query a Excel Data Model stále zvládnutelný.

SQL bude využito v samostatném navazujícím portfolio projektu, kde bude databázová vrstva součástí zadání.

## Role Pythonu

Python není součástí běžného analytického workflow tohoto projektu.

Byl použit pouze jednorázově před zahájením analýzy pro vytvoření syntetických cvičných datasetů. Cleaning, validace, transformace a analytika jsou realizovány v Power Query a Excelu.

## Role Power Query

Power Query zajišťuje:

- načtení 24 měsíčních CSV souborů ze složky;
- kombinaci jednotlivých měsíčních exportů;
- načtení referenčních tabulek;
- sjednocení datových typů;
- standardizaci textových hodnot;
- validaci referenčních klíčů;
- odstranění přesných duplicit;
- business validační pravidla;
- propojení referenčních dat;
- agregaci stížností na úroveň zásilky;
- tvorbu odvozených analytických atributů;
- přípravu finální analytické tabulky.

## Role Power BI

Power BI není v Projektu 1 použit.

Management reporting bude vytvořen v Excelu. Power BI bude použit v samostatném navazujícím projektu.

## Forma úložiště

Hlavním úložištěm jsou soubory.

Raw vrstva je uložena v CSV souborech v projektové struktuře. Pro tento objem dat a měsíční reporting není zavedení SQL databáze, Data Warehouse ani Data Lake nutné.

## Datové vrstvy

Projekt používá tři praktické vrstvy:

```text
Raw
→ Staging
→ Clean / Analytical
```

### Raw

Původní CSV soubory v `data/raw/`. Tyto soubory se analytickou logikou nemění.

### Staging

Dotaz `stg_shipments_raw`, který kombinuje měsíční soubory a představuje technickou vstupní vrstvu v Power Query.

### Clean / Analytical

Dotaz `fact_shipments_clean`, ve kterém probíhá cleaning, validace, joiny a výpočty a který je následně přidán do Excel Data Modelu.

## Automatizace

Projekt nepoužívá scheduler ani externí pipeline.

Část procesu je automatizována prostřednictvím Power Query:

- zásilkové soubory se načítají ze složky;
- nový měsíční CSV soubor může být zahrnut při obnovení dat bez ručního appendu;
- transformační kroky se při refreshi opakují automaticky.

Samotné obnovení je v rámci portfolio projektu spouštěno ručně v Excelu.

## Zamítnuté alternativy

### SQL databáze

Byla zvažována jako možné centrální úložiště pro větší objem dat.

Pro tento projekt nebyla zvolena, protože by nepřinesla odpovídající přidanou hodnotu a zbytečně by zvýšila technickou složitost. SQL je plánováno pro další projekt.

### Python pro cleaning a transformace

Python by zvládl stejný typ transformací, ale cílem tohoto projektu je prokázat schopnost práce v Excelu a Power Query. Jeho použití by proto zbytečně překrývalo roli Power Query.

### Power BI

Power BI nebylo zvoleno, protože cílem prvního projektu je management reporting v Excelu. Power BI je vyhrazeno pro další projekt.

## Přiměřenost řešení

Zvolená architektura je přiměřená business problému i rozsahu dat:

- každý nástroj má jasnou roli;
- technologie se zbytečně nepřekrývají;
- raw data zůstávají oddělena od transformované vrstvy;
- Power Query zajišťuje reprodukovatelný cleaning a transformace;
- Excel Data Model umožňuje pracovat s připravenými daty bez načítání 250 tisíc řádků přímo do worksheetu;
- řešení lze obnovit bez ručního spojování měsíčních souborů.

## Kontrola fáze

Architecture Decision je uzavřen.

Projekt používá:

```text
CSV
→ Power Query
→ Excel Data Model
→ Excel analytika a reporting
```

SQL, Power BI a Python nejsou součástí běžného analytického workflow tohoto projektu.

---

# 4. Data Acquisition a Raw Layer

## Data Acquisition

Hlavní zásilková data jsou načítána z 24 měsíčních CSV souborů pomocí:

```text
Power Query
→ From Folder
→ Combine & Transform Data
```

Referenční tabulky a stížnosti jsou načítány jako samostatné CSV zdroje.

Použité zdroje:

- `shipments_YYYY_MM.csv`;
- `carriers.csv`;
- `warehouses.csv`;
- `regions.csv`;
- `service_levels.csv`;
- `complaints.csv`.

## Raw Layer

Raw vrstvu tvoří původní CSV soubory uložené v:

```text
data/raw/
```

Zdrojové soubory nejsou během analytického workflow ručně přepisovány ani opravovány.

Veškeré čištění a transformační logika probíhá až v Power Query.

## Oddělení raw dat

Jednotlivé vrstvy jsou odděleny následovně:

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

Tím je zachována možnost vrátit se k původním datům a zopakovat celý transformační proces.

## Reprodukovatelnost

Načtení a transformace jsou reprodukovatelné prostřednictvím uložených Power Query kroků.

Hlavní zásilková data jsou načítána ze společné složky. Po přidání dalšího měsíčního souboru lze proces zopakovat pomocí Excel Refresh.

Zdrojové soubory zůstávají součástí projektové struktury.

## Data Provenance

Pro každý zásilkový řádek je v Power Query zachován atribut zdrojového souboru `Zdroj.Název`, který umožňuje dohledat původní měsíční CSV soubor.

Projekt pracuje se syntetickými logistickými daty za období 2025–2026.

---

# 5. Data Quality, Cleaning a Validation

## Missing Values

Missing values nebyly automaticky nahrazovány umělými hodnotami.

Byly rozlišeny podle jejich business významu.

### Očekávané missing values

Například:

- `Exception_Reason` může být prázdný u zásilky bez provozní výjimky;
- `Delivery_DateTime` může chybět u zásilky, která nebyla doručena;
- některé časové údaje mohou chybět podle výsledného stavu zásilky.

### Chybějící analytické hodnoty

U menší části záznamů chybí například:

- `Shipping_Cost`;
- `Weight_Kg`.

Tyto hodnoty nebyly imputovány. Řádky zůstávají v datasetu, ale chybějící údaj se nepoužije při výpočtu metriky, která jej vyžaduje.

## Duplicity

Jedinečnost hlavní zásilkové tabulky je určena pomocí `Shipment_ID`.

Ve zdrojových datech bylo:

```text
250 287 řádků
250 000 odlišných Shipment_ID
```

Kontrolou bylo zjištěno, že 287 nadbytečných záznamů představuje přesné duplicity celých řádků.

Tyto duplicity byly odstraněny podle `Shipment_ID`.

Výsledná granularita:

```text
250 000 řádků
= 250 000 unikátních zásilek
```

U `complaints.csv` byly odstraněny přesné duplicity stížností.

Opakované `Shipment_ID` v tabulce stížností nejsou považovány za chybu, protože jedna zásilka může mít více evidovaných stížností.

## Datové typy

Datové typy byly ověřeny a opraveny v Power Query.

Zvláštní úpravy byly nutné například u:

### Shipping_Cost a Weight_Kg

Raw data obsahovala rozdílné desetinné oddělovače.

Hodnoty byly standardizovány a následně převedeny na desetinné číslo.

### Returned_Flag

Zdroj obsahoval více zápisů logické hodnoty:

```text
TRUE / FALSE
Yes / No
1 / 0
```

Hodnoty byly sjednoceny a následně převedeny na datový typ Pravda/Nepravda.

## Neplatné hodnoty

Textové atributy a identifikátory byly standardizovány pomocí:

- Trim;
- Clean;
- sjednocení velikosti písmen tam, kde je to vhodné.

ID sloupce byly standardizovány na velká písmena.

Pro číselné atributy byla provedena základní business validace:

- `Shipping_Cost > 0`;
- `Weight_Kg > 0`;
- `Delivery_Attempts >= 1`.

Tyto kontroly neodhalily neplatné hodnoty.

## Klíče

Byly prověřeny hlavní identifikátory:

- `Shipment_ID`;
- `Carrier_ID`;
- `Warehouse_ID`;
- `Region_ID`;
- `Service_ID`.

`Shipment_ID` byl po odstranění přesných duplicit ověřen jako unikátní.

## Referenční integrita

Foreign keys v `fact_shipments_clean` byly validovány pomocí Left Outer merge proti referenčním tabulkám.

Kontrolované vazby:

- `Carrier_ID` → `dim_carriers`;
- `Warehouse_ID` → `dim_warehouses`;
- `Region_ID` → `dim_regions`;
- `Service_ID` → `dim_service_levels`.

Neplatné referenční klíče nebyly automaticky opravovány ani mazány.

Byly označeny pomocí validačních sloupců:

- `Carrier_Key_Valid`;
- `Warehouse_Key_Valid`;
- `Region_Key_Valid`;
- `Service_Key_Valid`.

Tím jsou problematické záznamy dohledatelné a lze je při konkrétní analýze podle potřeby vyloučit.

## Časová návaznost

Byla provedena kontrola logického pořadí hlavních událostí.

Ověřovaná pravidla zahrnovala:

```text
Order_DateTime <= Dispatch_DateTime
Dispatch_DateTime <= First_Attempt_DateTime
Dispatch_DateTime <= Delivery_DateTime
First_Attempt_DateTime <= Delivery_DateTime
Promised_Delivery_Date >= Dispatch_DateTime
```

Výsledky:

- objednávka před expedicí – bez zjištěného porušení;
- expedice před prvním pokusem o doručení – zjištěny nekonzistentní záznamy;
- expedice před skutečným doručením – zjištěny nekonzistentní záznamy;
- první pokus před skutečným doručením – zjištěny nekonzistentní záznamy;
- promised delivery date před expedicí – bez zjištěného porušení.

Problematic records nebyly automaticky přepisovány. Jsou označeny validačními flagy.

## Business Rules

Byly vytvořeny validační flagy pro důležitá business pravidla.

Použité kontroly zahrnují:

- časovou posloupnost logistických událostí;
- kladnou přepravní cenu;
- kladnou hmotnost;
- minimálně jeden pokus o doručení;
- `Delivered` zásilka musí mít datum doručení;
- konzistenci `Returned_Flag` a `Delivery_Status`;
- nedoručená zásilka nemá být bezdůvodně evidována jako skutečně doručená;
- promised delivery date nesmí předcházet expedici.

Nalezené nekonzistence jsou ponechány dohledatelné pomocí validačních flagů a nejsou automaticky opravovány bez znalosti správné zdrojové hodnoty.

## Reconciliation

Při přípravě dat byly kontrolovány počty řádků a počet unikátních zásilek.

Hlavní reconciliation:

```text
Raw zásilkové řádky:        250 287
Unikátní Shipment_ID:       250 000
Odstraněné přesné duplicity:    287
Clean zásilkové řádky:      250 000
```

Merge s referenčními tabulkami byl prováděn jako Left Outer, aby během validace nebyly z hlavní tabulky automaticky odstraněny zásilky s neplatným referenčním klíčem.

---

# 6. Transformation a Business Logic

## Filtrování

V hlavní analytické tabulce nebylo provedeno plošné business filtrování zásilek.

Záznamy s neplatnými referenčními klíči nebo porušením business pravidel jsou ponechány v datasetu a označeny validačními flagy.

Trvale byly odstraněny pouze potvrzené přesné duplicity zásilek.

## Joiny

Do `fact_shipments_clean` byly pomocí Left Outer merge připojeny referenční tabulky:

- `dim_carriers`;
- `dim_warehouses`;
- `dim_regions`;
- `dim_service_levels`.

Join klíče:

```text
Carrier_ID
Warehouse_ID
Region_ID
Service_ID
```

Left Outer join byl zvolen proto, aby zásilka zůstala v hlavní tabulce i v případě, že její referenční klíč nemá odpovídající hodnotu v dimenzi.

Stížnosti byly připojeny až po agregaci na úroveň zásilky, aby merge nezměnil granularitu hlavní fact tabulky.

## Agregace

Zdroj `complaints.csv` má granularitu:

```text
1 řádek = 1 stížnost
```

Protože jedna zásilka může mít více stížností, byl vytvořen samostatný dotaz:

`agg_complaints_by_shipment`

Stížnosti byly seskupeny podle:

`Shipment_ID`

a byla vytvořena metrika:

`Complaint_Count`

Výsledná granularita agregovaného dotazu:

```text
1 řádek = 1 zásilka se stížností
```

Tento výsledek byl následně pomocí Left Outer merge připojen do `fact_shipments_clean`.

Zásilky bez evidované stížnosti mají:

```text
Complaint_Count = 0
```

## Výpočty

V Power Query byly vytvořeny odvozené analytické atributy.

### Warehouse_Processing_Hours

Doba od přijetí objednávky do expedice ze skladu.

```text
Dispatch_DateTime - Order_DateTime
```

Výsledek je vyjádřen v hodinách.

### Transit_Time_Days

Doba od expedice do skutečného doručení.

```text
Delivery_DateTime - Dispatch_DateTime
```

Výsledek je vyjádřen ve dnech.

### Total_Fulfilment_Lead_Time_Days

Celková doba od přijetí objednávky do doručení.

```text
Delivery_DateTime - Order_DateTime
```

### Delay_Days

Rozdíl mezi skutečným a slíbeným datem doručení.

```text
Delivery_Date - Promised_Delivery_Date
```

Interpretace:

- záporná hodnota – doručeno před termínem;
- 0 – doručeno v termínu;
- kladná hodnota – doručeno pozdě.

### On_Time_Flag

Určuje, zda byla zásilka doručena nejpozději ve slíbeném termínu.

### Late_Flag

Určuje, zda byla zásilka doručena po slíbeném termínu.

### First_Attempt_Success_Flag

Zásilka je označena jako úspěšně doručená na první pokus, pokud:

```text
Delivery_Attempts = 1
AND
Delivery_Status = Delivered
```

### Warehouse_SLA_Flag

Porovnává skutečný čas zpracování zásilky ve skladu s `Dispatch_SLA_Hours` z referenční tabulky skladů.

### Complaint_Count

Počet evidovaných stížností spojených se zásilkou.

### Has_Complaint

Logický příznak určující, zda má zásilka alespoň jednu evidovanou stížnost.

## Business kategorizace

Pro další analýzu byly vytvořeny zejména následující skupiny příznaků:

### Výkon zásilky

- `On_Time_Flag`;
- `Late_Flag`;
- `First_Attempt_Success_Flag`;
- `Warehouse_SLA_Flag`.

### Kvalita a validita dat

- `Carrier_Key_Valid`;
- `Warehouse_Key_Valid`;
- `Region_Key_Valid`;
- `Service_Key_Valid`;
- validační flagy časové a stavové konzistence.

### Zákaznická zkušenost

- `Complaint_Count`;
- `Has_Complaint`.

## Rozdělení práce mezi SQL a Python

SQL ani Python nejsou součástí transformačního workflow tohoto projektu.

Transformace jsou záměrně realizovány v Power Query, protože odpovídají rozsahu projektu a cíli prokázat praktickou práci s Excelem a Power Query.

Python byl použit pouze jednorázově pro vytvoření syntetických zdrojových dat.

## Facts a Dimensions

### Hlavní analytická fact tabulka

`fact_shipments_clean`

Granularita:

```text
1 řádek = 1 zásilka
```

Obsahuje:

- původní atributy zásilky;
- popisné atributy připojené z referenčních tabulek;
- validační příznaky;
- časové metriky;
- KPI-supporting flags;
- agregované informace o stížnostech.

### Referenční dotazy

- `dim_carriers`;
- `dim_warehouses`;
- `dim_regions`;
- `dim_service_levels`.

### Stížnosti

- `fact_complaints` – detailní stížnosti;
- `agg_complaints_by_shipment` – agregace stížností na granularitu zásilky.

## Gold / Analytical Tables

Hlavním analytickým výstupem přípravy dat je:

`fact_shipments_clean`

Tento dotaz je načten jako připojení a současně přidán do **Excel Data Modelu**.

Ostatní technické, referenční a pomocné dotazy jsou ponechány jako **connection only**, aby se zbytečně nenačítaly do worksheetů.

## Transformační pravidla

Hlavní transformační tok:

```text
24 měsíčních shipment CSV
→ From Folder / Combine
→ stg_shipments_raw
→ datové typy a textová standardizace
→ odstranění přesných duplicit
→ validace referenčních klíčů
→ business validační flagy
→ Left Outer joins na referenční tabulky
→ analytické výpočty
→ agregované complaints
→ fact_shipments_clean
→ Excel Data Model
```

Agregace stížností:

```text
fact_complaints
→ Group By Shipment_ID
→ Count Rows
→ Complaint_Count
→ agg_complaints_by_shipment
→ Left Outer merge do fact_shipments_clean
```
