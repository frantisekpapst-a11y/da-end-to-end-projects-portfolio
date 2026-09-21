# Project Template

Vzorová šablona pro end-to-end analytický projekt.

---

# 1. Business Understanding

## Business Context

Stručně popsat oblast nebo proces, kterého se projekt týká, proč projekt vzniká a proč je téma pro firmu důležité.

## Business Problem

Popsat konkrétní problém, který firma řeší.

## Business Goal

Popsat, čeho má projekt dosáhnout.

## Target Users

Určit primárního uživatele a případně sekundární uživatele výstupu.

## Business Decision

Popsat rozhodnutí, které má analýza podpořit.

## Analytical Questions

Definovat hlavní otázky, na které mají odpovědět data.

## KPI

Definovat KPI relevantní pro business problém a stručně uvést jejich business význam.

## Scope

Určit:
- co je in scope;
- co je out of scope;
- časové období;
- geografický rozsah;
- sledované entity;
- datové zdroje;
- očekávané výstupy.

## Assumptions

Uvést předpoklady, se kterými projekt pracuje jako s platnými.

## Limitations

Uvést známá omezení dat, rozsahu nebo interpretace.

## Success Criteria

Definovat kritéria, podle kterých bude možné posoudit, zda projekt splnil svůj účel.

## Kontrola fáze

Před pokračováním musí být jasné:
- Business Problem;
- Business Goal;
- Target Users;
- Business Decision;
- Analytical Questions;
- KPI;
- Scope;
- Assumptions;
- Limitations;
- Success Criteria.

---

# 2. Data Source Assessment

## Dostupné zdroje

Vypsat všechny relevantní datové zdroje a stručně uvést jejich roli v projektu.

## Význam dat

Popsat, co jednotlivé tabulky, soubory nebo endpointy reprezentují a jaké business entity obsahují.

## Granularita

Určit, co představuje jeden řádek v každé hlavní tabulce nebo datové sadě.

## Klíče a vazby

Určit:
- primary keys;
- business keys;
- foreign keys;
- hlavní vazby mezi tabulkami.

## Datové typy

Prověřit očekávané datové typy a případné nekonzistence mezi zdroji.

## Objem, historie a růst

Popsat:
- současný objem dat;
- časové pokrytí;
- očekávaný růst.

## Frekvence změn

Uvést, jak často se jednotlivé zdroje aktualizují a zda to odpovídá požadované frekvenci reportingu.

## Kvalita a použitelnost

Posoudit:
- completeness;
- validity;
- consistency;
- duplicity;
- missing values;
- potřebu cleaningu;
- potřebu transformací;
- zda lze data použít přímo nebo až po úpravě.

## Přístupová omezení

Popsat přístupy ke zdrojům, systémům, mezivýstupům a finálním výstupům.

## Osobní a citlivá data

Určit, zda data obsahují:
- personal data;
- sensitive / confidential business data;
- special categories of personal data.

Popsat případná omezení pro sdílení, publikaci a GitHub.

## Ownership a licence

Uvést:
- Data Ownera;
- technického vlastníka systému;
- případná licenční nebo smluvní omezení;
- omezení použití, ukládání, publikace nebo redistribuce.

## Kontrola fáze

Před pokračováním musí být jasné:
- jaké zdroje máme;
- co obsahují;
- jaká je granularita;
- jaké jsou klíče a vazby;
- jaký je objem a historie;
- jak často se data mění;
- jaká je jejich kvalita;
- jaké existují přístupy a omezení;
- kdo data vlastní;
- zda je možné data v projektu bezpečně a legálně použít.

---

# 3. Architecture Decision

## Výběr nástrojů

Uvést zvolené technologie a stručně zdůvodnit jejich použití podle:
- zdrojů;
- transformací;
- výstupů;
- frekvence;
- objemu dat;
- existujícího technologického stacku;
- infrastruktury;
- možností týmu.

## Role SQL

Popsat, k čemu bude SQL v projektu použito, například pro:
- extraction;
- filtering;
- joins;
- aggregations;
- views;
- reporting tables;
- integrity checks.

## Role Pythonu

Uvést, zda je Python potřeba a proč.

