# Analytical Workflow

Praktický rámec pro vedení end-to-end analytického projektu od business zadání až po finální výstup.

Cílem není použít všechny dostupné technologie, ale postupovat systematicky a zachovat vazbu mezi business problémem, daty, analýzou a doporučením.

---

# 1. Business Understanding

Cílem je pochopit, proč projekt vzniká, komu slouží a jaké rozhodnutí má podpořit.

Analytický projekt nezačíná daty ani technologií, ale business problémem.

## Business Context

Popsat:

- oblast a proces, kterého se projekt týká;
- důvod vzniku projektu;
- význam problému pro firmu;
- hlavní uživatele výstupu.

## Business Problem

Určit, co firma potřebuje řešit.

```text
Business Problem
→ co firma potřebuje vyřešit
```

## Business Goal

Určit, čeho má projekt dosáhnout.

```text
Business Goal
→ čeho chceme projektem dosáhnout
```

## Target User

Určit:

- primárního uživatele;
- sekundární uživatele;
- potřebnou úroveň detailu.

## Business Decision

Určit, jaké rozhodnutí má analýza podpořit.

```text
Business Problem
→ co firma řeší

Business Decision
→ co má někdo na základě analýzy rozhodnout
```

## Analytical Questions

Převést business problém do konkrétních otázek, na které mohou odpovědět data.

```text
Analytical Question
→ na co se musí data zeptat,
  aby pomohla vyřešit business problém
```

## KPI

KPI určují, jak se bude sledovaný business problém měřit.

```text
Analytical Question
→ na co se ptáme

KPI
→ jak to změříme
```

KPI není každé číslo, ale metrika důležitá pro business cíl.

## Scope

Scope určuje hranice projektu.

Definovat zejména:

- co je in scope;
- co je out of scope;
- časové období;
- geografický rozsah;
- sledované entity;
- datové zdroje;
- očekávané výstupy.

## Assumptions

Assumptions jsou předpoklady, se kterými projekt pracuje jako s platnými, dokud se neprokáže opak.

Musí být zdokumentované, protože mohou ovlivnit interpretaci výsledků.

## Limitations

Limitations jsou známá omezení dat, rozsahu nebo výsledné analýzy.

Mohou omezovat:

- přesnost;
- rozsah;
- zobecnitelnost;
- interpretaci výsledků.

## Success Criteria

Success criteria určují, podle čeho poznáme, že projekt splnil svůj účel.

```text
Business Goal
→ čeho chceme dosáhnout

Success Criteria
→ podle čeho poznáme, že jsme toho dosáhli
```

Rozdíl:

```text
KPI
→ měří business výkon nebo stav

Success Criteria
→ měří úspěch analytického projektu
```

## Výstup fáze Business Understanding

Po dokončení musí být jasné:

```text
Business Context
Business Problem
Business Goal
Target User
Business Decision
Analytical Questions
KPI
Scope
Assumptions
Limitations
Success Criteria
```

Hlavní princip:

```text
Business Problem
→ Business Decision
→ Analytical Questions
→ KPI
→ Analysis
→ Interpretation
→ Recommendation
```

---

# 2. Data Source Assessment

Cílem je pochopit, jaká data jsou dostupná, co znamenají, jak jsou strukturovaná a zda jsou použitelná pro analytický projekt.

## Dostupné zdroje

Zmapovat všechny relevantní zdroje:
- databáze;
- API;
- Excel;
- CSV / JSON / Parquet;
- externí zdroje;
- další interní systémy.

## Význam tabulek a struktur

U každého zdroje určit:
- co data reprezentují;
- jaký je význam jednotlivých tabulek nebo souborů;
- jaké entity obsahují;
- jak mezi sebou souvisejí.

## Granularita

Určit, co představuje jeden řádek.

Granularita ovlivňuje agregace, počty, joiny i interpretaci výsledků.

## Klíče

Určit:
- primary keys;
- business keys;
- foreign keys;
- vazby mezi tabulkami.

```text
Primary Key
→ technický unikátní identifikátor

Business Key
→ jedinečnost podle business logiky
```

## Datové typy

Prověřit:
- očekávané datové typy;
- datum a čas;
- textové a číselné hodnoty;
- případné nekonzistence mezi zdroji.

## Objem, historie a růst

Rozlišit:
```text
Data Volume
→ kolik dat máme

Data History
→ jaké časové období data pokrývají

Data Growth
→ jak rychle objem přibývá
```

## Frekvence změn

Určit, jak často se data mění nebo přibývají.

Rozlišit:
```text
Source Update Frequency
→ jak často se mění zdroj

Required Reporting Frequency
→ jak často business potřebuje nový výstup
```

## Kvalita a použitelnost

Prověřit zejména:
- completeness;
- validity;
- consistency;
- duplicates;
- missing values;
- použitelnost klíčů;
- potřebu cleaningu;
- potřebu transformací;
- zda lze data použít přímo, agregovaně nebo až po úpravě.

Kvalita se vždy posuzuje vzhledem ke konkrétnímu účelu projektu.

## Přístupová omezení

Prověřit:
- přístup ke zdrojovým systémům;
- read / write / admin oprávnění;
- přístup k průběžným vrstvám a mezivýstupům;
- přístup k finálním reportům a exportům.

Použít princip least privilege.

## Osobní a citlivá data

Rozlišit:
```text
Personal Data
→ údaje o identifikované nebo identifikovatelné osobě

Sensitive / Confidential Business Data
→ obchodně citlivé informace

Special Categories
→ zvlášť chráněné osobní údaje
```

Posoudit dopad na:
- přístupy;
- anonymizaci nebo pseudonymizaci;
- publikaci;
- GitHub;
- sdílení výstupů.

## Ownership a licence

U každého zdroje určit:
- kdo je Data Owner;
- kdo je technický vlastník systému;
- kdo může schválit použití dat;
- zda existují licenční nebo smluvní omezení;
- zda jsou s použitím spojeny poplatky;
- zda lze data ukládat, publikovat nebo redistribuovat.

## Výstup fáze Data Source Assessment

Po dokončení musí být jasné:
```text
Sources
Business Meaning
Granularity
Keys
Data Types
Volume
History
Growth
Update Frequency
Data Quality
Access Restrictions
Personal / Sensitive Data
Ownership
Licensing
```

---

# 3. Architecture Decision

Cílem je navrhnout přiměřenou architekturu, určit roli jednotlivých nástrojů a zdůvodnit, proč byly zvoleny právě tyto technologie.

## Výběr nástrojů

Výběr nástrojů má vycházet z:
- typu a umístění zdrojů;
- potřebných transformací;
- formy výstupů;
- frekvence aktualizací;
- objemu a růstu dat;
- existujícího technologického stacku firmy;
- dostupné infrastruktury;
- schopností týmu;
- business hodnoty řešení.

