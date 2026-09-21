Prijekt 1 — Excel
Hlavní důraz:
business analýza;
Excel;
Power Query;
vizualizace;
analytická interpretace;
management reporting;
rychlé ad-hoc řešení bez zbytečné infrastruktury.

Projekt 2 — SQL a Power BI
Hlavní důraz:
SQL;
Power Query;
Power BI;
datový model;
DAX;
analytická interpretace;
management dashboard.

Projekt 3 — Python, SQL, API, automatizace, Power BI
Hlavní důraz:
více datových zdrojů;
API;
SQL;
Pandas;
validace;
automatické spuštění;
logging;
Power Query;
Power BI;
architektonické rozhodování;
automatizace;
analytická interpretace;
Power BI výstup.

Projekt zkontrolujeme z pohledu:
datového analytika;
BI specialisty;
hiring managera;
recruitera;
technické reprodukovatelnosti;
pravdivosti prezentovaných dovedností;
relevance pro juniorní pozice.

Prověříme:
zda každý nástroj má jasný účel;
zda projekt není zbytečně komplikovaný;
zda jsou KPI správně definována;
zda závěry vycházejí z dat;
zda lze projekt vysvětlit při pohovoru;
zda README odpovídá skutečné realizaci.


Ano — po projití návrhu, přiloženého analytického workflow i s ohledem na to, co dnes vidím v českých inzerátech, mi základní koncepce dává smysl. Udělal bych ale jednu podstatnou úpravu: nešel bych do čtyř stejně velkých projektů. Udělal bych tři hlavní end-to-end projekty a čtvrtý, investiční, jako kratší bonusový case.

Současné nabídky navíc dobře potvrzují směr, který sis zvolil. Například aktuální juniorní BI/Data Analyst role u PwC vyžaduje SQL, analytické a business myšlení a jako výhodu uvádí data modelling, data quality, ETL, Power BI a Python; jiná současná Data Analyst role zdůrazňuje SQL, komplexní datasety, data quality, definici KPI a převod business otázek do analytických požadavků.

Co bych na tvém návrhu zachoval

Sekvence Excel → SQL + Power BI → Python + SQL + API + Power BI je podle mě velmi dobrá. Nejen studijně, ale i portfolio logikou. Excel tě znovu dostane do analytického režimu, SQL/Power BI potom ukáže nejrelevantnější juniorní BI stack a třetí projekt ukáže, že rozumíš celému toku dat a umíš pracovat i technicky.

Zároveň bych důsledně držel princip z tvého workflow: business problém → rozhodnutí → analytické otázky → KPI → data → analýza → interpretace → doporučení. Technologie mají následovat až potom. Přesně u projektu 3 bude největší nebezpečí, že se z něj stane „technology bingo“: API, Python, SQL, scheduler, logging, Power Query, DAX, Power BI jen proto, aby tam všechno bylo.

Senior analytik se tě totiž velmi pravděpodobně nezeptá jen „umíš Python?“. Spíš: Proč jsi tohle dělal v Pythonu a ne v SQL? Proč je tato metrika v DAX a ne ve view? Proč jsi potřeboval Power Query? Jak jsi zkontroloval, že JOIN neznásobil řádky? Jaká je granularita fact tabulky? Co se stane při chybě API?

A právě na to by měly tyto projekty připravovat.

Moje doporučená finální sestava
Projekt	Téma	Hlavní stack	Rozumný objem	Co má dokazovat
1. Logistics Performance Analysis	logistika a kvalita doručování	Excel + Power Query	150–300 tis. zásilek	analytické myšlení, pokročilý Excel, PQ, management reporting
2. Customer Retention & Churn	zákaznické chování / předplatné	SQL Server + Power BI	1–3 mil. řádků	SQL, relační myšlení, datový model, DAX, diagnostická analýza
3. Energy & Cost Monitoring	energetika / provoz poboček	Python + API + SQL + Power BI	2–5 mil. měření	kompletní pipeline, více zdrojů, automatizace, validace, architektonická rozhodnutí
4. Investment Fund Performance	finanční trhy	API + Excel nebo Python	několik tisíc denních hodnot	práce s reálným API a časovou řadou, finanční analytika

A důležitá poznámka k velikosti datasetů: nedělal bych uměle miliony řádků v každém projektu. Seniora nezaujme počet řádků sám o sobě. Mnohem lepší je říct: „Excelový projekt má 250 000 řádků, proto jsem raw data nezpracovával ručně ve worksheetu, ale použil Power Query a agregované výstupy.“ To ukazuje úsudek.

Projekt 1 — Excel + Power Query
Logistics Performance & Service Level Analysis

Tady bych se s tebou shodl skoro úplně. Začít Excelem je dobrý tah. Jednak jej potřebuješ oprášit, jednak není Excel v reálné analytice žádná „začátečnická technologie“. I současné analytické role kombinují SQL, Excel a BI a očekávají schopnost rychle připravit business výstup.