Typicky pro:
- API;
- více typů zdrojů;
- cleaning a validation;
- integrační logiku;
- automatizaci;
- logging;
- orchestration.

Pokud nepřináší reálnou hodnotu, nepoužívat ho jen kvůli technologické šíři projektu.

## Role Power Query

Popsat, zda bude použit pro:
- ingestion do Power BI;
- jednoduché transformace;
- datové typy;
- drobné technické úpravy.

Nevytvářet zde znovu logiku, která už probíhá v SQL nebo Pythonu.

## Role Power BI

Popsat roli:
- Data Model;
- relationships;
- DAX;
- KPI;
- vizualizací;
- management reportingu.

## Forma úložiště

Zvolit hlavní úložiště a stručně zdůvodnit volbu.

Posoudit:
- soubory;
- SQL Database;
- Data Warehouse;
- Data Lake;
- Lakehouse.

## Datové vrstvy

Určit, které vrstvy budou skutečně použity.

Například:
- Raw;
- Staging;
- Curated / Clean;
- Analytical / Gold.

Nezavádět vrstvy bez jasného účelu.

## Automatizace

Určit, zda projekt vyžaduje automatizaci.

Pokud ano, popsat:
- trigger;
- scheduler;
- pipeline;
- validaci;
- logging;
- monitoring;
- podmínky publikace.

## Zamítnuté alternativy

Uvést významné alternativy, které byly posouzeny, ale nebyly zvoleny.

U každé stručně vysvětlit:
- proč byla zvažována;
- proč byla zamítnuta;
- kdy by se rozhodnutí mohlo změnit.

## Přiměřenost řešení

Ověřit, že:
- každý nástroj má jasnou roli;
- nástroje se zbytečně nepřekrývají;
- řešení odpovídá rozsahu a business hodnotě;
- provozní složitost je přiměřená;
- dostupný tým a infrastruktura řešení zvládnou;
- jednodušší varianta by nestačila.

## Kontrola fáze

Před pokračováním musí být jasné:
- jaké nástroje projekt používá;
- proč byly zvoleny;
- jakou má každý nástroj roli;
- kde jsou data uložena;
- jaké vrstvy se používají;
- zda je proces automatizovaný;
- jaké alternativy byly zamítnuty;
- proč je výsledná architektura přiměřená.

---

# 4. Data Acquisition a Raw Layer

## Data Acquisition

Popsat, jak budou data načítána z jednotlivých zdrojů.

Uvést podle potřeby:
- SQL extraction;
- API;
- CSV;
- JSON;
- Excel;
- jiné zdroje.

## Raw Layer

Popsat, kde a jak budou uchována původní data před čištěním a transformacemi.

Raw data neměnit business logikou.

## Timestamp načtení

Uvést, jak bude evidován čas načtení dat.

Pokud se používá incremental load, popsat také logiku rozpoznání nových dat.

## Oddělení raw dat

Popsat, jak budou raw data oddělena od:
- staging;
- cleaned / curated vrstvy;
- analytických tabulek;
- finálních výstupů.

## Reprodukovatelnost

Popsat, jak bude možné načtení znovu zopakovat.

Dohledatelné mají být zejména:
- zdroj;
- query / endpoint / soubor;
- parametry;
- použitý kód nebo skript;
- čas načtení.

## Data Provenance

Uvést:
- odkud data pocházejí;
- kam byla načtena;
- kdy byla načtena;
- jakým způsobem;
- jaké období nebo rozsah pokrývají.

## Run Metadata a Logging

Uvést, jak budou evidovány:
- start a konec běhu;
- status;
- počet načtených řádků;
- případná chyba;
- důvod selhání.

## Kontrola fáze

Před pokračováním musí být jasné:
- jak se data získávají;
- kde se ukládají raw data;
- jak se eviduje čas načtení;
- jak se zabrání opakovanému načtení stejných dat;
- jak je zajištěna reprodukovatelnost;
- jak je dokumentován původ dat;
- jak se loguje průběh načtení.

---

# 5. Data Quality, Cleaning a Validation

## Missing Values

Popsat:
- které hodnoty mohou chybět;
- které jsou povinné;
- jak budou missing values řešeny.

