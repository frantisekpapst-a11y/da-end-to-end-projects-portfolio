USE customer_retention_analytics;
GO

/* ============================================================
   1. VYTVOŘENÍ RAW TABULEK
   ============================================================*/


DROP TABLE IF EXISTS raw.Zakaznici;
DROP TABLE IF EXISTS raw.Predplatna;
DROP TABLE IF EXISTS raw.Tarify;
DROP TABLE IF EXISTS raw.MesicniVyuziti;
DROP TABLE IF EXISTS raw.Fakturace;
DROP TABLE IF EXISTS raw.PripadyPodpory;

CREATE TABLE raw.Zakaznici (
    zakaznik_id VARCHAR(20),
    region VARCHAR(100),
    datum_registrace DATE,
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);


CREATE TABLE raw.Predplatna (
    predplatne_id VARCHAR(20),
    zakaznik_id VARCHAR(20),
    tarif_id VARCHAR(20),
    datum_zacatku DATE,
    datum_konce DATE NULL,
    duvod_zruseni VARCHAR(100) NULL,
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);


CREATE TABLE raw.Tarify (
    tarif_id VARCHAR(20),
    nazev_tarifu VARCHAR(100),
    mesicni_cena DECIMAL(10,2),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);


CREATE TABLE raw.MesicniVyuziti (
    vyuziti_id VARCHAR(20),
    predplatne_id VARCHAR(20),
    mesic_vyuziti DATE,
    hodiny_sledovani DECIMAL(10,1),
    aktivni_dny INT,
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);


CREATE TABLE raw.Fakturace (
    fakturace_id VARCHAR(20),
    predplatne_id VARCHAR(20),
    mesic_fakturace DATE,
    castka DECIMAL(10,2),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);


CREATE TABLE raw.PripadyPodpory (
    pripad_id VARCHAR(20),
    zakaznik_id VARCHAR(20),
    datum_vytvoreni DATE,
    kategorie_pripadu VARCHAR(100),
    stav_pripadu VARCHAR(50),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);
GO


/* ============================================================
   2. VYPRÁZDNĚNÍ RAW TABULEK
   ============================================================*/


TRUNCATE TABLE raw.Zakaznici;
TRUNCATE TABLE raw.Predplatna;
TRUNCATE TABLE raw.Tarify;
TRUNCATE TABLE raw.MesicniVyuziti;
TRUNCATE TABLE raw.Fakturace;
TRUNCATE TABLE raw.PripadyPodpory;
GO


/* ============================================================
   3. ZÁKAZNÍCI
   customers.csv
   → raw.Zakaznici
   ============================================================ */

DROP TABLE IF EXISTS #ImportZakaznici;

CREATE TABLE #ImportZakaznici (
    Customer_ID VARCHAR(20),
    Region VARCHAR(100),
    Registration_Date VARCHAR(20)
);

BULK INSERT #ImportZakaznici
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-02-sql-power-bi-dax\data\source\customers.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001'
);

INSERT INTO raw.Zakaznici (
    zakaznik_id,
    region,
    datum_registrace
)
SELECT
    Customer_ID,
    Region,
    TRY_CONVERT(DATE, Registration_Date)
FROM #ImportZakaznici;

DROP TABLE #ImportZakaznici;
GO


/* ============================================================
   4. PŘEDPLATNÁ
   subscriptions.csv
   → raw.Predplatna
   ============================================================ */

DROP TABLE IF EXISTS #ImportPredplatna;

CREATE TABLE #ImportPredplatna (
    Subscription_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Plan_ID VARCHAR(20),
    Start_Date VARCHAR(20),
    End_Date VARCHAR(20),
    Cancellation_Reason VARCHAR(100)
);

BULK INSERT #ImportPredplatna
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-02-sql-power-bi-dax\data\source\subscriptions.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001'
);

INSERT INTO raw.Predplatna (
    predplatne_id,
    zakaznik_id,
    tarif_id,
    datum_zacatku,
    datum_konce,
    duvod_zruseni
)
SELECT
    Subscription_ID,
    Customer_ID,
    Plan_ID,
    TRY_CONVERT(DATE, Start_Date),
    TRY_CONVERT(DATE, NULLIF(End_Date, '')),
    NULLIF(Cancellation_Reason, '')
FROM #ImportPredplatna;

DROP TABLE #ImportPredplatna;
GO


/* ============================================================
   5. TARIFY
   plans.csv
   → raw.Tarify
   ============================================================ */

DROP TABLE IF EXISTS #ImportTarify;

