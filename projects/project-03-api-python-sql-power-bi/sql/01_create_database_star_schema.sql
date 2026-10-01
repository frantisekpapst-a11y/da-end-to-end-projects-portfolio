/* ============================================================
   1. VYTVOŘENÍ DATABÁZE
   ============================================================ */

IF DB_ID('fund_performance_analytics') IS NULL
BEGIN
    CREATE DATABASE fund_performance_analytics;
END;
GO


USE fund_performance_analytics;
GO


/* ============================================================
   2. VYTVOŘENÍ SCHÉMATU ANALYTICS
   ============================================================ */

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'analytics'
)
BEGIN
    EXEC('CREATE SCHEMA analytics');
END;
GO


/* ============================================================
   3. VYTVOŘENÍ DIM TABULKY FONDY
   ============================================================ */

IF OBJECT_ID('analytics.DimFund', 'U') IS NULL
BEGIN

    CREATE TABLE analytics.DimFund (
        -- Interní technický klíč fondu.
        fund_key INT IDENTITY PRIMARY KEY,
        -- ID používané v ČSOB endpointu.
        fund_id VARCHAR(30) NOT NULL,
        -- ISIN/identifikátor fondu.
        isin VARCHAR(30) NOT NULL,
        -- Název fondu.
        fund_name NVARCHAR(200) NOT NULL,
        -- Kategorie použitá v projektu.
        -- Akciový/Smíšený/Dluhopisový.
        fund_category NVARCHAR(50) NOT NULL,
        -- Měna fondu.
        currency NVARCHAR(10) NOT NULL,
        -- Datum vzniku fondu.
        inception_date DATE,
        -- Summary Risk Indicator z KID.
        sri INT,
        -- Doporučená doba držení z KID.
        recommended_holding_period NVARCHAR(100) NULL,
        -- Vstupní poplatek v %.
        entry_fee_pct DECIMAL(10,4) NULL,
        -- Průběžné náklady v %.
        ongoing_costs_pct DECIMAL(10,4) NULL,
        -- Benchmark uvedený v KID.
        benchmark NVARCHAR(500) NULL,
        -- Odkaz na KID dokument.
        kid_url VARCHAR(500) NULL,
        -- Jeden fund_id smí být v DimFund pouze jednou.
        CONSTRAINT UQ_DimFund_fund_id
            UNIQUE (fund_id),
        -- Jeden ISIN smí být v DimFund pouze jednou.
        CONSTRAINT UQ_DimFund_isin
            UNIQUE (isin)
    );

END;
GO


/* ============================================================
   4. VYTVOŘENÍ DIM TABULKY DATA
   ============================================================ */

IF OBJECT_ID('analytics.DimDate', 'U') IS NULL
BEGIN

    CREATE TABLE analytics.DimDate (
        date_key INT PRIMARY KEY,
        calendar_date DATE NOT NULL,
        calendar_year INT NOT NULL,
        calendar_quarter INT NOT NULL,
        month_number INT NOT NULL,
        month_name NVARCHAR(20) NOT NULL,
        year_month VARCHAR(7) NOT NULL,
        day_of_week INT NOT NULL,
        day_name NVARCHAR(20) NOT NULL,
        CONSTRAINT UQ_DimDate_date
            UNIQUE (calendar_date)
    );

END;
GO


/* ============================================================
   5. VYTVOŘENÍ FACT TABULKY HODNOTY FONDŮ
   ============================================================ */

IF OBJECT_ID('analytics.FactFundPrice', 'U') IS NULL
BEGIN

    CREATE TABLE analytics.FactFundPrice (
        fund_price_key BIGINT IDENTITY PRIMARY KEY,
        fund_key INT NOT NULL,
        date_key INT NOT NULL,
        nav_value DECIMAL(18,6) NOT NULL,
        load_timestamp DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
        CONSTRAINT FK_FactFundPrice_DimFund
            FOREIGN KEY (fund_key)
            REFERENCES analytics.DimFund(fund_key),
        CONSTRAINT FK_FactFundPrice_DimDate
            FOREIGN KEY (date_key)
            REFERENCES analytics.DimDate(date_key),
        CONSTRAINT UQ_FactFundPrice_fund_date
            UNIQUE (fund_key, date_key)
    );

END;
GO


/* ============================================================
   6. KONTROLA VYTVOŘENÍ TABULEK
   ============================================================ */

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'analytics'
    AND TABLE_NAME IN (
        'DimFund',
        'DimDate',
        'FactFundPrice'
    )
ORDER BY TABLE_NAME;
GO