## Duplicity

Určit:
- co je full-row duplicate;
- jaký business key určuje jedinečnost;
- kdy je duplicita chyba a kdy je přípustná.

## Datové typy

Prověřit:
- očekávané datové typy;
- datum a čas;
- číselné a textové hodnoty;
- kompatibilitu klíčů mezi tabulkami.

## Neplatné hodnoty

Definovat kontroly pro hodnoty, které porušují:
- povolený rozsah;
- strukturu;
- logiku;
- business pravidla.

## Klíče

Prověřit:
- primary keys;
- business keys;
- uniqueness;
- NULL v povinných klíčích.

## Referenční integrita

Ověřit, že všechny povinné vazby mezi tabulkami jsou platné.

## Časová návaznost

Prověřit:
- mezery v období;
- nežádoucí překryvy;
- pořadí událostí;
- valid_from / valid_to;
- správnost sledovaného období.

## Business Rules

Popsat business pravidla, která musí data splňovat.

Nejasná pravidla potvrdit s business ownerem nebo domain expertem.

## Reconciliation

Popsat, jak bude ověřeno, že se data během transformací neztratila nebo nezdvojila.

Prověřit podle potřeby:
- počty řádků;
- rejected rows;
- důležité součty;
- počet entit;
- očekávané období.

## Audit Trail

Popsat, jak budou dohledatelné:
- transformační kroky;
- čas změny;
- použitý kód nebo verze logiky;
- změněné nebo vyřazené záznamy.

## Validace před publikací

Definovat podmínky:
```text
SUCCESS
WARNING
FAILED
```

a určit, kdy:
- lze výstup publikovat;
- lze publikovat s omezením;
- musí být publikace zastavena.

## Kontrola fáze

Před pokračováním musí být jasné:
- jak se řeší missing values;
- jak se určují duplicity;
- zda sedí datové typy;
- jak se detekují neplatné hodnoty;
- zda jsou klíče a vazby platné;
- zda data časově navazují;
- zda splňují business pravidla;
- zda reconciliation sedí;
- zda jsou změny auditovatelné;
- zda výstup prošel validací před publikací.

---

# 6. Transformation a Business Logic

## Filtrování

Popsat, která data budou filtrována a proč.

Uvést hlavní podmínky, například období, entity nebo business omezení.

## Joiny

Popsat:
- které tabulky se propojují;
- podle jakých klíčů;
- jaký typ joinu se použije;
- jaká je očekávaná kardinalita.

Ověřit dopad joinu na počet řádků a vznik NULL hodnot.

## Agregace

Popsat:
- jaká granularita je na vstupu;
- na jakou úroveň se data agregují;
- jaké metriky se počítají;
- proč je agregace potřebná.

## Výpočty

Definovat hlavní odvozené hodnoty a business metriky.

U každého významného výpočtu uvést jeho logiku a business význam.

## Business kategorizace

Popsat klasifikace nebo skupiny vytvořené podle business pravidel.

Nejasné hranice nebo pravidla potvrdit s business ownerem.

## Rozdělení práce mezi SQL a Python

Uvést, které transformace budou provedeny v SQL a které v Pythonu.

Volbu stručně zdůvodnit podle:
- typu transformace;
- zdroje;
- výkonu;
- čitelnosti;
- udržovatelnosti;
- návaznosti na další kroky.

## Facts a Dimensions

Popsat:
- navržené fact tables;
- jejich granularitu;
- hlavní measures;
- navržené dimension tables;
- klíče a vazby.

## Gold / Analytical Tables

Uvést, které tabulky budou připraveny pro analytiku a reporting a jaký mají účel.

## Transformační pravidla

Dokumentovat hlavní pravidla ve formátu:
```text
Input
→ Rule
→ Output
```

U každého významného pravidla uvést, kde je implementováno.

## Audit transformací

Popsat, jak budou dohledatelné:
- čas běhu;
- použitá verze logiky;
- počet zpracovaných řádků;
- status transformace.

## Kontrola fáze

