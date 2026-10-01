USE fund_performance_analytics;
GO


/* ============================================================
   1. ZÁKLADNÍ KONTROLA FACT TABULKY

   Cíl:
   Ověřit celkový počet řádků v FactFundPrice.
   Tato kontrola slouží jako rychlé ověření, že SQL load 
   skutečně nahrál data.
   ============================================================ */

SELECT
    COUNT(*) AS Počet_záznamů
FROM analytics.FactFundPrice;
GO


/* ============================================================
   2. SOUHRN DAT PODLE FONDU

   Cíl:
   Ověřit, že jsou načtené všechny fondy a zkontrolovat jejich
   dostupný časový rozsah.

   Kontrolujeme:
   - počet NAV záznamů,
   - první dostupný date_key,
   - poslední dostupný date_key.

   Díky tomu rychle vidíme, zda má každý fond očekávanou 
   historii.
   ============================================================ */

SELECT
    f.fund_name AS Fond,
    COUNT(*) AS Počet_hodnota,
    MIN(p.date_key) AS První_den,
    MAX(p.date_key) AS Poslední_den
FROM analytics.FactFundPrice p
JOIN analytics.DimFund f
    ON p.fund_key = f.fund_key
GROUP BY
    f.fund_name
ORDER BY
    f.fund_name;
GO


/* ============================================================
   3. KONTROLA NEPLATNÝCH HODNOT

   Cíl:
   Ověřit, že NAV není nulové ani záporné.

   Správný výsledek:
   0 řádků.
   ============================================================ */

SELECT *
FROM analytics.FactFundPrice
WHERE nav_value <= 0;
GO


/* ============================================================
   4. KONTROLA NULL VE FACT TABULCE

   Cíl:
   Ověřit, že povinné sloupce neobsahují NULL hodnoty.

   Kontrolujeme:
   - fund_key,
   - date_key,
   - nav_value.

   Správný výsledek:
   0 řádků.
   ============================================================ */

SELECT *
FROM analytics.FactFundPrice
WHERE fund_key IS NULL
   OR date_key IS NULL
   OR nav_value IS NULL;
GO


/* ============================================================
   5. KONTROLA VAZEB NA DIMENZE

   Cíl:
   Ověřit, že každý foreign key ve FactFundPrice má odpovídající
   záznam v dimenzích.

   Kontrolujeme:
   - fund_key -> DimFund,
   - date_key -> DimDate.

   Správný výsledek:
   0 řádků v obou kontrolách.
   ============================================================ */

SELECT
    p.fund_price_key,
    p.fund_key
FROM analytics.FactFundPrice p
LEFT JOIN analytics.DimFund f
    ON p.fund_key = f.fund_key
WHERE f.fund_key IS NULL;


SELECT
    p.date_key
FROM analytics.FactFundPrice p
LEFT JOIN analytics.DimDate d
    ON p.date_key = d.date_key
WHERE d.date_key IS NULL;
GO


/* ============================================================
   6. KONTROLA NEJNOVĚJŠÍHO DATA PODLE FONDU

   Cíl:
   Ověřit poslední dostupné NAV datum pro každý jednotlivý fond.
   Jednotlivé fondy nemusí mít poslední NAV publikované ve
   stejný den.
   ============================================================ */

SELECT
    f.fund_name AS Fond,
    MAX(p.date_key) AS Poslední_den
FROM analytics.FactFundPrice p
JOIN analytics.DimFund f
    ON p.fund_key = f.fund_key
GROUP BY
    f.fund_name
ORDER BY
    f.fund_name;
GO


/* ============================================================
   7. KONTROLA POSLEDNÍCH LOADŮ

   Cíl:
   Ověřit, kdy byl vložen poslední řádek do FactFundPrice.

   To pomáhá odlišit:
   - datum NAV,
   - čas načtení dat do SQL.

   Užitečné hlavně při automatizaci a při řešení případných 
   problémů.
   ============================================================ */

SELECT TOP 1
    f.fund_name AS Fond,
    p.date_key AS Den_klíč,
    p.nav_value AS Hodnota,
    p.load_timestamp AS Čas_načtení
FROM analytics.FactFundPrice p
JOIN analytics.DimFund f
    ON p.fund_key = f.fund_key
ORDER BY
    p.load_timestamp DESC,
    f.fund_name;
GO