Hlavní princip:
```text
Sources
+ Transformations
+ Outputs
+ Frequency
+ Scale
+ Existing Stack
+ Team Capabilities
+ Infrastructure
→ Tool Selection
```

## Role SQL

SQL používat zejména pro:
- čtení dat z relačních databází;
- filtrování;
- joins;
- agregace;
- transformace;
- views;
- kontrolu klíčů a integrity;
- přípravu reportingových tabulek.

SQL je jazyk. Databázový systém zajišťuje samotné uložení dat.

## Role Pythonu

Python není povinnou součástí každého projektu.

Dává smysl zejména při:
- více různorodých zdrojích;
- práci s API;
- JSON, Excel, CSV a dalšími formáty;
- složitější validaci a cleaningu;
- integrační logice;
- automatizaci;
- logování;
- orchestration.

Pokud SQL a Power BI pokryjí celý požadovaný proces, Python nemusí být potřeba.

## Role Power Query

Power Query je vhodný pro:
- ingestion do Power BI;
- jednoduché ETL;
- tabulkové transformace;
- změny datových typů;
- drobné technické úpravy.

Pokud hlavní ETL probíhá v SQL nebo Pythonu, nemá smysl stejnou logiku znovu vytvářet v Power Query.

## Role Power BI

Power BI má několik vrstev:
```text
Power Query
→ ingestion + lehké transformace

Data Model
→ fact / dimension struktura
→ relationships
→ date table

DAX
→ dynamické business výpočty a KPI

Report
→ vizualizace
→ interpretace
→ podpora business rozhodování
```

## Forma úložiště

Úložiště vybírat podle rozsahu a charakteru řešení.
```text
File
→ malé nebo ad hoc řešení

SQL Database
→ relační a opakované analytické řešení

Data Warehouse
→ centrální analytická platforma pro více oblastí

Data Lake
→ velké objemy různorodých raw dat

Lakehouse
→ lake storage + analytická struktura
```

Rozhodující faktory:
- objem a růst dat;
- počet zdrojů;
- počet uživatelů;
- požadovaná historie;
- frekvence aktualizací;
- dostupná infrastruktura;
- provozní složitost.

## Datové vrstvy

Datové vrstvy oddělují jednotlivé fáze zpracování.
```text
Raw
→ původní data

Staging
→ technické sjednocení

Curated / Clean
→ validovaná a vyčištěná data

Analytical / Gold
→ data připravená pro analýzu a reporting
```

Hlavní přínosy:
- auditovatelnost;
- dohledatelnost chyb;
- možnost reprocessingu;
- oddělení technické a business logiky;
- přehlednější pipeline.

Ne každý projekt musí fyzicky používat všechny vrstvy.

## Automatizace

Automatizaci použít tehdy, pokud je proces opakovaný a má definovanou frekvenci nebo trigger.

```text
Ad hoc analysis
→ automation usually not needed

Recurring reporting
→ automation usually makes sense
```

Při návrhu automatizace řešit:
- scheduler;
- pipeline;
- validaci;
- error handling;
- logging;
- monitoring;
- safe publication.

## Zamítnuté alternativy

Dokumentovat významné varianty, které byly posouzeny, ale nebyly zvoleny.

U každé varianty uvést:
- proč byla posouzena;
- proč nebyla zvolena;
- proč je vybrané řešení vhodnější;
- kdy by se doporučení změnilo.

```text
Rejected Alternatives
→ podporují argumentaci pro výsledný návrh
```

## Přiměřenost řešení

Architektura má být dostatečná, ale ne zbytečně složitá.

Prověřit:
- zda má každý nástroj jasnou roli;
- zda se nástroje zbytečně nepřekrývají;
- zda odpovídají business hodnotě;
- zda řešení zvládne dostupný tým;
- zda odpovídá existujícím technologiím firmy;
- zda není zbytečně drahé nebo složité na provoz;
- zda by jednodušší varianta nestačila.

Hlavní princip:
```text
Business Value
+ Data Scale
+ Complexity
+ Existing Stack
+ Team Capabilities
+ Operating Cost
→ Appropriate Architecture
```

## Výstup fáze Architecture Decision

Po dokončení musí být jasné:
```text
Selected Tools
Role of SQL
Role of Python
Role of Power Query
Role of Power BI
Storage
Data Layers
Automation
Rejected Alternatives
Architecture Fit
```

---

# 4. Data Acquisition a Raw Layer

Cílem je získat data ze zdrojů bezpečně, reprodukovatelně a s dohledatelným původem.

Základní princip:

```text
Source
→ Acquisition
→ Raw Layer
→ Validation / Transformation
```

## Data Acquisition

Určit způsob načtení podle typu zdroje.

Typicky:
- SQL extraction;
- API;
- CSV;
- JSON;
- Excel;
- další souborové nebo systémové zdroje.

U každého zdroje musí být jasné:
- odkud se data načítají;
- jakým způsobem;
- jaké parametry nebo dotazy se používají;
- kam se data ukládají.

## Raw Layer

Raw data uchovávat co nejblíže původnímu zdroji.

Hlavní účel:
- návrat k původním datům;
- dohledání chyby;
- audit;
- reprocessing;
- porovnání s transformovanými daty.

Raw vrstvu nepřepisovat business transformacemi.

## Timestamp načtení

Evidovat minimálně čas načtení.
```text
load_timestamp
→ kdy byla data načtena
```

Používá se pro:
- audit;
- data freshness;
- dohledatelnost;
- kontrolu běhů pipeline.

Samotný timestamp nestačí pro incremental load. Pro rozpoznání nových dat lze podle zdroje použít například:
- business key;
- source ID;
- last_modified;
- watermark;
- file name + date;
- hash.

## Oddělení raw dat

Raw data musí být oddělena od:
- staging;
- cleaned / curated dat;
- analytických tabulek;
- finálních výstupů.

Tím se zabrání ztrátě původního vstupu.

## Reprodukovatelnost

Proces musí být možné znovu spustit stejným postupem a se stejnými vstupy.

Dohledatelné mají být zejména:
- zdroj;
- query / endpoint / soubor;
- parametry;
- čas načtení;
- použitý skript nebo verze kódu.

## Data Provenance a Lineage

Dokumentovat minimálně:
- zdroj dat;
- cíl načtení;
- datum a čas načtení;
- období nebo rozsah načtených dat;
- použitý způsob získání dat.

## Run Metadata a Logging

Evidovat průběh konkrétního načtení.

Minimálně:
```text
start_time
end_time
status
rows_loaded
error_message
```

Podle potřeby také:
- file_name;
- endpoint;
- query;
- source_period;
- script_version.

## Výstup fáze Data Acquisition a Raw Layer