Před pokračováním musí být jasné:
- jak se data filtrují;
- jak se propojují;
- kde se mění granularita;
- jaké výpočty se provádějí;
- jaká business logika se používá;
- co řeší SQL a co Python;
- jaké vznikají fact a dimension tabulky;
- jaké Gold tabulky vznikají;
- zda jsou transformační pravidla dohledatelná.

---

# 7. Exploratory Data Analysis

## Distribuce

Popsat hlavní distribuce důležitých proměnných.

Prověřit podle potřeby:
- minimum a maximum;
- průměr a medián;
- kvartily;
- rozptyl;
- četnosti a podíly;
- tvar rozdělení.

## Trendy

Popsat hlavní časové trendy a významné změny mezi obdobími.

## Porovnání skupin

Porovnat relevantní skupiny podle business zadání.

Například:
- regiony;
- produkty;
- zákaznické segmenty;
- pobočky;
- období.

## Odchylky

Definovat a vyhodnotit hlavní odchylky oproti:
- plánu;
- minulému období;
- průměru;
- forecastu;
- jiné referenční hodnotě.

## Outliers

Identifikovat výrazně neobvyklé hodnoty a posoudit, zda jde o:
- chybu;
- výjimečný případ;
- relevantní business signál.

Outliers neodstraňovat automaticky bez ověření.

## Vztahy mezi proměnnými

Prověřit významné vztahy mezi proměnnými a rozlišit korelaci od kauzality.

## Segmentace

Rozdělit data do skupin, pokud to odpovídá business otázce.

Uvést použitá segmentační kritéria.

## Hypotézy

Formulovat relevantní hypotézy a popsat, jak byly v datech ověřeny.

Formální statistické testování použít pouze tehdy, pokud je pro projekt potřeba.

## Business Findings

U každého hlavního zjištění popsat:
- co bylo zjištěno;
- proč je to businessově důležité;
- jaký může být dopad;
- jaký další krok z toho může vyplývat.

## Kontrola fáze

Před pokračováním musí být jasné:
- jak jsou data rozložená;
- jaké jsou hlavní trendy;
- které skupiny se liší;
- kde jsou významné odchylky;
- zda existují relevantní outliers;
- jaké vztahy mezi proměnnými se objevují;
- zda má segmentace business význam;
- které hypotézy byly ověřeny;
- jaká business zjištění EDA přinesla.

---

# 8. Statistical Data Analysis

Tuto část použít pouze tehdy, pokud statistická analýza odpovídá business otázce.

## Deskriptivní statistika

Uvést použité deskriptivní statistiky a stručně vysvětlit, co ukazují.

## Korelace

Pokud je relevantní, prověřit vztahy mezi proměnnými.

Uvést:
- směr vztahu;
- sílu vztahu;
- business význam;
- omezení interpretace.

Nezaměňovat korelaci za kauzalitu.

## Testování rozdílů

Pokud je potřeba porovnat skupiny, uvést:
- co se porovnává;
- použitou metodu;
- statistickou významnost;
- business význam výsledku.

## Intervaly spolehlivosti

Pokud jsou použity, uvést:
- odhadovanou hodnotu;
- interval spolehlivosti;
- interpretaci nejistoty.

## Jednoduchá regrese

Pokud je použita, uvést:
- závislou proměnnou;
- nezávislou proměnnou;
- směr a velikost vztahu;
- význam výsledku;
- omezení modelu.

## Interpretace statistického výsledku

U každého významného výsledku vysvětlit:
- co statisticky vyšlo;
- co to znamená prakticky;
- co to znamená pro business;
- jaká jsou omezení.

## Rizika a omezení

Popsat podle potřeby:
- velikost a reprezentativnost vzorku;
- outliers;
- nejistotu;
- chybějící proměnné;
- riziko záměny korelace za kauzalitu;
- rozdíl mezi statistickou a business významností.

## Kontrola fáze

Před pokračováním musí být jasné:
- proč byla statistika použita;
- jaká metoda byla zvolena;
- co výsledek znamená;
- zda je businessově relevantní;
- jaká jsou omezení;
- zda nehrozí chybná interpretace.

---

# 9. Datový a sémantický model

## Granularita fact table

Popsat, co představuje jeden řádek každé fact table.

