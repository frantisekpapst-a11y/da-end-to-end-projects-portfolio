# Project 02 – Customer Retention & Subscription Analytics
## SQL Server + Power BI

> **Stav projektu:** plánovaný / ve vývoji  
> Projekt navazuje na první portfolio projekt zaměřený na Excel a Power Query a rozšiřuje portfolio o SQL Server, relační datový model, DAX a Power BI.

# Přehled projektu

Projekt bude zaměřen na analýzu zákaznické retence a odchodů ve firmě se subscription modelem, například SaaS nebo telekomunikační společnosti.

Business problém vychází ze situace, kdy firma zaznamenává zvýšený odchod zákazníků a potřebuje zjistit:
- ve kterých segmentech se churn koncentruje;
- jak se churn liší podle tarifu a délky vztahu;
- zda se odchozí zákazníci liší používáním služby nebo počtem kontaktů na podporu;
- které skupiny zákazníků jsou z pohledu retence a výnosů nejdůležitější.

Hlavním cílem bude připravit datově podložený pohled na zákaznickou retenci a vytvořit management dashboard pro podporu retenčních rozhodnutí.

# Plánovaný rozsah dat

Projekt bude pracovat se syntetickým relačním datasetem přibližně v tomto rozsahu:
- **30 000–50 000 zákazníků**;
- přibližně **1–1,5 milionu řádků** napříč tabulkami;
- historie zákazníků, předplatného, používání služby, fakturace a kontaktů na zákaznickou podporu.

# Technické zaměření

Hlavní transformační vrstvou bude **SQL Server**.

SQL část bude zahrnovat zejména:
- import a kontrolu zdrojových dat;
- kontrolu granularit, primárních a cizích klíčů;
- čištění a validaci dat;
- práci s `JOIN`, `GROUP BY`, `CASE`, CTE a window functions;
- analytické dotazy;
- vytvoření připravené analytické vrstvy pro Power BI.

Plánovaný datový tok:
```text
Raw data
    ↓
SQL – validace
    ↓
SQL – čištění
    ↓
SQL – business logika
    ↓
SQL – analytická vrstva
    ↓
Power BI – datový model
    ↓
DAX – KPI
    ↓
analýza a dashboard
    ↓
interpretace a doporučení
```

Power Query bude v tomto projektu používán pouze pro lehké technické úpravy při načítání dat do Power BI.

# Analytické zaměření

Analýza se bude soustředit zejména na:
- vývoj churnu a retence v čase;
- churn podle tarifu a zákaznického segmentu;
- vztah churnu k délce zákaznického vztahu;
- churn podle intenzity kontaktů na zákaznickou podporu;
- finanční význam churnu pomocí výnosových metrik a ARPU.

Podle dostupného času může být doplněna také jednoduchá kohortová analýza.

Formální statistická analýza není hlavním cílem projektu. Důraz bude na relačním SQL, analytickém uvažování, správném datovém modelu a interpretaci výsledků.

# Power BI

Power BI bude sloužit jako reportingová a prezentační vrstva.

Plánovaný výstup:
- hvězdicový datový model;
- DAX measures pro hlavní KPI;
- analýza trendů a segmentů;
- interaktivní filtry;
- jednostránkový management dashboard.

Předpokládané KPI:
- počet zákazníků;
- aktivní zákazníci;
- churn rate;
- retention rate;
- ARPU;
- průměrná délka vztahu;
- počet support případů na zákazníka.

# Časový plán

Cílový rozsah projektu je přibližně **4 pracovní dny**.

# Technologie

```text
SQL Server / LocalDB
SQL
Power BI
Power Query
DAX
Git
GitHub
```

# Cíl projektu v portfoliu

Projekt 2 má ukázat jiný typ analytického workflow než první projekt.

```text
Projekt 1
→ Excel + Power Query
→ logistická výkonnost
→ hlavní transformace v Power Query

Projekt 2
→ SQL Server + Power BI
→ zákaznická retence
→ hlavní transformace a analytická příprava v SQL
```

Cílem je postupně ukázat schopnost pracovat s různými business oblastmi, datovými strukturami a analytickými nástroji v rámci kompletního end-to-end projektu.