Po dokončení musí být jasné:
```text
Sources
Acquisition Method
Raw Storage
Load Timestamp
Incremental Load Logic
Reproducibility
Data Provenance
Run Metadata
```

---

# 5. Data Quality, Cleaning a Validation

Cílem je ověřit, že data jsou technicky i businessově použitelná pro další analýzu a publikaci.

Základní princip:
```text
Raw Data
→ Data Quality Checks
→ Cleaning
→ Validation
→ Trusted Data
```

## Missing Values

Rozlišit:
```text
Missing Value
→ hodnota chybí
```

Chybějící hodnota nemusí být automaticky chyba. Záleží na významu sloupce a business pravidlech.

## Duplicity

Kontrolovat:
- full-row duplicates;
- duplicity podle business key.

```text
Business Key
→ určuje jedinečnost podle business logiky
```

Duplicita podle business key nemusí být automaticky chyba. Záleží na očekávané granularitě a business významu dat.

## Datové typy

Ověřit, že datový typ odpovídá významu sloupce.

Kontrolovat zejména:
- čísla vs. text;
- datum a čas;
- ID;
- desetinné hodnoty;
- boolean hodnoty;
- kompatibilní typy klíčů mezi tabulkami.

```text
Wrong Data Type
→ problém struktury

Invalid Value
→ typ je správný, ale hodnota porušuje pravidlo
```

## Neplatné hodnoty

Kontrolovat hodnoty, které existují, ale porušují očekávání nebo pravidla.

Typicky:
- záporné hodnoty tam, kde nedávají smysl;
- hodnoty mimo povolený rozsah;
- neplatná data;
- nesmyslné kombinace hodnot.

## Klíče

Kontrolovat:
- primary keys;
- business keys;
- uniqueness;
- NULL v povinných klíčích.

```text
Key Validation
→ kvalita klíče samotného
```

## Referenční integrita

Ověřit, že vazby mezi tabulkami skutečně existují.

```text
Foreign Key
→ musí odpovídat existujícímu klíči v referenční tabulce
```

```text
Referential Integrity
→ kvalita vazby mezi tabulkami
```

## Časová návaznost

Ověřit, že data dávají smysl v čase.

Kontrolovat například:
- mezery v časové řadě;
- nežádoucí překryvy období;
- správné pořadí událostí;
- valid_from / valid_to;
- budoucí datumy tam, kde nemají být;
- očekávané období dat.

## Business Rules

Business pravidla vycházejí z fungování firmy nebo procesu.

```text
Business Rule
→ datová podmínka odvozená z business logiky
```

Pravidla musí být potvrzena business ownerem nebo domain expertem, pokud nejsou zřejmá.

## Reconciliation

Ověřit, že se data během zpracování neztratila, nezdvojila nebo nezměnila bez vysvětlení.

Typické kontroly:

```text
Raw Rows
= Valid Rows + Rejected Rows
```

a podle potřeby:
- počet řádků před a po transformaci;
- rejected rows;
- duplicity;
- důležité součty;
- počet entit;
- očekávané období.

Rozdíl může existovat, ale musí být vysvětlitelný.

## Audit Trail

Zachovat zpětnou dohledatelnost transformačních kroků.

Dohledatelné mají být zejména:
- provedený krok;
- čas změny;
- použitý skript nebo verze logiky;
- dotčená data;
- počet změněných, doplněných nebo vyřazených řádků.

## Validace před publikací

Před publikací ověřit technickou i businessovou správnost výsledku.

```text
Technical Validation
→ data jsou technicky v pořádku

Business Validation
→ data dávají smysl podle business pravidel

Publication Gate
→ výstup lze bezpečně publikovat
```

Typické stavy:
```text
SUCCESS
→ publikovat

WARNING
→ publikovat pouze pokud to pravidla dovolují

FAILED
→ nepublikovat
```

## Výstup fáze Data Quality, Cleaning a Validation

Po dokončení musí být jasné:
```text
Missing Values
Duplicates
Data Types
Invalid Values
Keys
Referential Integrity
Temporal Consistency
Business Rules
Reconciliation
Audit Trail
Publication Validation
```

---

# 6. Transformation a Business Logic

Cílem je převést validovaná data do analyticky použitelné podoby a aplikovat potvrzenou business logiku.

Základní tok:
```text
Validated Data
→ Transformation
→ Business Logic
→ Gold / Analytical Data
```

## Filtrování

Filtrování vybírá pouze relevantní řádky.
```text
Filtering
→ mění rozsah dat
→ granularita zůstává stejná
```

Použít zejména pro:
- výběr období;
- omezení na konkrétní entity;
- odstranění nerelevantních záznamů;
- přípravu dat pro další analýzu.

## Joiny

Joiny propojují související tabulky podle klíčů.

Prověřit:
- použité join keys;
- typ joinu;
- kardinalitu;
- dopad na počet řádků;
- vznik NULL hodnot;
- riziko many-to-many vazby.

```text
JOIN
→ propojuje tabulky
→ počet řádků se může změnit
```

## Agregace

Agregace seskupují více řádků do vyšší úrovně.

```text
Aggregation
→ mění granularitu
```

Prověřit:
- group by úroveň;
- použité metriky;
- zda agregace odpovídá business otázce;
- zda nedochází ke ztrátě potřebného detailu.

## Výpočty

Výpočty vytvářejí nové hodnoty z existujících dat.

Typicky:
- revenue;
- cost;
- profit;
- margin;
- variance;
- další odvozené metriky.

Výpočty musí mít jasnou definici a odpovídat potvrzené business logice.

## Business kategorizace

Business kategorizace přiřazuje data do kategorií podle obchodních pravidel.

```text
Business Categorization
→ výpočet nebo klasifikace podle business logiky
```

Pravidla musí být potvrzená business ownerem nebo domain expertem.

## SQL vs. Python

Transformace rozdělit podle toho, kde jsou nejčitelnější, nejefektivnější a nejsnáze udržovatelné.

### SQL

Vhodné zejména pro:
- filtrování;
- joins;
- agregace;
- relační transformace;
- views;
- stabilní reportingové tabulky.

### Python

Vhodný zejména pro:
- cleaning;
- různé typy zdrojů;
- API, JSON, Excel;
- složitější validace;
- nestandardní transformace;
- integrační logiku;
- automatizaci a logging.

Hlavní princip:
```text
ne všechno do SQL
ne všechno do Pythonu
→ každou transformaci tam, kde dává největší smysl
```

## Facts a Dimensions

Při přípravě analytického modelu rozlišit:
```text
Fact Table
→ měřitelné události a hodnoty

Dimension Table
→ popisný kontext
```

U fact table musí být jasně definovaná granularita.

Typicky:
```text
Fact
→ co se stalo a kolik

Dimension
→ kdo / co / kde / kdy / jaký typ
```

## Gold / Analytical Tables