## Fact a Dimension Tables

Uvést:
- fact tables;
- dimension tables;
- hlavní measures;
- popisný kontext dimenzí.

## Surrogate Keys

Uvést:
- surrogate key v každé dimenzi;
- business key ze zdrojového systému;
- foreign keys ve fact table.

## Vztahy

Popsat hlavní vztahy mezi tabulkami.

Uvést:
- spojovací klíče;
- směr vztahu;
- aktivní vztahy;
- případné nejednoznačnosti.

## Kardinalita

U každého hlavního vztahu určit:
- 1:1;
- 1:N;
- M:N.

M:N vztahy používat pouze s jasným důvodem.

## Kalendářní dimenze

Popsat:
- strukturu DimDate;
- použitý klíč;
- časové atributy;
- vazbu na fact table.

## Filtrování

Určit směr filtrování vztahů.

Ve star schema preferovat jednosměrné filtrování:
```text
Dimension
→ Fact
```

## Measures

Uvést hlavní measures a jejich business význam.

## Calculated Columns

Uvést pouze calculated columns, které je nutné řešit v modelu.

Pokud lze stabilní row-level transformaci udělat dříve v SQL nebo Power Query, preferovat tento přístup.

## Hierarchie

Definovat hierarchie potřebné pro drill-down.

## Formátování

Nastavit správné formáty pro:
- měny;
- procenta;
- datum;
- číselné hodnoty.

## Skrytí technických sloupců

Skrýt technické sloupce, které uživatel nepotřebuje pro reporting.

Typicky:
- surrogate keys;
- foreign keys;
- load timestamps;
- pomocné technické sloupce.

## Kontrola fáze

Před pokračováním musí být jasné:
- jaká je granularita fact tables;
- jaké fact a dimension tables model obsahuje;
- jaké klíče a vztahy se používají;
- jaká je kardinalita;
- jak je řešen čas;
- jakým směrem tečou filtry;
- které calculations jsou measures a které calculated columns;
- jaké hierarchie se používají;
- zda jsou správně nastavené formáty;
- zda jsou technické sloupce skryté.

---

# 10. KPI a DAX

## Základní measures

Definovat hlavní absolutní measures.

Uvést:
- název;
- výpočet;
- business význam.

## Poměrové ukazatele

Definovat hlavní relativní measures.

Ověřit, zda se mají počítat jako poměr agregovaných hodnot.

## Časové porovnání

Definovat potřebná porovnání:
- YoY;
- MoM;
- YTD;
- případně další časové ukazatele.

Ověřit, že porovnávaná období jsou srovnatelná.

## Plan vs Actual

Definovat:
```text
Actual
Budget
Absolute Variance
Variance %
```

Popsat, co znamená pozitivní a negativní odchylka.

## Dynamické filtrování

Ověřit, jak measures reagují na:
- čas;
- produkt;
- region;
- zákazníka;
- segment;
- další slicery a filtry.

## Kontext výpočtu

U důležitých measures ověřit, zda respektují správný filter context.

Pokud je nutné kontext měnit, použít odpovídající DAX logiku.

## CALCULATE

Použít `CALCULATE()` tam, kde je nutné přidat, změnit nebo odstranit filtr.

## FILTER

Použít `FILTER()` pro složitější řádkovou logiku.

Pro jednoduché podmínky preferovat přímý filtr v `CALCULATE()`.

## Measure vs KPI

Rozlišit:
```text
Measure
→ technický nebo business výpočet

KPI
→ business measure používaná pro hodnocení výkonu nebo stavu
```

## Popis business významu

U každé důležité measure uvést:
- co měří;
- jak se počítá;
- proč je důležitá;
- jak ji interpretovat;
- jaké filtry ji ovlivňují;
- případná omezení.

## Kontrola fáze

Před pokračováním musí být jasné:
- které measures jsou základní;
- které jsou poměrové;
- jaká časová porovnání se používají;
- jak je řešen Plan vs Actual;
- zda measures správně reagují na filtry;
- zda je správně použit calculation context;
- kde se používá `CALCULATE()`;
- kde je potřeba `FILTER()`;
- které measures jsou skutečně KPI;
- zda má každá důležitá measure jasný business význam.