CREATE TABLE #ImportTarify (
    Plan_ID VARCHAR(20),
    Plan_Name VARCHAR(100),
    Monthly_Price VARCHAR(30)
);

BULK INSERT #ImportTarify
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-02-sql-power-bi-dax\data\source\plans.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001'
);

INSERT INTO raw.Tarify (
    tarif_id,
    nazev_tarifu,
    mesicni_cena
)
SELECT
    Plan_ID,
    Plan_Name,
    TRY_CONVERT(DECIMAL(10,2), Monthly_Price)
FROM #ImportTarify;

DROP TABLE #ImportTarify;
GO


/* ============================================================
   6. MĚSÍČNÍ VYUŽITÍ
   monthly_usage.csv
   → raw.MesicniVyuziti
   ============================================================ */

DROP TABLE IF EXISTS #ImportMesicniVyuziti;

CREATE TABLE #ImportMesicniVyuziti (
    Usage_ID VARCHAR(20),
    Subscription_ID VARCHAR(20),
    Usage_Month VARCHAR(20),
    Viewing_Hours VARCHAR(30),
    Active_Days VARCHAR(20)
);

BULK INSERT #ImportMesicniVyuziti
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-02-sql-power-bi-dax\data\source\monthly_usage.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001'
);

INSERT INTO raw.MesicniVyuziti (
    vyuziti_id,
    predplatne_id,
    mesic_vyuziti,
    hodiny_sledovani,
    aktivni_dny
)
SELECT
    Usage_ID,
    Subscription_ID,
    TRY_CONVERT(DATE, Usage_Month),
    TRY_CONVERT(DECIMAL(10,1), Viewing_Hours),
    TRY_CONVERT(INT, Active_Days)
FROM #ImportMesicniVyuziti;

DROP TABLE #ImportMesicniVyuziti;
GO


/* ============================================================
   7. FAKTURACE
   billing.csv
   → raw.Fakturace
   ============================================================ */

DROP TABLE IF EXISTS #ImportFakturace;

CREATE TABLE #ImportFakturace (
    Billing_ID VARCHAR(20),
    Subscription_ID VARCHAR(20),
    Billing_Month VARCHAR(20),
    Amount VARCHAR(30)
);

BULK INSERT #ImportFakturace
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-02-sql-power-bi-dax\data\source\billing.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001'
);

INSERT INTO raw.Fakturace (
    fakturace_id,
    predplatne_id,
    mesic_fakturace,
    castka
)
SELECT
    Billing_ID,
    Subscription_ID,
    TRY_CONVERT(DATE, Billing_Month),
    TRY_CONVERT(DECIMAL(10,2), Amount)
FROM #ImportFakturace;

DROP TABLE #ImportFakturace;
GO


/* ============================================================
   8. PŘÍPADY PODPORY
   support_cases.csv
   → raw.PripadyPodpory
   ============================================================ */

DROP TABLE IF EXISTS #ImportPripadyPodpory;

CREATE TABLE #ImportPripadyPodpory (
    Case_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Created_Date VARCHAR(20),
    Case_Category VARCHAR(100),
    Case_Status VARCHAR(50)
);

BULK INSERT #ImportPripadyPodpory
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-02-sql-power-bi-dax\data\source\support_cases.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001'
);

INSERT INTO raw.PripadyPodpory (
    pripad_id,
    zakaznik_id,
    datum_vytvoreni,
    kategorie_pripadu,
    stav_pripadu
)
SELECT
    Case_ID,
    Customer_ID,
    TRY_CONVERT(DATE, Created_Date),
    Case_Category,
    Case_Status
FROM #ImportPripadyPodpory;

DROP TABLE #ImportPripadyPodpory;
GO


/* ============================================================
   9. KONTROLA POČTU NAČTENÝCH ŘÁDKŮ
   ============================================================ */

SELECT
    'Zakaznici' AS tabulka,
    COUNT(*) AS pocet_radku
FROM raw.Zakaznici

UNION ALL

SELECT
    'Predplatna',
    COUNT(*)
FROM raw.Predplatna

UNION ALL

SELECT
    'Tarify',
    COUNT(*)
FROM raw.Tarify

UNION ALL

SELECT
    'MesicniVyuziti',
    COUNT(*)
FROM raw.MesicniVyuziti

UNION ALL

SELECT
    'Fakturace',
    COUNT(*)
FROM raw.Fakturace

UNION ALL

SELECT
    'PripadyPodpory',
    COUNT(*)
FROM raw.PripadyPodpory;
GO