Gold tabulky obsahují data připravená pro konkrétní analytické nebo reportingové použití.

```text
Curated / Clean
→ data jsou vyčištěná a validovaná

Gold / Analytical
→ data jsou připravená k použití
```

Gold vrstva může obsahovat:
- fact tables;
- dimension tables;
- stabilní agregace;
- reportingové tabulky;
- připravené business výpočty.

## Dokumentace transformačních pravidel

Každé důležité transformační pravidlo má být dohledatelné.

Dokumentovat zejména:
- vstup;
- použitou logiku;
- výstup;
- business význam;
- místo implementace.

Základní princip:
```text
Input
→ Rule
→ Output
```

Pro audit a provoz navíc evidovat:
- čas běhu;
- verzi skriptu nebo logiky;
- počet zpracovaných řádků;
- status transformace.

## Výstup fáze Transformation a Business Logic

Po dokončení musí být jasné:
```text
Filters
Joins
Aggregations
Calculations
Business Categories
SQL vs. Python Split
Fact Tables
Dimension Tables
Gold Tables
Transformation Rules
```

---

# 7. Exploratory Data Analysis

Cílem EDA je systematicky prozkoumat připravená data, pochopit jejich chování a najít zjištění relevantní pro business otázky.

Základní tok:
```text
Prepared Data
→ Explore
→ Compare
→ Detect Patterns
→ Test Questions
→ Business Findings
```

## Distribuce

Distribuce popisuje, jak jsou hodnoty rozložené.

Sledovat zejména:
- minimum a maximum;
- průměr a medián;
- kvartily;
- rozptyl nebo směrodatnou odchylku;
- četnosti a podíly;
- tvar rozdělení.

Distribuce pomáhá určit, co je běžné a co neobvyklé.

## Trendy

Trend popisuje dlouhodobější vývoj v čase.

Sledovat:
- směr vývoje;
- sezónnost;
- změny mezi obdobími;
- dlouhodobé růsty nebo poklesy.

## Porovnání skupin

Porovnávat relevantní segmenty, například:
- regiony;
- typy zákazníků;
- produkty;
- kategorie;
- pobočky;
- období.

Cílem je zjistit, kde se skupiny významně liší.

## Odchylky

Odchylka vyjadřuje rozdíl proti referenční hodnotě.

Typicky:
```text
Actual vs Budget
Actual vs Previous Year
Actual vs Average
Actual vs Forecast
```

Odchylka nemusí být automaticky problém. Je potřeba posoudit její význam.

## Outliers

Outlier je výrazně neobvyklá hodnota oproti většině dat.

```text
Deviation
→ běžná odchylka

Outlier
→ výrazně neobvyklá hodnota
```

Outlier může být:
- chyba v datech;
- skutečně výjimečný případ;
- důležitý business signál.

Proto se nemá automaticky odstraňovat bez ověření.

## Vztahy mezi proměnnými

Zkoumat, zda změny jedné proměnné souvisejí se změnami jiné.

```text
Correlation
→ proměnné se mění společně

Causation
→ změna jedné způsobuje změnu druhé
```

Korelace sama o sobě neprokazuje kauzalitu.

## Segmentace

Segmentace rozděluje data do smysluplných skupin podle zvolených kritérií.

Segmentace má vycházet z business významu, například podle:
- regionu;
- zákaznického typu;
- produktové kategorie;
- velikosti objednávky;
- ziskovosti;
- chování.

## Formulace a ověřování hypotéz

Hypotéza je předpoklad, který chceme ověřit pomocí dat.

```text
Hypothesis Formulation
→ stanovím předpoklad

Hypothesis Evaluation
→ hledám důkazy pro nebo proti němu
```

V EDA může být ověření neformální. Formální statistické testování patří do samostatné fáze, pokud je pro projekt relevantní.

## Business Findings

EDA nemá končit pouze popisem dat.

Rozlišit:
```text
Data Finding
→ co jsme v datech zjistili

Business Finding
→ proč je to důležité pro firmu
```

Relevantní business zjištění:
- souvisí s analytickou otázkou;
- je podložené daty;
- může ovlivnit rozhodnutí nebo další postup.

Hlavní princip:
```text
Observation
→ Interpretation
→ Business Impact
→ Possible Action
```

## Výstup fáze EDA

Po dokončení musí být jasné:

```text
Distributions
Trends
Group Comparisons
Deviations
Outliers
Relationships
Segments
Hypotheses
Business Findings
```

---

# 8. Statistical Data Analysis

Statistickou analýzu použít pouze tehdy, pokud pomáhá odpovědět na business otázku.

Základní princip:
```text
Business Question
→ EDA
→ Statistical Method
→ Interpretation
→ Business Meaning
```

## Deskriptivní statistika

Deskriptivní statistika popisuje data, která máme.

Typicky:
- průměr;
- medián;
- minimum a maximum;
- kvartily;
- rozptyl;
- směrodatná odchylka;
- četnosti a podíly.

```text
Descriptive Statistics
→ co vidíme v datech
```

## Korelace

Korelace vyjadřuje, zda a jak silně spolu dvě proměnné statisticky souvisejí.

Sledovat:
- směr vztahu;
- sílu vztahu;
- business význam vztahu.

```text
Correlation
≠ Causation
```

Korelace sama o sobě neprokazuje příčinu.

## Testování rozdílů

Používá se pro posouzení, zda pozorovaný rozdíl mezi skupinami může být statisticky významný.

Rozlišit:
```text
Statistical Significance
→ rozdíl pravděpodobně není pouze náhodný

Business Significance
→ rozdíl je dost významný pro rozhodování
```

Statistická významnost sama o sobě nestačí.

## Intervaly spolehlivosti

Confidence interval vyjadřuje nejistotu odhadu.

```text
Narrow Interval
→ přesnější odhad

Wide Interval
→ vyšší nejistota
```

Interval spolehlivosti pomáhá posoudit, jak přesný je odhad populační hodnoty.

## Jednoduchá regrese

Jednoduchá regrese modeluje vztah mezi:
```text
X
→ nezávislá proměnná

Y
→ závislá proměnná
```

Používá se například pro:
- odhad změny Y při změně X;
- kvantifikaci vztahu;
- jednoduchou predikci;
- posouzení vysvětlené variability.

```text
Regression
≠ automaticky causation
```

## Interpretace výsledku

Statistický výsledek musí být interpretován v kontextu business otázky.

Nestačí pouze uvést technický výsledek.

Prověřit:
- velikost efektu;
- business význam;
- velikost vzorku;
- nejistotu;
- možné alternativní vysvětlení;
- omezení analýzy.

Hlavní princip:
```text
Statistical Result
→ Practical Meaning
→ Business Meaning
→ Limitations
```

## Omezení a riziko nesprávného závěru