---

# 11. Dashboard

## Cílová skupina

Definovat hlavní uživatele dashboardu a jejich potřebu detailu.

## Informační hierarchie

Určit pořadí informací:
```text
hlavní KPI
→ trend / odchylka
→ porovnání kategorií
→ detail
```

## KPI karty

Vybrat pouze KPI důležitá pro cílovou skupinu.

Pokud je KPI příliš mnoho, rozdělit obsah na více stránek.

## Trendy

Použít vhodný časový vizuál pro hlavní KPI.

Ověřit:
- správné pořadí času;
- vhodnou granularitu;
- čitelnost trendu.

## Porovnání kategorií

Použít vhodný bar chart pro hlavní porovnání kategorií.

## Tabulkové detaily

Použít tabulku tam, kde uživatel potřebuje:
- přesná čísla;
- detail položek;
- odchylky;
- více atributů najednou.

## Filtry a slicery

Vybrat pouze businessově relevantní a často používané slicery.

Dimenze použít jako hlavní zdroj kandidátů na filtry.

## Tooltipy

Zkontrolovat, zda stačí default tooltip.

Custom tooltip přidat pouze tehdy, když přináší užitečný detail.

## Navigace

Navrhnout jednoduchý pohyb mezi stránkami.

Podle potřeby použít:
- page navigation;
- buttons;
- bookmarks;
- drill-through.

## Drill-through

Použít, pokud má uživatel přecházet z přehledu na detail konkrétní položky.

## Čitelnost

Zkontrolovat:
- velikost písma;
- kontrast;
- názvy vizuálů;
- zarovnání;
- barevnou konzistenci;
- množství detailu.

## Omezení počtu vizuálů

Každý vizuál musí mít jasný účel.

Pokud nepodporuje business otázku nebo rozhodnutí, odstranit ho nebo přesunout na detailní stránku.

## Podpora rozhodování

U každé stránky určit, jaké rozhodnutí nebo business otázku podporuje.

Kontrolní otázka:
```text
Jaké rozhodnutí má uživatel díky této stránce udělat lépe nebo rychleji?
```

## Kontrola fáze

Před pokračováním musí být jasné:
- kdo dashboard používá;
- jaká je informační hierarchie;
- která KPI jsou prioritní;
- jak jsou zobrazeny trendy;
- jak jsou porovnávány kategorie;
- kde je použit detail;
- které slicery jsou potřebné;
- zda tooltipy přidávají hodnotu;
- jak funguje navigace;
- zda je dashboard čitelný;
- zda není stránka přeplněná;
- jak dashboard podporuje rozhodování.

---

# 12. Interpretace a doporučení

## Hlavní zjištění

Uvést nejdůležitější datově podložená zjištění.

U každého zjištění ověřit, že odpovídá business otázce.

## Business význam

Popsat:
- proč je zjištění důležité;
- jaký má dopad;
- jaké rozhodnutí může ovlivnit.

## Fakt vs domněnka

Oddělit:
```text
Fact
→ podloženo daty

Hypothesis
→ možné vysvětlení k ověření
```

Nevydávat nepotvrzenou příčinu za fakt.

## Omezení analýzy

Uvést hlavní hranice analýzy.

Typicky:
- rozsah dat;
- historie;
- granularita;
- chybějící proměnné;
- reprezentativnost.

## Rizika

Popsat možné negativní důsledky špatné interpretace nebo použití výsledku.

## Doporučení

U každého doporučení uvést:
- co udělat;
- kdo je owner;
- kdy;
- případně jak;
- na základě jakého zjištění.

Doporučení formulovat jako datově podložený návrh, ne jako garanci výsledku.

## Očekávaný přínos

Popsat očekávaný pozitivní dopad.

Nevydávat očekávání za jistý výsledek.

## Navržený další krok

Uvést konkrétní pokračování.

Může jít o:
- ověření hypotézy;
- doplnění dat;
- pilot;
- implementaci;
- monitoring KPI;
- hodnocení dopadu;
- další analýzu.

## Kontrola fáze