Místo prodejů bych dal logistiku.

Fiktivní firma má několik skladů, několik dopravců, různé typy služeb a stovky tisíc zásilek za dva roky. Management vidí rostoucí počet pozdních doručení a logistické náklady, ale neví proč.

Business decision by nebylo „udělej dashboard“, ale například: Má firma změnit rozdělení zásilek mezi dopravce, upravit SLA nebo řešit konkrétní sklady/trasy?

Hlavní otázky bych postavil kolem podílu zásilek doručených včas, průměrné a mediánové doby doručení, SLA breach rate, nákladů na zásilku, výkonu dopravců a skladů, sezónnosti, rozdílů podle typu dopravy a regionu a identifikace kombinací sklad–dopravce–region, kde vzniká největší problém.

Excelový projekt by přitom nebyl jen PivotTable. Power Query by načítal například 24 měsíčních CSV, dělal append, merge s tabulkou dopravců a skladů, kontroloval datové typy a nekonzistence. V Excelu by potom přišly kontingenční tabulky, slicery, pokročilejší vzorce, XLOOKUP/SUMIFS/COUNTIFS, případně LET, dynamické přehledy a management dashboard.

A přidal bych malý ad-hoc analysis sheet. Například management se zeptá: „Co by se stalo, kdybychom nejhorších 15 % zásilek dopravce A přesunuli k dopravci B?“ Tím ukážeš něco, co Power BI portfolio často neukazuje: schopnost rychle reagovat na jednorázový business požadavek.

To by byl velmi dobrý „Excel comeback“.

Projekt 2 — SQL Server + Power BI
Customer Retention & Subscription Analytics

Tady bych záměrně úplně změnil business oblast.

Představme si telekomunikační, SaaS nebo subscription firmu. Má zákazníky, smlouvy, tarify, měsíční používání služby, fakturaci, kontakty na zákaznickou podporu a ukončení smluv.

To je perfektní dataset pro relační databázi, protože přirozeně vzniknou tabulky jako Customers, Contracts, Plans, MonthlyUsage, Billing, SupportCases a ChurnEvents.

Objem bych nastavil například na 100 000 zákazníků + 2 miliony měsíčních/událostních záznamů.

Business problem: firma zaznamenala růst odchodů zákazníků a chce zjistit, ve kterých segmentech se problém koncentruje a kam zaměřit retenční opatření.

SQL by tady mělo opravdu dostat prostor. Ne jen SELECT/JOIN/GROUP BY, ale CTE, window functions, CASE, pohledy, cohort analysis, kontrolní SQL, ověřování granularit a integrity klíčů.

V Power BI bych potom postavil hvězdicový model a business measures. KPI například Customer Count, Active Customers, Churn Rate, Retention Rate, ARPU, Tenure, Support Cases per Customer a změny v čase.

Zajímavé analytické otázky by byly: Ve kterých tarifech a segmentech je churn nejvyšší? Jak churn souvisí s délkou vztahu? Liší se zákazníci s častými support incidenty? Dochází k nárůstu churnu po změně ceny? Jak vypadají retention cohorts podle měsíce akvizice? Existují segmenty, kde je vysoký churn zároveň finančně významný?

A tady je důležitá interview disciplína: neříkat automaticky, že například support tickety způsobují churn. Data mohou ukázat vztah; kauzalitu bys musel prokázat jiným způsobem.

Taková věta při pohovoru působí lépe než dalších deset grafů.

Projekt 3 — kompletní stack
Energy Consumption & Cost Monitoring

Tady bych se od tvého návrhu trochu odchýlil: projekt 3 bych nerozděloval, ale velmi pečlivě bych každé technologii přidělil jednu jasnou roli.

Energetika se mi pro to líbí výrazně víc než další obchodní nebo objednávkový dataset.

Představ si firmu s 30–50 pobočkami nebo výrobními objekty. Má 15minutová měření spotřeby energie, charakteristiky budov, tarify a externí meteorologická data.

Při 50 lokalitách × 96 měřeních denně × dva roky už máš přibližně 3,5 milionu měření. Tady už je SQL skutečně oprávněné.

Business problem: management vidí růst energetických nákladů a potřebuje zjistit, kde vzniká neefektivní spotřeba, které provozy mají abnormální profil a kde má smysl zasáhnout.

Python by měl jednoznačný účel: API ingestion, načtení externích dat, validace, případně složitější transformační pravidla, logging a automatické spuštění.

SQL Server LocalDB: historické ukládání, tabulky, klíče, staging/clean/reporting vrstva, views a kontroly integrity.

Power Query: pouze připojení a lehká transformační práce před modelem. Neopakovat v něm Python.

DAX: pouze metriky, které mají reagovat na filtr/report context.

Power BI: management reporting a diagnostika.

