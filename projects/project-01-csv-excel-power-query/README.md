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