Před pokračováním musí být jasné:
- co jsou hlavní zjištění;
- jaký mají business význam;
- co je fakt a co hypotéza;
- jaká jsou omezení;
- jaká jsou rizika;
- jaká doporučení navrhujeme;
- jaký očekáváme přínos;
- jaký je další konkrétní krok.

---

# 13. Automation a Monitoring

Automatizaci použít pouze tehdy, když se proces opakuje a přináší reálný provozní přínos.

## `.py` proces

Popsat, které manuální kroky budou převedeny do skriptu.

## Scheduler

Uvést:
- trigger nebo frekvenci;
- co scheduler spouští.

## Pipeline

Popsat hlavní kroky procesu od vstupu po publikaci.

## Validace vstupů

Definovat kontroly před zpracováním.

Použít stav:
```text
INFO
WARNING
FAILED
```

Uvést, které warningy ještě umožňují pokračovat.

## Error Handling

Definovat chování při chybě:
- logování;
- retry;
- stop;
- zákaz publikace chybného výstupu.

## Logging

Logovat minimálně:
- task / run;
- start;
- end;
- duration;
- status;
- error message;
- rows in / out / rejected.

## Secrets

Neukládat citlivé údaje přímo do kódu.

Použít environment variables nebo chráněnou konfiguraci.

## Bezpečná publikace

Definovat publish gate:
```text
SUCCESS
→ publish

WARNING
→ publish podle pravidel

FAILED
→ no publish
```

## Power BI Refresh

Refresh spouštět až po validním dokončení pipeline.

## Kontrola poslední aktualizace

Zobrazit nebo logovat:
- last successful pipeline run;
- last successful Power BI refresh;
- stáří dat.

## Poslední správný výstup

Při selhání nového běhu:
- nepřepsat validní data;
- zachovat poslední správný výstup;
- upozornit na neaktuálnost dat.

## Kontrola fáze

Před pokračováním musí být jasné:
- zda automatizace vůbec dává smysl;
- co spouští scheduler;
- jak vypadá pipeline;
- jaké jsou validační stavy;
- jak funguje error handling;
- co se loguje;
- kde jsou uložené secrets;
- kdy se výstup publikuje;
- kdy se spouští Power BI refresh;
- jak se sleduje poslední úspěšná aktualizace;
- co se stane při selhání nového běhu.

---

# 14. Delivery a distribuce

## Forma výstupu

Uvést finální způsob předání výsledku.

Podle potřeby:
* Power BI;
* Excel;
* CSV;
* Parquet;
* databázová tabulka;
* jiný výstup.

## Sdílení výsledku

Popsat:
* komu bude výstup předán;
* jakým kanálem;
* kde bude dostupný.

## Cílový uživatel

Uvést hlavní uživatele výstupu a případně rozdílné potřeby jednotlivých skupin.

## Frekvence distribuce

Uvést požadovanou frekvenci:
* denně;
* týdně;
* měsíčně;
* ad hoc;
* jinak podle business požadavku.

## Oprávnění

Definovat potřebná oprávnění.

Podle potřeby:
* View / Read;
* Export;
* Build;
* Edit / Write;
* Admin / Owner.

Použít princip **least privilege**.

Pokud je potřeba omezit viditelnost dat podle uživatele, popsat **Row-Level Security (RLS)**.

## Verze výstupu

Popsat způsob verzování výstupu.

Rozlišit podle potřeby:
```text
minor change
→ drobná oprava nebo úprava

major change
→ změna KPI, business logiky nebo metodiky
```

Musí být dohledatelné:
* aktuální verze;
* hlavní změny;
* datum změny;
* důvod změny.

## Archivace

Popsat pravidla pro starší nebo již nepoužívané výstupy.

Uvést:
* co se archivuje;
* kde je archiv uložen;
* jak dlouho se výstupy uchovávají;
* kdo má k archivu přístup.

Rozlišit:

```text
Active
→ aktuální výstup

Archive
→ starší dohledatelná verze

Obsolete / Retired
→ nahrazený nebo již nepoužívaný výstup
```

## Kontrola fáze

