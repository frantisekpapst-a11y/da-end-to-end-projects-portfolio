USE fund_performance_analytics;
GO


/* ============================================================
   1. VYTVOŘENÍ DENNÍ ANALYTICKÉ TABULKY
   ============================================================ */

IF OBJECT_ID('analytics.FactFundPerformanceDaily', 'U') IS NULL
BEGIN
    CREATE TABLE analytics.FactFundPerformanceDaily (
        -- Interní technický klíč analytického řádku.
        fund_performance_daily_key BIGINT IDENTITY PRIMARY KEY,
        -- Vazba na konkrétní fond v analytics.DimFund.
        fund_key INT NOT NULL,
        -- Vazba na konkrétní datum v analytics.DimDate.
        date_key INT NOT NULL,
        -- Denní výnos fondu oproti předchozímu dostupnému ocenění.
        -- První dostupné pozorování fondu nemá předchozí hodnotu - může být NULL.
        daily_return DECIMAL(18,10) NULL,
        -- NAV normalizované na společnou výchozí hodnotu,
        -- aby bylo možné porovnat relativní vývoj fondů.
        normalized_nav DECIMAL(18,10) NOT NULL,
        -- Kumulativní výnos od začátku společného analytického období.
        cumulative_return DECIMAL(18,10) NOT NULL,
        -- Relativní pokles aktuální NAV od dosavadního maxima.
        -- Hodnota 0 znamená, že fond je na novém nebo dosavadním maximu.
        drawdown DECIMAL(18,10) NOT NULL,
        -- Výnos za přibližně posledních 12 měsíců. Prvních 252 pozorování proto nemá hodnotu.
        rolling_12m_return DECIMAL(18,10) NULL,
        -- Datum a čas, kdy byl analytický výpočet uložen do SQL.
        calculation_timestamp DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
        CONSTRAINT FK_FactFundPerformanceDaily_DimFund
            FOREIGN KEY (fund_key)
            REFERENCES analytics.DimFund(fund_key),
        CONSTRAINT FK_FactFundPerformanceDaily_DimDate
            FOREIGN KEY (date_key)
            REFERENCES analytics.DimDate(date_key),
        -- Jeden fond může mít pro jedno datum pouze jeden analytický záznam.
        CONSTRAINT UQ_FactFundPerformanceDaily_fund_date
            UNIQUE (fund_key, date_key)
    );
END;
GO


/* ============================================================
   2. VYTVOŘENÍ SOUHRNNÉ KPI TABULKY
   ============================================================ */

IF OBJECT_ID('analytics.FundPerformanceSummary', 'U') IS NULL
BEGIN
    CREATE TABLE analytics.FundPerformanceSummary (
        -- Interní technický klíč souhrnného KPI řádku.
        fund_performance_summary_key BIGINT IDENTITY PRIMARY KEY,
        -- Vazba na konkrétní fond v analytics.DimFund.
        fund_key INT NOT NULL,
        -- Začátek společného analytického období.
        period_start DATE NOT NULL,
        -- Konec společného analytického období.
        period_end DATE NOT NULL,
        -- Celkový výnos fondu za celé analytické období.
        cumulative_return DECIMAL(18,10) NOT NULL,
        -- Složené průměrné roční tempo růstu za celé analytické období.
        cagr DECIMAL(18,10) NOT NULL,
        -- Anualizovaná volatilita denních výnosů.
        annualized_volatility DECIMAL(18,10) NOT NULL,
        -- Nejhlubší historický propad fondu od předchozího maxima k následnému minimu.
        maximum_drawdown DECIMAL(18,10) NOT NULL,
        -- Počet kalendářních dní od dna největšího propadu do návratu alespoň na úroveň předchozího maxima.
        -- Pokud se fond do konce období nezotaví, může být NULL.
        recovery_days INT NULL,
        -- Zda se fond po největším propadudo konce analytického období zotavil.
        recovered BIT NOT NULL,
        -- Datum a čas, kdy byl analytický souhrn uložen do SQL.
        calculation_timestamp DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
        CONSTRAINT FK_FundPerformanceSummary_DimFund
            FOREIGN KEY (fund_key)
            REFERENCES analytics.DimFund(fund_key),
        -- Pro jeden fond a stejné analytické období může existovat pouze jeden souhrnný KPI záznam.
        CONSTRAINT UQ_FundPerformanceSummary_fund_period
            UNIQUE (fund_key, period_start, period_end)
    );
END;
GO


/* ============================================================
   3. KONTROLA VYTVOŘENÍ TABULEK
   ============================================================ */

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'analytics'
    AND TABLE_NAME IN (
        'FactFundPerformanceDaily',
        'FundPerformanceSummary'
    )
ORDER BY TABLE_NAME;
GO