Analýza může řešit spotřebu na m², cost per site, peak demand, baseload, spotřebu mimo provozní dobu, meziroční změny, odchylky od běžného profilu, vztah spotřeby a venkovní teploty nebo identifikaci provozů, jejichž energetická náročnost se výrazně liší od podobných provozů.

Tady se dá krásně ukázat i architektonické rozhodování:

weather API → Python → raw → validace → SQL → reporting view → Power BI

a k tomu konfigurace, .env, idempotence, log běhu, error handling a scheduler.

Tohle bych považoval za tvůj flagship projekt.

Současné nabídky ukazují právě kombinaci SQL, data quality, datového modelování, transformací a schopnosti přeložit business požadavek do technického řešení; Python bývá cenným rozšířením zejména pro technicky orientované role.

Projekt 4 — ano, ale jinak
Investment Fund Performance Analysis

Tvůj nápad s ČSOB fondy bych nezahazoval. Jen bych z něj nedělal čtvrtý stejně rozsáhlý engineeringový projekt.

Jeho hodnota je jinde: reálný veřejný datový zdroj, API, finance a časová řada.

A rozhodně tam není jen „vývoj ceny“.

Můžeš analyzovat cumulative return, annualised return, rolling 12M return, volatilitu, max drawdown, recovery period, nejlepší a nejhorší období, downside risk, korelaci mezi fondy, případně relativní výkonnost vůči vhodnému benchmarku, pokud bude dostupný a metodicky srovnatelný.

Velmi pěkná otázka například je:

Dosahují dva fondy podobných dlouhodobých výnosů stejným způsobem, nebo se zásadně liší jejich volatilita a chování při poklesech trhu?

To už je analyticky zajímavější než obyčejný line chart NAV.

Zároveň by projekt mohl ukázat něco, co ostatní tři neukazují: správnou práci s časovou řadou, procentními změnami, compound return a risk metrics.

Cleaning skutečně nebude tak zajímavý — a to vůbec nevadí. Portfolio nemusí předstírat, že každý dataset je špinavý. Data quality může spočívat v kontrole duplicitních dat, chybějících obchodních dnů, pořadí dat, neplatných hodnot, změny frekvence dat a konzistence API odpovědí.

To je mnohem profesionálnější než do datasetu uměle vyrábět chyby jen proto, aby bylo co čistit.

Pohled recruitera versus senior analytika

Recruiter bude pravděpodobně projekt hodnotit během desítek sekund. Potřebuje okamžitě pochopit:

co byl problém → co jsi udělal → čím → co jsi zjistil.

README proto nesmí začít instalací Pythonu nebo ER diagramem. Začal bych názvem projektu, 3–4 větami business contextu, výsledkem, screenshotem výstupu a stackem. Technická dokumentace může přijít potom.

Senior analytik bude hledat úplně jiné věci. Bude ho zajímat, jestli rozumíš granularitě dat, klíčům, denominatorům KPI, JOINům, filtrům, datovým typům, missing values, business pravidlům, rozdílu mezi korelací a příčinou, proč jsi zvolil konkrétní nástroj a jak víš, že tvůj výsledek je správně.

Proto bych k tvému review checklistu přidal ještě čtyři věci: grain & keys, metric definitions, validation of results a tool-choice justification.

Třeba otázka „Proč Python?“ musí mít odpověď lepší než „chtěl jsem ukázat Python“.

A teď nejdůležitější omezení: dva týdny

Tady bych ti trochu oponoval. Čtyři plnohodnotné projekty za dva týdny bych nedělal. Výsledkem by pravděpodobně byly čtyři nedotažené repozitáře místo tří projektů, které můžeš opravdu obhájit.

Pro deset pracovních dnů bych plánoval přibližně:

Dny	Cíl
1–2	Projekt 1 — Excel/PQ
3–5	Projekt 2 — SQL/Power BI
6–9	Projekt 3 — kompletní stack
10	QA všech projektů, README, screenshots, GitHub landing page
bonus	Fondy pouze pokud zbude kapacita

Projekt 4 klidně doplníme po zahájení rozesílání CV. Nemusíš mít portfolio definitivně dokončené, abys mohl začít reagovat na nabídky.

A jedna věc, kterou bych u všech tří hlavních projektů dodržel: každý musí skončit skutečným analytickým závěrem. Ne „vytvořil jsem dashboard“, ale například „analýza ukázala, že 62 % SLA breaches vzniká ve třech konkrétních kombinacích warehouse–carrier a doporučení je…“.

To je přesně přechod od člověka, který se učí nástroje, k člověku, kterého lze začít posuzovat jako analytika.

Co bych tedy definitivně zvolil

Projekt 1: Logistics Performance — Excel + Power Query.
Projekt 2: Customer Retention — SQL Server + Power BI.
Projekt 3: Energy & Cost Monitoring — Python + API + SQL + Power BI + automatizace.
Projekt 4: Investment Funds — kratší bonusový finanční case, pokud bude čas.