Před uzavřením projektu musí být jasné:
* jaký je finální formát výstupu;
* komu a jak se výstup předává;
* jak často se distribuuje;
* jaká oprávnění jsou nastavena;
* zda je potřeba RLS;
* jak se řeší verzování;
* jak se řeší archivace.

---

# 15. Dokumentace a GitHub

## README

README musí umožnit rychle pochopit účel, fungování a použití projektu.

### Project Overview

Stručně uvést:
* co projekt řeší;
* business oblast;
* cílového uživatele;
* hlavní výstup.

### Business Problem

Popsat:
* proč projekt vznikl;
* business kontext;
* původní zadání;
* rozhodnutí, které má projekt podpořit.

### Target Users

Uvést hlavní skupiny uživatelů.

Podle potřeby rozlišit:
* top management;
* middle management;
* operational users;
* další stakeholdery.

### Data Sources

Uvést hlavní datové zdroje, jejich typ a obsah.

### Architecture

Popsat hlavní workflow / pipeline od zdroje dat po finální výstup.

### Role nástrojů

Stručně popsat úlohu jednotlivých technologií v projektu.

### Data Quality

Uvést hlavní problémy v kvalitě dat a způsob jejich řešení.

### Transformation Process

Popsat:
* ETL / ELT přístup;
* hlavní skupiny transformačních úloh;
* technologie použité v jednotlivých krocích.

### KPI

Uvést hlavní KPI a jejich business význam.

### Analysis

Shrnout:
* hlavní typy analýz;
* business otázky;
* případně použité statistické metody.

### Dashboard

Popsat:
* strukturu;
* způsob a frekvenci aktualizace;
* hlavní interakce.

Doplnit 1–2 reprezentativní screenshoty.

### Findings

Uvést stručné summary hlavních zjištění.

### Recommendations

Uvést doporučení navazující na hlavní findings.

### Automation

Stručně popsat:
* co je automatizované;
* co proces spouští;
* jak často běží;
* hlavní kroky;
* chování při chybě.

### Limitations

Uvést hlavní omezení, která mohou ovlivnit interpretaci nebo použití výsledků.

### How to Run

Popsat praktický postup spuštění projektu včetně správného pořadí kroků.

Například:
```text
1. install dependencies
2. create .env
3. prepare data / connections
4. run ingestion
5. run validation
6. run transformations
7. create analytical layer
8. refresh / open final output
```

### Repository Structure

Uvést hlavní složky a stručně popsat jejich účel.

## requirements.txt

Uvést všechny Python dependencies potřebné pro spuštění projektu.

Pokud je to možné, používat konkrétní verze.

## .env.example

Uvést všechny potřebné konfigurační proměnné bez skutečných secrets.

Skutečný `.env` nesmí být součástí veřejného repozitáře.

## .gitignore

Vyloučit zejména:
* `.env`;
* virtual environment;
* cache;
* logy;
* dočasné soubory;
* neveřejná nebo velká data;
* lokální výstupy.

## SQL skripty

Organizovat podle účelu a logického pořadí.

Například:
```text
extraction
validation
transformation
business logic
gold / analytical layer
```

## Python skripty

Rozdělit podle hlavních funkcí procesu.

Například:
```text
extract.py
validate.py
transform.py
load.py
main.py
```

## Datový slovník

Dokumentovat význam hlavních tabulek a sloupců.

Uvést podle potřeby:
* table;
* column;
* data type;
* description;
* business meaning;
* nullable;
* key.

## Screenshoty dashboardu

Přiložit pouze reprezentativní screenshoty hlavních stránek nebo funkcí.

## Ukázkové výstupy

Podle potřeby přiložit bezpečné sample výstupy.

Nepublikovat citlivá nebo neveřejná data.

## Kontrola fáze

Před uzavřením projektu musí být jasné:
* zda README vysvětluje celý projekt;
* zda je popsána architektura a role nástrojů;
* zda je dokumentován transformační proces;
* zda jsou popsány KPI, analýza, findings a recommendations;
* zda je jasné, jak projekt spustit;
* zda je repozitář přehledně strukturován;
* zda jsou dependencies a konfigurace dokumentované;
* zda jsou secrets a neveřejná data chráněna;
* zda jsou dostupné potřebné skripty a podpůrná dokumentace.