Při interpretaci statistiky je potřeba zohlednit:
- nereprezentativní vzorek;
- malý počet pozorování;
- outliers;
- chybějící proměnné;
- korelaci zaměněnou za kauzalitu;
- statisticky významný, ale businessově nevýznamný rozdíl.

Nesprávná interpretace může vést k chybnému business rozhodnutí.

## Výstup fáze Statistical Data Analysis

Po dokončení musí být jasné:
```text
Descriptive Statistics
Correlation
Difference Testing
Confidence Intervals
Simple Regression
Statistical Interpretation
Business Meaning
Limitations
```

---

# 9. Datový a sémantický model

Cílem je uspořádat analytická data do přehledného modelu, který podporuje správné výpočty, filtrování a reporting.

Základní tok:
```text
Analytical Data
→ Fact + Dimensions
→ Relationships
→ Measures
→ Semantic Model
→ Reporting
```

## Granularita fact table

Granularita určuje, co představuje jeden řádek fact table.

```text
Fact Table Granularity
→ co představuje jeden řádek
```

Musí být jasná před návrhem measures, vztahů a agregací.

## Fact a Dimension Tables

```text
Fact Table
→ měřitelné události a hodnoty

Dimension Table
→ popisný kontext
```

Typicky:
```text
Fact
→ co se stalo a kolik

Dimension
→ kdo / co / kde / kdy / jaký typ
```

Fact table obvykle obsahuje foreign keys do dimenzí.

## Surrogate Keys

Surrogate key je technicky vytvořený klíč používaný v analytickém modelu.

V dimenzní tabulce typicky funguje jako primary key.

```text
Dimension
→ surrogate key / primary key

Fact
→ foreign key
→ odkazuje na surrogate key v dimenzi
```

Business key zůstává oddělený jako identifikátor ze zdrojového systému.

## Vztahy

Vztahy určují, jak jsou tabulky propojené.

Prověřit:
- spojovací klíče;
- směr vztahu;
- aktivní vztahy;
- možné nejednoznačnosti.

## Kardinalita

Kardinalita určuje, kolik řádků v jedné tabulce souvisí s kolika řádky ve druhé.

Typicky:
```text
1:1
1:N
M:N
```

V analytickém modelu je nejběžnější:
```text
Dimension 1
→ N Fact
```

M:N vztahy používat opatrně.

## Kalendářní dimenze

DimDate poskytuje jednotný časový kontext pro model.

Typicky obsahuje:
- datum;
- rok;
- čtvrtletí;
- měsíc;
- týden;
- den;
- další kalendářní atributy.

```text
DimDate
→ jeden řádek za jeden den
```

Klíčem může být:
- datum;
- technický surrogate key;
- číselný klíč ve formátu YYYYMMDD.

## Jednosměrné filtrování

V typickém star schema preferovat:
```text
Dimension
→ Fact
```

Výhody:
- předvídatelné filtrování;
- jednodušší model;
- menší riziko nejednoznačností;
- snazší ladění;
- lepší výkon.

Ve snowflake schema může filtr pokračovat přes více dimenzních tabulek směrem k fact table.

## Measures

Measure je dynamický výpočet závislý na filter contextu.

Typicky:
- Revenue;
- Profit;
- Margin %;
- YoY;
- Variance;
- další KPI.

```text
Measure
→ co počítáme
```

## Calculated Columns

Calculated Column se počítá pro každý řádek tabulky.

Používat pouze tehdy, pokud není vhodnější vytvořit stabilní sloupec dříve v SQL nebo Power Query.

Hlavní princip:
```text
Stable row-level transformation
→ SQL / Power Query

Model-specific row logic
→ Calculated Column

Dynamic calculation
→ Measure
```

## Hierarchie

Hierarchie umožňuje drill-down mezi úrovněmi detailu.

Typicky:
```text
Year
→ Quarter
→ Month
→ Day
```

```text
Hierarchy
→ jak se pohybujeme v datech mezi úrovněmi detailu
```

## Formátování

Nastavit správné formáty pro:
- měny;
- procenta;
- datum;
- desetinná čísla;
- celá čísla;
- další business metriky.

## Skrytí technických sloupců

V reportovacím modelu skrýt sloupce, které uživatel nepotřebuje.

Typicky:
- surrogate keys;
- foreign keys;
- load timestamps;
- technické flags;
- pomocné sloupce.

Technické sloupce mohou zůstat v modelu kvůli vztahům nebo výpočtům, ale nemají být zbytečně viditelné uživateli.

## Výstup fáze Datový a sémantický model

Po dokončení musí být jasné:
```text
Fact Granularity
Fact Tables
Dimension Tables
Surrogate Keys
Relationships
Cardinality
Date Dimension
Filter Direction
Measures
Calculated Columns
Hierarchies
Formatting
Hidden Technical Columns
```

---

# 10. KPI a DAX

Cílem je převést business požadavky do správně definovaných measures a KPI v Power BI.

Základní princip:
```text
Business Question
→ KPI Definition
→ DAX Measure
→ Filter Context
→ Business Interpretation
```

## Základní measures

Základní measure vyjadřuje absolutní hodnotu.

Typicky:
```text
Revenue
Profit
Orders
Quantity
Customers
```

Základní measure může být technická nebo pomocná a nemusí být KPI.

## Poměrové ukazatele

Poměrová measure vyjadřuje relativní vztah mezi dvěma hodnotami.

Typicky:
```text
Margin %
Conversion Rate
Defect Rate
Share %
Variance %
```

Poměr se obvykle počítá z agregovaných hodnot:
```text
SUM(numerator) / SUM(denominator)
```

Ne jako prostý průměr řádkových procent, pokud business definice neříká jinak.

## Časové porovnání

Časové measures porovnávají výkon mezi obdobími.

Typicky:
```text
YoY
→ stejné období proti předchozímu roku

MoM
→ měsíc proti předchozímu měsíci

YTD
→ od začátku roku do aktuálního data
```

Při porovnání musí být období časově srovnatelná.

## Plan vs Actual

Plán a skutečnost se porovnávají absolutně i relativně.

```text
Absolute Variance
= Budget - Actual

Variance %
= (Budget - Actual) / Budget
```

Směr znaménka musí odpovídat business významu.

Například překročení plánu může být pozitivní u revenue, ale negativní u nákladů.

Pro dělení v DAX preferovat `DIVIDE()` kvůli bezpečnému řešení dělení nulou.

## Dynamické filtrování

Measure se přepočítává podle aktuálního filter contextu.

Výsledek může ovlivnit například:
```text
čas
region
produkt
zákazník
segment
kombinace více filtrů
```

Základní princip:
```text
Measure
+ Filter Context
→ Result
```

## Správný kontext výpočtu

Správný výsledek nevzniká pouze správným vzorcem.

Je nutné, aby measure pracovala nad správnou množinou dat a respektovala správné filtry.

