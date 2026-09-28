# 📊 Data Analytics End-to-End Projects Portfolio

Portfolio praktických analytických projektů zaměřených na **řešení business problémů od zdrojových dat až po finální interpretaci a reporting**.

Repozitář postupně pokrývá práci s Excelem, Power Query, SQL Serverem, Power BI, DAX, Pythonem, API a automatizací. Jednotlivé projekty používají různé business scénáře a technologie tak, aby se jejich zaměření zbytečně neopakovalo.

Hlavní důraz je kladen na:
- pochopení business problému;
- kontrolu kvality a přípravu dat;
- přiměřený návrh transformačního procesu;
- analytickou interpretaci;
- KPI a datové modelování;
- reporting a dashboardy;
- dokumentaci rozhodnutí, omezení a doporučení.

---

# 📂 Struktura repozitáře

```text
da-end-to-end-projects-portfolio/

├── projects/
│   ├── project-01-csv-excel-power-query/
│   │   ├── data/
│   │   ├── output/
│   │   ├── dataset_manifest.csv
│   │   └── README.md
│   │
│   ├── project-02-sql-power-bi-dax/
│   │   ├── data/
│   │   ├── docs/
│   │   ├── output/
│   │   ├── power-bi/
│   │   ├── sql/
│   │   ├── .gitignore
│   │   └── README.md
│   │
│   └── project-03-api-python-sql-power-bi/
│       └── README.md
│
├── workflow/
│   └── analytical-workflow.md
│
└── README.md
```

---

# 🎯 Projekty

## ✅ Project 01 — Logistics Performance & Service Level Analysis

**CSV + Power Query + Excel**

Dokončený end-to-end projekt zaměřený na výkonnost logistického procesu smyšlené distribuční společnosti.

Projekt analyzuje **250 000 unikátních zásilek za období 2025 a 2026**, referenční data a zákaznické stížnosti. Cílem je identifikovat hlavní zdroje nedodržování dodacích termínů, porovnat výkonnost dopravců a skladů a určit oblasti vhodné pro další provozní opatření.

Hlavní oblasti:
- spojení 24 měsíčních CSV exportů;
- čištění, validace a kontrola referenční integrity v Power Query;
- příprava analytické tabulky v Excel Data Modelu;
- průzkumná a statistická analýza;
- KPI pro včasnost, SLA, náklady a kvalitu doručení;
- jednostránkový interaktivní Excel dashboard;
- interpretace zjištění a návrh doporučení.

Hlavní technologie:
```text
Excel
Power Query
Excel Data Model
Git
GitHub
```

![Dashboard logistické výkonnosti](projects/project-01-csv-excel-power-query/output/screenshots/01_dashboard_overview.png)

![Hlavní zjištění a doporučení](projects/project-01-csv-excel-power-query/output/screenshots/08_findings_recommendations.png)

➡️ [Otevřít Project 01](projects/project-01-csv-excel-power-query/)

---

## ✅ Project 02 — Customer Retention & Churn Analysis

**SQL Server + Power BI + DAX**

Dokončený end-to-end projekt zaměřený na zákaznickou retenci, churn, reaktivace a tržby ve smyšlené společnosti s předplatitelským modelem.

Projekt analyzuje **40 000 zákazníků, 44 277 předplatných a období 09/2024–08/2026**. Cílem je zjistit, které zákaznické skupiny odcházejí častěji, kdy je riziko odchodu nejvyšší, jaké důvody zákazníci uvádějí a jak se vyvíjejí návraty zákazníků a tržby.

Hlavní oblasti:
- načtení 6 CSV zdrojů do SQL Serveru;
- datové vrstvy `raw → staging → clean → analytics`;
- kontrola kvality, čištění, validace a reconciliation;
- měsíční analytická fact tabulka na úrovni zákazník × měsíc;
- churn, reaktivace, délka předplatného a tržby;
- hvězdicový model v Power BI;
- KPI a DAX measures;
- SQL EDA a interaktivní ověření v Power BI;
- dvoustránkový Power BI dashboard;
- interpretace zjištění a návrh business doporučení.

