# Project 03 – Investment Fund Performance & Risk Analytics

## API + Python + SQL Server + Power BI

> **Stav projektu:** plánovaný / ve vývoji  
> Projekt naváže na předchozí portfolio projekty a rozšíří portfolio o práci s veřejným API, Pythonem, automatizovaným načítáním dat, časovými řadami a Power BI.

# Přehled projektu

Projekt bude zaměřen na analýzu výkonnosti a rizikovosti vybraných investičních fondů.

Cílem nebude pouze sledovat vývoj ceny nebo NAV, ale porovnat fondy z pohledu:
- dlouhodobého výnosu;
- volatility;
- velikosti propadů;
- doby zotavení po poklesu;
- stability výkonnosti v čase;
- případně vzájemné korelace výnosů.

Hlavní business otázka bude směřovat k tomu, zda fondy s podobným dlouhodobým výnosem dosahují výsledků stejným způsobem, nebo se výrazně liší z hlediska rizika a chování během poklesů trhu.

Projekt nebude formulovat investiční doporučení. Výstup bude sloužit jako analytické porovnání historické výkonnosti a rizikových charakteristik.

# Plánovaný rozsah dat

Projekt bude pracovat s reálnými veřejně dostupnými daty získanými přes API.

Předpokládaný rozsah:
- přibližně **4–6 vybraných fondů**;
- několik tisíc historických denních hodnot;
- časová řada NAV nebo obdobného ukazatele;
- metadata fondů podle dostupnosti zdroje.

Přesný rozsah bude záviset na možnostech vybraného API a dostupné historii.

# Technické zaměření

Hlavní technologický tok:
```text
API

    ↓

Python – načtení a validace

    ↓

Python – transformace a výpočty

    ↓

SQL Server / LocalDB – historické uložení

    ↓

Power BI – model a vizualizace

    ↓

interpretace výsledků
```

## Role Pythonu

Python bude použit zejména pro:
- připojení k API;
- načtení a zpracování odpovědi;
- kontrolu dostupnosti a struktury dat;
- validaci duplicit a chybějících hodnot;
- kontrolu chronologického pořadí;
- výpočet vybraných časových a rizikových metrik;
- inkrementální načítání nových dat;
- logging a základní error handling.

## Role SQL Serveru

SQL Server / LocalDB bude sloužit především jako stabilní historické úložiště.

Databázová část bude řešit:
- uložení historie fondů;
- kontrolu klíčů a unikátnosti;
- oddělení uložených dat od reportingové vrstvy;
- připravené tabulky nebo views pro Power BI;
- zachování historie při opakovaném načítání.

SQL zde nebude hlavní transformační technologií jako v projektu 2. Jeho role bude především datová a integrační.

# Kvalita a validace dat

Projekt nebude uměle vytvářet rozsáhlé problémy s kvalitou dat.

Validace se zaměří na reálná rizika práce s API a časovou řadou:
- duplicitní záznamy pro stejné datum a fond;
- chybějící hodnoty;
- neplatné nebo nulové hodnoty NAV;
- změnu očekávané struktury API;
- chronologické pořadí dat;
- dostupnost posledního očekávaného data;
- počet nově načtených záznamů.

# Analytické zaměření

Hlavní analytické oblasti:
- vývoj hodnoty fondu v čase;
- kumulativní výnos;
- anualizovaný výnos;
- klouzavý 12měsíční výnos;
- volatilita;
- maximální propad;
- doba zotavení po propadu;
- nejlepší a nejhorší období;
- případně korelace výnosů mezi fondy.

Podle dostupnosti vhodného zdroje může být doplněno také srovnání s relevantním benchmarkem.

Důraz bude na správné práci s časovou řadou, procentními změnami, složeným výnosem a rizikovými metrikami.

# Power BI

Power BI bude sloužit jako reportingová a prezentační vrstva.

Plánovaný výstup:
- přehled hlavních KPI;
- vývoj hodnot fondů v čase;
- porovnání výnosu a volatility;
- přehled maximálních propadů;
- porovnání rolling výnosů;
- interaktivní výběr fondu a období;
- jednostránkový analytický dashboard.

Power Query bude použit pouze pro načtení připravených dat a lehké technické úpravy.

# Automatizace

Projekt bude obsahovat jednoduchý opakovatelný Python proces spouštěný pomocí `.bat` souboru a Windows Task Scheduleru.

Plánovaná logika:
```text
Windows Task Scheduler

    ↓

.bat soubor

    ↓

spuštění Python skriptu

    ↓

kontrola posledního uloženého data

    ↓

načtení nových dat z API

    ↓

validace

    ↓

uložení pouze nových záznamů

    ↓

zápis výsledku do logu
```

Cílem je ukázat základní principy:
- inkrementálního načítání;
- idempotence;
- validace vstupu;
- logování;
- zachování historických dat;
- automatického spuštění procesu podle nastaveného plánu.

`.bat` soubor bude sloužit jako jednoduchý spouštěcí bod pro Python skript a Windows Task Scheduler bude řídit pravidelné spuštění procesu.

# Časový plán

Cílový rozsah projektu je přibližně **3 pracovní dny**.

# Technologie

```text
Python

API

Pandas

SQL Server / LocalDB

SQL

Power BI

Power Query

DAX

Git

GitHub
```

# Cíl projektu v portfoliu

Projekt 3 má rozšířit předchozí dva projekty o programatické získávání dat a práci s časovou řadou.

```text
Projekt 1
→ Excel + Power Query

→ logistická výkonnost

→ hlavní transformace v Power Query

Projekt 2
→ SQL Server + Power BI

→ zákaznická retence

→ hlavní transformace a analytická příprava v SQL

Projekt 3
→ API + Python + SQL Server + Power BI

→ investiční fondy

→ získávání dat, automatizace a analýza časových řad
```