```text
Correct Formula
+ Correct Filter Context
→ Correct Business Result
```

## CALCULATE

`CALCULATE()` přepočítá výraz po úpravě filter contextu.

Laicky:
```text
CALCULATE
→ vezmi výpočet
→ uprav filtry
→ přepočítej výsledek
```

Může měnit například časový, produktový, regionální nebo segmentový kontext.

Používá se například pro:
```text
YoY
podíl na celku
výpočty pro vybraný segment
výpočty ignorující určitý filtr
```

## FILTER

`FILTER()` vrací pouze řádky, které splňují zadanou podmínku.

Použití:
```text
FILTER(
    tabulka,
    podmínka
)
```

Jednoduchý filtr lze často zadat přímo v `CALCULATE()`.

```text
jednoduchá podmínka
→ CALCULATE + přímý filtr

složitější řádková logika
→ CALCULATE + FILTER
```

## Measure vs KPI

Measure je výpočet v datovém modelu.

KPI je measure s jasným business významem, která se používá pro hodnocení výkonu, stavu nebo cíle.

```text
Každé KPI může být measure,
ale ne každá measure je KPI.
```

## Business význam measure

Každá důležitá measure musí mít jasný popis.

Musí být zřejmé:
```text
co measure měří
jak se počítá
proč je důležitá
jak ji interpretovat
jaké filtry ji ovlivňují
jaká má omezení nebo výjimky
```

## Výstup fáze KPI a DAX

Po dokončení musí být jasné:
```text
Basic Measures
Ratio Measures
Time Comparisons
Plan vs Actual
Dynamic Filtering
Calculation Context
CALCULATE Logic
FILTER Logic
KPI Definitions
Business Meaning
```

---

# 11. Dashboard

Cílem dashboardu je prezentovat důležité informace tak, aby cílový uživatel rychle pochopil stav, odchylky a relevantní souvislosti pro rozhodování.

Základní princip:
```text
Target User
→ Information Priority
→ Visual Structure
→ Interaction
→ Interpretation
→ Decision Support
```

## Cílová skupina

Dashboard musí odpovídat potřebám konkrétního uživatele.

Typicky:
```text
Management
→ hlavní KPI
→ trendy
→ výjimky
→ minimum detailu

Operations
→ konkrétní stav
→ detailnější rozpad
→ rychlá akce

Analyst
→ více detailu
→ více filtrů
→ hlubší analýza
```

Cílová skupina určuje:
```text
co ukázat
jak podrobně
v jakém pořadí
jaké interakce umožnit
```

## Informační hierarchie

Dashboard má uživateli ukázat, na co se podívat nejdřív a kde najde detail.

Typická logika:
```text
1. hlavní KPI
2. trend nebo odchylka
3. porovnání kategorií
4. detail
5. doplňující filtry
```

Hlavní princip:
```text
nejdřív pochopit stav
→ potom důvod
→ potom detail
```

## KPI karty

KPI karty používat pro hlavní business ukazatele.

Každá karta musí mít jasný význam a nemá duplikovat jinou informaci.

Počet KPI karet se řídí potřebami cílové skupiny, ne pevným číslem.

Pokud je KPI příliš mnoho, rozdělit obsah na více stránek.

## Trendy

Pro vývoj KPI v čase typicky použít spojnicový graf.

```text
čas
→ osa X

KPI
→ osa Y
```

Zkontrolovat správné pořadí časové osy a vhodnou granularitu.

## Porovnání kategorií

Pro porovnání kategorií typicky použít bar chart.

Typicky:
```text
Region / Product / Category
→ kategorie

Revenue / Profit / Orders
→ hodnota
```

U většího počtu kategorií může být vhodnější horizontální bar chart.

## Tabulkové detaily

Tabulku použít, když uživatel potřebuje přesné hodnoty, více atributů nebo detail jednotlivých položek.

Praktické pravidlo:
```text
Overview
→ grafy

Detail / kontrola / dohledání hodnoty
→ tabulka
```

Tabulka musí mít jasný účel a nemá být pouze výpis všech dostupných dat.

## Filtry a slicery

Dimenzní tabulky jsou přirozeným zdrojem kandidátů na slicery.

Typicky:
```text
DimDate
→ období

DimProduct
→ produkt / kategorie

DimRegion
→ region

DimCustomer
→ zákazník / segment
```

Ne každá dimenze musí být slicer.

Rozhoduje:
```text
business relevance
+ frequency of use
```

## Tooltipy

Základní tooltip bývá u standardních Power BI vizuálů automatický.

Použít vlastní tooltip pouze tehdy, když přidává užitečný detail bez přeplnění hlavní stránky.

```text
Default tooltip
→ základní hodnoty vizuálu

Custom tooltip
→ další KPI, kontext nebo detail
```

## Navigace

Navigace řeší pohyb mezi částmi reportu.

Typicky:
```text
Overview
→ Detail
→ Segment / Region / Product
→ zpět
```

Lze použít:
- page navigation;
- buttons;
- bookmarks;
- drill-through.

Navigace má být jednoduchá a konzistentní.

## Drill-through

Drill-through umožňuje přejít z přehledu na jinou stránku s detailem vybrané hodnoty.

```text
Overview
→ vybraný prvek
→ Detail page
→ automaticky filtrovaná na vybranou hodnotu
```

Rozdíl:
```text
Drill-down
→ detail uvnitř hierarchie vizuálu

Drill-through
→ přechod na jinou stránku s detailem
```

## Čitelnost

Dashboard musí být rychle pochopitelný.

Čitelnost zhoršuje:
- příliš mnoho vizuálů;
- malé písmo;
- slabý kontrast;
- příliš mnoho barev;
- nejasné názvy;
- špatné zarovnání;
- zbytečný detail.

Hlavní princip:
```text
méně vizuálů
+ jasná hierarchie
+ konzistentní formátování
= lepší čitelnost
```

## Omezení počtu vizuálů

Každý vizuál musí mít jasný účel.

Pokud nepodporuje business otázku nebo rozhodnutí, pravděpodobně není potřeba.

Místo přeplněné stránky je vhodné rozdělit obsah do více logických stránek.

## Podpora rozhodování

Dashboard má pomoci cílovému uživateli dělat lepší nebo rychlejší rozhodnutí.

Kontrolní otázka:
```text
Jaké rozhodnutí má uživatel díky tomuto dashboardu udělat lépe nebo rychleji?
```

Pokud na tuto otázku nelze odpovědět, dashboard může být pouze reportingem bez jasné decision-support role.

## Výstup fáze Dashboard

Po dokončení musí být jasné:
```text
Target Audience
Information Hierarchy
KPI Cards
Trends
Category Comparisons
Detail Tables
Filters and Slicers
Tooltips
Navigation
Drill-through
Readability
Visual Limits
Decision Support
```