Hlavní technologie:
```text
SQL Server / LocalDB
SQL
Power BI
DAX
Git
GitHub
```

![Dashboard - Přehled KPI](projects/project-02-sql-power-bi-dax/output/screenshots/01_dashboard_overview.png)

![Dashboard - Analýza churnu](projects/project-02-sql-power-bi-dax/output/screenshots/02_dashboard_churn_analysis.png)

Analytická zjištění a business doporučení jsou shrnuta v projektu a ve větším detailu zde: [Zjištění a doporučení](projects/project-02-sql-power-bi-dax/output/findings_and_recommendations.md).


➡️ [Otevřít Project 02](projects/project-02-sql-power-bi-dax/)

---

## 🟡 Project 03 — Investment Fund Performance & Risk Analytics

**API + Python + SQL Server + Power BI**

Projekt zaměřený na historickou výkonnost a rizikovost vybraných investičních fondů.

Projekt byl již zahájen a měl by být dokončen do 30.09.26.

Projekt bude pracovat s reálnými veřejně dostupnými daty získanými přes API a zaměří se například na:
- kumulativní a anualizovaný výnos;
- klouzavý 12měsíční výnos;
- volatilitu;
- maximální propad;
- dobu zotavení;
- nejlepší a nejhorší období;
- případně korelaci výnosů mezi fondy.

Hlavní technologický tok:
```text
API
→ Python
→ validace a výpočty
→ SQL Server / LocalDB
→ Power BI
```

Python bude použit také pro inkrementální načítání, logování a opakované spouštění procesu pomocí `.bat` souboru a Windows Task Scheduleru.

Plánované hlavní technologie:
```text
Python
API
Pandas
SQL Server / LocalDB
SQL
Power BI
Power Query
DAX
BAT
Windows Task Scheduler
Git
GitHub
```

Cílem projektu je rozšířit portfolio o práci s API, Pythonem, časovými řadami a jednoduchým automatizovaným datovým procesem.

➡️ [Otevřít Project 03](projects/project-03-api-python-sql-power-bi/)

---

# 🧭 Analytický workflow

Součástí repozitáře je také obecný analytický workflow používaný jako rámec pro plánování a realizaci jednotlivých projektů.

Pokrývá zejména:
```text
Business problém
→ datové zdroje
→ architektonické rozhodnutí
→ získání dat
→ kvalita a validace
→ transformace
→ analýza
→ datový model
→ KPI
→ dashboard
→ interpretace a doporučení
→ automatizace
→ dokumentace
```

Workflow slouží jako praktická kontrolní struktura, ne jako požadavek použít ve všech projektech stejné technologie nebo všechny možné kroky.

➡️ [Otevřít analytický workflow](workflow/analytical-workflow.md)

---

# 🧩 Zaměření portfolia

Jednotlivé projekty jsou záměrně postavené tak, aby ukazovaly odlišné analytické workflow:
```text
Project 01
→ Excel + Power Query
→ logistická výkonnost
→ hlavní transformace v Power Query

Project 02
→ SQL Server + Power BI
→ zákaznická retence
→ hlavní transformace a analytická příprava v SQL

Project 03
→ API + Python + SQL Server + Power BI
→ investiční fondy
→ získávání dat, automatizace a analýza časových řad
```

Cílem není použít všechny technologie v každém projektu, ale dát každému nástroji jasnou roli podle konkrétního business a datového problému.

---

# 🛠 Technologie a oblasti

```text
Excel
Power Query
Excel Data Model
SQL
SQL Server LocalDB
Power BI
DAX
Python
Pandas
REST API
BAT
Windows Task Scheduler
data validation
data modeling
EDA
statistical analysis
KPI
dashboarding
automation
Git
GitHub
VS Code
```