---

# 12. Interpretace a doporučení

Cílem je převést analytický výsledek do srozumitelného business závěru a doporučení.

Hlavní zásada:
```text
Výsledek
≠ pouze číslo

Výsledek
= číslo
+ kontext
+ význam
+ doporučení
```

## Hlavní zjištění

Hlavní zjištění shrnuje, co data ukazují.

Mělo by být:
- konkrétní;
- datově podložené;
- relevantní k business otázce;
- stručné.

## Business význam

Business význam vysvětluje, proč je zjištění důležité pro firmu.

Typicky odpovídá na otázky:
```text
Proč je to důležité?
Jaký to má dopad?
Jaké rozhodnutí to ovlivňuje?
```

## Fakt vs domněnka

Oddělit to, co data skutečně dokazují, od toho, co je pouze hypotéza.

```text
Fakt
→ podložený daty

Domněnka
→ možné vysvětlení bez dostatečného důkazu
```

Pokud příčina není potvrzená, formulovat ji jako hypotézu nebo oblast k dalšímu ověření.

## Omezení analýzy

Omezení popisují hranice platnosti analýzy.

Typicky:
- omezená historie;
- chybějící proměnné;
- nízká granularita;
- omezený rozsah dat;
- neúplná reprezentativnost.

```text
Limitation
→ co analýza neumí spolehlivě říct
```

## Rizika

Riziko je možný negativní důsledek špatné interpretace nebo použití výsledku.

```text
Limitation
→ hranice analýzy

Risk
→ co se může pokazit při použití závěru
```

## Doporučení

Doporučení musí být konkrétní a proveditelné.

Mělo by být jasné:
```text
co udělat
kdo je owner
kdy to udělat
případně jak
na základě jakého zjištění
```

Doporučení není garance výsledku.

Analytik odpovídá za datově podložené, transparentní a přiměřené doporučení.

Business owner odpovídá za rozhodnutí a implementaci.

## Očekávaný přínos

Očekávaný přínos popisuje možný pozitivní dopad doporučení.

```text
Expected Benefit
→ očekávaný pozitivní dopad

Guaranteed Result
→ jistý výsledek
```

V analytice je vhodné formulovat přínos jako očekávání, ne jako jistotu.

## Navržený další krok

Next Step určuje bezprostřední pokračování.

Může jít například o:
- doplnění dat;
- ověření hypotézy;
- pilotní test;
- implementaci doporučení;
- sledování KPI po změně;
- vyhodnocení dopadu;
- navazující analýzu.

```text
Recommendation
→ co by měl business udělat

Next Step
→ co uděláme jako další konkrétní krok
```

## Doporučená struktura závěru

```text
Finding
→ Business Meaning
→ Limitation
→ Risk
→ Recommendation
→ Expected Benefit
→ Next Step
```

## Výstup fáze Interpretace a doporučení

Po dokončení musí být jasné:
```text
Main Findings
Business Meaning
Facts vs Assumptions
Limitations
Risks
Recommendations
Expected Benefits
Next Steps
```

---

# 13. Automation a Monitoring

Cílem je automatizovat opakovaný analytický proces pouze tam, kde to dává businessově a provozně smysl.

Hlavní zásada:
```text
Automation
→ jen pro opakované zpracování
→ s jasnou frekvencí nebo triggerem
→ pokud šetří čas nebo snižuje riziko chyby
```

Základní tok:
```text
Input
→ Validation
→ Processing
→ Error Handling
→ Logging
→ Publish Gate
→ Power BI Refresh
→ Monitoring
```

## Převod procesu do `.py`

Opakované manuální kroky převést do spustitelného skriptu nebo více skriptů.

Typicky:
```text
extract
→ validate
→ transform
→ load
→ log
```

Výhody:
- úspora času;
- méně manuálních chyb;
- konzistentní postup;
- lepší reprodukovatelnost.

## Scheduler

Scheduler určuje, kdy nebo za jakých podmínek se proces spustí.

```text
.py script
→ co se má udělat

Scheduler
→ kdy se to má spustit
```

## Pipeline

Pipeline je celý navazující proces.

Může obsahovat:
- ingestion;
- Python skripty;
- validace;
- SQL kroky;
- transformace;
- publikaci;
- Power BI refresh;
- monitoring.

Python skript může být pouze jednou částí pipeline.

## Validace vstupů

Před zpracováním ověřit, zda jsou vstupy použitelné.

Kontrolovat například:
- dostupnost souboru nebo API;
- očekávané sloupce;
- datové typy;
- klíčová pole;
- objem dat;
- očekávané období.

Validace nemusí mít pouze dva stavy.

```text
INFO
→ vše v pořádku

WARNING
→ odchylka existuje, ale proces může pokračovat

FAILED
→ problém je kritický, proces se zastaví
```

## Error Handling

Error handling řeší, co se stane při chybě během běhu procesu.

Typicky:
```text
error
→ zachytit
→ zalogovat
→ rozhodnout retry / stop
→ nepublikovat chybný výstup
```

Validace říká, zda jsou data nebo stav přijatelné.

Error handling říká, co dělat, když se něco pokazí.

## Logging

Log musí umožnit zpětně zjistit, co se při běhu stalo.

Typicky obsahuje:
```text
task / run name
start time
end time
duration
status
error message
rows in
rows out
rows rejected
```

Podle kroku lze sledovat i počty řádků při ingestion, validation, cleaning a transformation.

Logging není jen pro chyby. Auditní stopu má mít i úspěšný běh.

## Secrets

Citlivé údaje nesmí být natvrdo uložené ve skriptu ani veřejném repozitáři.

Typicky:
- passwords;
- API keys;
- access tokens;
- connection strings.

Preferovat:
```text
environment variables
secret store
protected configuration
```

## Bezpečná publikace

Nový výstup se publikuje pouze tehdy, když projde požadovanými kontrolami.

```text
SUCCESS
→ publikovat

WARNING
→ publikovat jen pokud je warning přijatelný

FAILED
→ nepublikovat
```

## Power BI Refresh

Power BI refresh má navazovat až na validní výstup pipeline.

```text
Pipeline SUCCESS
→ refresh povolit

Pipeline WARNING
→ refresh podle pravidel

Pipeline FAILED
→ refresh nespustit
```

Cílem je zabránit načtení chybných nebo neúplných dat do reportu.

## Kontrola poslední aktualizace

Uživatel musí vědět, jak aktuální data sleduje.

Sledovat minimálně:
```text
last successful pipeline run
last successful Power BI refresh
data freshness / data period
```

## Zachování posledního správného výstupu

Selhání nového běhu nemá automaticky znamenat znepřístupnění reportu.

Lepší postup:
```text
FAILED new run
→ nepřepsat validní výstup
→ zachovat poslední správná data
→ zobrazit Last Successful Refresh
→ upozornit na selhání procesu
```

Uživatel musí jasně poznat, že data nejsou aktuální.

## Výstup fáze Automation a Monitoring

Po dokončení musí být jasné:
```text
Automation Need
Python Script
Scheduler
Pipeline
Input Validation
Error Handling
Logging
Secrets
Safe Publication
Power BI Refresh
Last Successful Refresh
Last Valid Output
```

---

# 14. Delivery a distribuce

Delivery řeší, **jak se hotový analytický výstup dostane ke správnému uživateli, ve správném formátu, ve správný čas a se správnými oprávněními**.

## Formát výstupu

**Power BI**
- pravidelný reporting;
- interaktivní dashboardy;
- KPI monitoring;
- sdílení více uživatelům.

**Excel**
- další ruční práce s daty;
- vlastní výpočty;
- jednorázové předání;
- menší objemy dat.

**CSV**
- jednoduchá výměna tabulkových dat;
- široká kompatibilita.

**Parquet**
- vhodnější pro větší datové objemy;
- efektivnější ukládání;
- zachovává datové typy.

**Databázová tabulka**
- vhodná pro další reporty, analýzy, aplikace a automatizované procesy;
- centrální zdroj pro více uživatelů nebo systémů.

## Sdílení výsledku

Je potřeba určit:
- co se sdílí;
- komu;
- jakým kanálem;
- kdy.

Distribuční kanál má odpovídat způsobu použití výstupu.

## Cílový uživatel

Forma výstupu se přizpůsobuje uživateli:
```text
management
→ hlavní KPI a závěry

analytik
→ detailnější data

operativa
→ konkrétní data pro každodenní práci

systém / aplikace
→ strukturovaná data
```

## Frekvence distribuce

Frekvence obvykle vychází už z business požadavku.

```text
denně
→ operativní řízení

týdně
→ pravidelný management review

měsíčně
→ finanční / výkonnostní reporting

ad hoc
→ jednorázová analýza nebo mimořádný požadavek
```

## Oprávnění

```text
View / Read
→ zobrazit

Export
→ stáhnout data

Build
→ vytvářet vlastní reporty nad datasetem

Edit / Write
→ upravovat report nebo dataset

Admin / Owner
→ správa obsahu a přístupů
```

Princip:
```text
least privilege
→ uživatel dostane pouze oprávnění, která potřebuje
```

**Row-Level Security (RLS)** omezuje, která data konkrétní uživatel vidí.

```text
regionální manažer
→ vidí pouze svůj region
```

## Verze výstupu

Verzování umožňuje odlišit změny výstupu a zachovat jejich dohledatelnost.

```text
v1.0 → v1.1
minor change
→ drobná oprava, filtr, vizuální změna

v1.1 → v2.0
major change
→ změna KPI, business logiky nebo metodiky
```

Traceability:
```text
co se změnilo
→ kdy
→ proč
→ kdo změnu provedl
→ která verze je aktuální
```

## Archivace

Archivace řeší uchování starých nebo neaktivních verzí.

```text
Active
→ aktuální verze

Archive
→ starší verze, stále dohledatelná

Obsolete / Retired
→ nahrazený nebo již nerelevantní výstup
```

Je potřeba určit:
- co archivujeme;
- kde;
- jak dlouho;
- kdo má přístup.

```text
Versioning
→ rozlišuje změny výstupu

Archiving
→ uchovává staré / neaktivní verze
```

---

# 15. Dokumentace a GitHub

Cílem dokumentace je, aby jiný člověk dokázal rychle pochopit:
* co projekt řeší;
* jak funguje;
* jaké nástroje používá;
* jak ho spustit;
* jaké má výstupy a omezení.

## README

README je stručný přehled celého projektu.

Mělo by obsahovat:
```text
Project Overview
→ co projekt řeší
→ oblast
→ cílový uživatel
→ hlavní výstup

Business Problem
→ proč projekt vznikl
→ business zadání
→ podporované rozhodnutí

Data Sources
→ zdroj
→ typ / technologie
→ obsah dat

Architecture
→ workflow / pipeline
→ návaznost od zdroje po výstup

Tools
→ role SQL, Pythonu, Power Query, Power BI...

Data Quality
→ hlavní problémy
→ způsob jejich řešení

Transformation Process
→ ETL / ELT
→ hlavní task groups
→ použité technologie

KPI
→ co měří
→ business význam

Analysis
→ hlavní typy analýz
→ business otázky

Dashboard
→ struktura
→ aktualizace
→ 1–2 screenshoty

Findings
→ summary hlavních zjištění

Recommendations
→ doporučení navazující na findings

Automation
→ co je automatizované
→ trigger / frekvence
→ chování při chybě

Limitations
→ hlavní omezení interpretace nebo použití

How to Run
→ instalace
→ konfigurace
→ pořadí spuštění

Repository Structure
→ hlavní složky a jejich účel
```

README nemá být kompletní technická dokumentace.

```text
README
→ orientace v projektu

detail
→ kód / další dokumentace
```

## requirements.txt

Obsahuje Python dependencies potřebné pro spuštění projektu.

```text
pip install -r requirements.txt
```

Ideálně uvádět i verze knihoven.

## .env a .env.example

```text
.env
→ skutečné hodnoty
→ cesty
→ credentials
→ API keys
→ necommitovat

.env.example
→ názvy potřebných proměnných
→ bezpečné ukázkové hodnoty
→ součást repozitáře
```

## .gitignore

Určuje, co Git nemá sledovat.

Typicky:

* `.env`;
* `.venv/`;
* `__pycache__/`;
* logy;
* dočasné soubory;
* citlivá nebo velká data;
* lokální exporty.

## SQL a Python skripty

Skripty organizovat podle účelu a pořadí.

```text
extraction
→ validation
→ transformation
→ business logic
→ analytical / gold layer
```

Názvy musí být čitelné a jednoznačné.

## Datový slovník

Dokumentuje význam dat.

Typicky:
```text
table
column
data type
description
business meaning
nullable
key
```

## Screenshoty dashboardu

Použít několik reprezentativních screenshotů.

```text
→ hlavní stránka
→ případně detailní stránka
```

Není nutné dokumentovat každý vizuál.

## Ukázkové výstupy

Mohou obsahovat:
* sample CSV;
* sample Excel;
* anonymizovaný report;
* ukázkový analytický výstup.

Pokud jsou reálná data neveřejná:
```text
produkční data
→ nepublikovat

sample / anonymized / synthetic data
→ použít pro demonstraci
```

## Struktura repozitáře

Příklad:
```text
project/
├── data/
├── sql/
├── src/
├── docs/
├── screenshots/
├── outputs/
├── requirements.txt
├── .env.example
├── .gitignore
└── README.md
```