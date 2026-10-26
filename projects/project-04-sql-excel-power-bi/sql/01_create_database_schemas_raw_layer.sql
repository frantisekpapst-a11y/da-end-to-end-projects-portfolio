-- ============================================================
-- Vytvoření databáze a schémat 
-- ============================================================

USE master;
GO

IF DB_ID(N'manufacturing_controlling') IS NULL
BEGIN
    CREATE DATABASE manufacturing_controlling;
END;
GO

USE manufacturing_controlling;
GO

IF SCHEMA_ID(N'raw') IS NULL
    EXEC(N'CREATE SCHEMA raw AUTHORIZATION dbo;');
GO

IF SCHEMA_ID(N'staging') IS NULL
    EXEC(N'CREATE SCHEMA staging AUTHORIZATION dbo;');
GO

IF SCHEMA_ID(N'clean') IS NULL
    EXEC(N'CREATE SCHEMA clean AUTHORIZATION dbo;');
GO

IF SCHEMA_ID(N'analytics') IS NULL
    EXEC(N'CREATE SCHEMA analytics AUTHORIZATION dbo;');
GO

-- Kontrola vytvořených schémat
SELECT name AS schema_name
FROM sys.schemas
WHERE name IN (N'raw', N'staging', N'clean', N'analytics')
ORDER BY name;

-- ============================================================
-- RAW: Číselníky
-- ============================================================

DROP TABLE IF EXISTS raw.Vyrobky;
DROP TABLE IF EXISTS raw.Materialy;
DROP TABLE IF EXISTS raw.Strediska;
DROP TABLE IF EXISTS raw.Stroje;
GO

CREATE TABLE raw.Vyrobky (
    vyrobek_id VARCHAR(20),
    nazev_vyrobku NVARCHAR(200),
    skupina_vyrobku NVARCHAR(100),
    merna_jednotka VARCHAR(20),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.Materialy (
    material_id VARCHAR(20),
    nazev_materialu NVARCHAR(200),
    skupina_materialu NVARCHAR(100),
    merna_jednotka VARCHAR(20),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.Strediska (
    stredisko_id VARCHAR(20),
    nazev_strediska NVARCHAR(200),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.Stroje (
    stroj_id VARCHAR(20),
    nazev_stroje NVARCHAR(200),
    stredisko_id VARCHAR(20),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);
GO

-- ============================================================
-- RAW: Zakázky, materiálové výdeje a pracovní záznamy
-- ============================================================

DROP TABLE IF EXISTS raw.VyrobniZakazky;
DROP TABLE IF EXISTS raw.MaterialoveVydeje;
DROP TABLE IF EXISTS raw.PracovniZaznamy;
GO

CREATE TABLE raw.VyrobniZakazky (
    zakazka_id VARCHAR(20),
    vyrobek_id VARCHAR(20),
    stredisko_id VARCHAR(20),
    datum_zahajeni DATE,
    datum_dokonceni DATE,
    stav_zakazky NVARCHAR(50),
    dobre_kusy INT,
    zmetkove_kusy INT,
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.MaterialoveVydeje (
    vydej_id VARCHAR(20),
    zakazka_id VARCHAR(20),
    material_id VARCHAR(20),
    datum_vydeje DATE,
    mnozstvi DECIMAL(18,4),
    hodnota_spotreby DECIMAL(18,2),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.PracovniZaznamy (
    zaznam_id VARCHAR(20),
    zakazka_id VARCHAR(20),
    datum_prace DATE,
    druh_casu NVARCHAR(50),
    clovekohodiny DECIMAL(18,4),
    mzdovy_naklad DECIMAL(18,2),
    prostoj_id VARCHAR(20),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);
GO

-- ============================================================
-- RAW: Výrobní režie, provoz strojů a prostoje
-- ============================================================

DROP TABLE IF EXISTS raw.VyrobniRezie;
DROP TABLE IF EXISTS raw.ProvozStroju;
DROP TABLE IF EXISTS raw.Prostoje;
GO

CREATE TABLE raw.VyrobniRezie (
    polozka_id VARCHAR(20),
    datum_nakladu DATE,
    stredisko_id VARCHAR(20),
    kategorie_rezie NVARCHAR(100),
    popis NVARCHAR(300),
    castka DECIMAL(18,2),
    prostoj_id VARCHAR(20),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.ProvozStroju (
    provoz_id VARCHAR(20),
    datum DATE,
    smena VARCHAR(20),
    stroj_id VARCHAR(20),
    vyrobek_id VARCHAR(20),
    dobre_kusy INT,
    zmetkove_kusy INT,
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.Prostoje (
    prostoj_id VARCHAR(20),
    stroj_id VARCHAR(20),
    zakazka_id VARCHAR(20),
    datum DATE,
    smena VARCHAR(20),
    duvod_prostoje NVARCHAR(100),
    popis NVARCHAR(300),
    delka_prostoje_h DECIMAL(18,4),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);
GO

-- ============================================================
-- RAW: Zásoby a normy
-- ============================================================

DROP TABLE IF EXISTS raw.StavyZasob;
DROP TABLE IF EXISTS raw.MaterialoveNormy;
DROP TABLE IF EXISTS raw.VyrobniNormy;
GO

CREATE TABLE raw.StavyZasob (
    stav_id VARCHAR(20),
    datum_stavu DATE,
    stredisko_id VARCHAR(20),
    kategorie_zasob NVARCHAR(50),
    hodnota_zasob DECIMAL(18,2),
    poznamka NVARCHAR(500),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.MaterialoveNormy (
    norma_id VARCHAR(20),
    vyrobek_id VARCHAR(20),
    material_id VARCHAR(20),
    platnost_od DATE,
    platnost_do DATE,
    mnozstvi_na_dobry_kus DECIMAL(18,6),
    planovana_cena_za_jednotku DECIMAL(18,4),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.VyrobniNormy (
    norma_id VARCHAR(20),
    vyrobek_id VARCHAR(20),
    stredisko_id VARCHAR(20),
    stroj_id VARCHAR(20),
    platnost_od DATE,
    platnost_do DATE,
    clovekohodiny_na_dobry_kus DECIMAL(18,6),
    strojove_hodiny_na_dobry_kus DECIMAL(18,6),
    planovana_mzdova_sazba DECIMAL(18,4),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);
GO

-- ============================================================
-- RAW: Plán, rozpočet a uzávěrkové úpravy
-- ============================================================

DROP TABLE IF EXISTS raw.PlanVyroby;
DROP TABLE IF EXISTS raw.RozpocetRezie;
DROP TABLE IF EXISTS raw.UzaverkoveUpravy;
GO

CREATE TABLE raw.PlanVyroby (
    plan_id VARCHAR(20),
    mesic DATE,
    vyrobek_id VARCHAR(20),
    stredisko_id VARCHAR(20),
    planovane_dobre_kusy INT,
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.RozpocetRezie (
    rozpocet_id VARCHAR(20),
    mesic DATE,
    stredisko_id VARCHAR(20),
    kategorie_rezie NVARCHAR(100),
    planovana_fixni_cast DECIMAL(18,2),
    variabilni_sazba_na_strojohodinu DECIMAL(18,4),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE raw.UzaverkoveUpravy (
    uprava_id VARCHAR(20),
    mesic DATE,
    stredisko_id VARCHAR(20),
    kategorie_rezie NVARCHAR(100),
    souvisejici_polozka_id VARCHAR(20),
    prostoj_id VARCHAR(20),
    typ_upravy NVARCHAR(100),
    popis NVARCHAR(500),
    castka_upravy DECIMAL(18,2),
    zdrojovy_soubor NVARCHAR(260),
    cas_nacteni DATETIME2 DEFAULT SYSDATETIME()
);

GO

-- Kontrola 16 tabulek ve schématu raw
SELECT
    t.name AS nazev_tabulky
FROM sys.tables AS t
INNER JOIN sys.schemas AS s
    ON t.schema_id = s.schema_id
WHERE s.name = N'raw'
ORDER BY t.name;

-- ============================================================
-- Načtení dat z CSV souborů do tabulek ve schématu raw
-- ============================================================

-- Vyrobky
DROP TABLE IF EXISTS #Import_Vyrobky;
CREATE TABLE #Import_Vyrobky (
    vyrobek_id VARCHAR(20),
    nazev_vyrobku NVARCHAR(200),
    skupina_vyrobku NVARCHAR(100),
    merna_jednotka VARCHAR(20)
);
BULK INSERT #Import_Vyrobky
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\Vyrobky.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.Vyrobky (vyrobek_id, nazev_vyrobku, skupina_vyrobku, merna_jednotka, zdrojovy_soubor)
SELECT vyrobek_id, nazev_vyrobku, skupina_vyrobku, merna_jednotka, N'Vyrobky.csv'
FROM #Import_Vyrobky;
DROP TABLE #Import_Vyrobky;
GO

-- Materialy
DROP TABLE IF EXISTS #Import_Materialy;
CREATE TABLE #Import_Materialy (
    material_id VARCHAR(20),
    nazev_materialu NVARCHAR(200),
    skupina_materialu NVARCHAR(100),
    merna_jednotka VARCHAR(20)
);
BULK INSERT #Import_Materialy
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\Materialy.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.Materialy (material_id, nazev_materialu, skupina_materialu, merna_jednotka, zdrojovy_soubor)
SELECT material_id, nazev_materialu, skupina_materialu, merna_jednotka, N'Materialy.csv'
FROM #Import_Materialy;
DROP TABLE #Import_Materialy;
GO

-- Strediska
DROP TABLE IF EXISTS #Import_Strediska;
CREATE TABLE #Import_Strediska (
    stredisko_id VARCHAR(20),
    nazev_strediska NVARCHAR(200)
);
BULK INSERT #Import_Strediska
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\Strediska.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.Strediska (stredisko_id, nazev_strediska, zdrojovy_soubor)
SELECT stredisko_id, nazev_strediska, N'Strediska.csv'
FROM #Import_Strediska;
DROP TABLE #Import_Strediska;
GO

-- Stroje
DROP TABLE IF EXISTS #Import_Stroje;
CREATE TABLE #Import_Stroje (
    stroj_id VARCHAR(20),
    nazev_stroje NVARCHAR(200),
    stredisko_id VARCHAR(20)
);
BULK INSERT #Import_Stroje
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\Stroje.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.Stroje (stroj_id, nazev_stroje, stredisko_id, zdrojovy_soubor)
SELECT stroj_id, nazev_stroje, stredisko_id, N'Stroje.csv'
FROM #Import_Stroje;
DROP TABLE #Import_Stroje;
GO

-- VyrobniZakazky
DROP TABLE IF EXISTS #Import_VyrobniZakazky;
CREATE TABLE #Import_VyrobniZakazky (
    zakazka_id VARCHAR(20),
    vyrobek_id VARCHAR(20),
    stredisko_id VARCHAR(20),
    datum_zahajeni DATE,
    datum_dokonceni DATE,
    stav_zakazky NVARCHAR(50),
    dobre_kusy INT,
    zmetkove_kusy INT
);
BULK INSERT #Import_VyrobniZakazky
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\VyrobniZakazky.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.VyrobniZakazky (zakazka_id, vyrobek_id, stredisko_id, datum_zahajeni, datum_dokonceni, stav_zakazky, dobre_kusy, zmetkove_kusy, zdrojovy_soubor)
SELECT zakazka_id, vyrobek_id, stredisko_id, datum_zahajeni, datum_dokonceni, stav_zakazky, dobre_kusy, zmetkove_kusy, N'VyrobniZakazky.csv'
FROM #Import_VyrobniZakazky;
DROP TABLE #Import_VyrobniZakazky;
GO

-- MaterialoveVydeje
DROP TABLE IF EXISTS #Import_MaterialoveVydeje;
CREATE TABLE #Import_MaterialoveVydeje (
    vydej_id VARCHAR(20),
    zakazka_id VARCHAR(20),
    material_id VARCHAR(20),
    datum_vydeje DATE,
    mnozstvi DECIMAL(18,4),
    hodnota_spotreby DECIMAL(18,2)
);
BULK INSERT #Import_MaterialoveVydeje
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\MaterialoveVydeje.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.MaterialoveVydeje (vydej_id, zakazka_id, material_id, datum_vydeje, mnozstvi, hodnota_spotreby, zdrojovy_soubor)
SELECT vydej_id, zakazka_id, material_id, datum_vydeje, mnozstvi, hodnota_spotreby, N'MaterialoveVydeje.csv'
FROM #Import_MaterialoveVydeje;
DROP TABLE #Import_MaterialoveVydeje;
GO

-- PracovniZaznamy
DROP TABLE IF EXISTS #Import_PracovniZaznamy;
CREATE TABLE #Import_PracovniZaznamy (
    zaznam_id VARCHAR(20),
    zakazka_id VARCHAR(20),
    datum_prace DATE,
    druh_casu NVARCHAR(50),
    clovekohodiny DECIMAL(18,4),
    mzdovy_naklad DECIMAL(18,2),
    prostoj_id VARCHAR(20)
);
BULK INSERT #Import_PracovniZaznamy
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\PracovniZaznamy.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.PracovniZaznamy (zaznam_id, zakazka_id, datum_prace, druh_casu, clovekohodiny, mzdovy_naklad, prostoj_id, zdrojovy_soubor)
SELECT zaznam_id, zakazka_id, datum_prace, druh_casu, clovekohodiny, mzdovy_naklad, prostoj_id, N'PracovniZaznamy.csv'
FROM #Import_PracovniZaznamy;
DROP TABLE #Import_PracovniZaznamy;
GO

-- VyrobniRezie
DROP TABLE IF EXISTS #Import_VyrobniRezie;
CREATE TABLE #Import_VyrobniRezie (
    polozka_id VARCHAR(20),
    datum_nakladu DATE,
    stredisko_id VARCHAR(20),
    kategorie_rezie NVARCHAR(100),
    popis NVARCHAR(300),
    castka DECIMAL(18,2),
    prostoj_id VARCHAR(20)
);
BULK INSERT #Import_VyrobniRezie
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\VyrobniRezie.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.VyrobniRezie (polozka_id, datum_nakladu, stredisko_id, kategorie_rezie, popis, castka, prostoj_id, zdrojovy_soubor)
SELECT polozka_id, datum_nakladu, stredisko_id, kategorie_rezie, popis, castka, prostoj_id, N'VyrobniRezie.csv'
FROM #Import_VyrobniRezie;
DROP TABLE #Import_VyrobniRezie;
GO

-- ProvozStroju
DROP TABLE IF EXISTS #Import_ProvozStroju;
CREATE TABLE #Import_ProvozStroju (
    provoz_id VARCHAR(20),
    datum DATE,
    smena VARCHAR(20),
    stroj_id VARCHAR(20),
    vyrobek_id VARCHAR(20),
    planovany_vyrobni_cas_h DECIMAL(18,4),
    skutecny_provozni_cas_h DECIMAL(18,4),
    idealni_cas_na_kus_h DECIMAL(18,6),
    dobre_kusy INT,
    zmetkove_kusy INT
);
BULK INSERT #Import_ProvozStroju
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\ProvozStroju.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.ProvozStroju (provoz_id, datum, smena, stroj_id, vyrobek_id, dobre_kusy, zmetkove_kusy, zdrojovy_soubor)
SELECT provoz_id, datum, smena, stroj_id, vyrobek_id, dobre_kusy, zmetkove_kusy, N'ProvozStroju.csv'
FROM #Import_ProvozStroju;
DROP TABLE #Import_ProvozStroju;
GO

-- Prostoje
DROP TABLE IF EXISTS #Import_Prostoje;
CREATE TABLE #Import_Prostoje (
    prostoj_id VARCHAR(20),
    stroj_id VARCHAR(20),
    zakazka_id VARCHAR(20),
    datum DATE,
    smena VARCHAR(20),
    duvod_prostoje NVARCHAR(100),
    popis NVARCHAR(300),
    delka_prostoje_h DECIMAL(18,4)
);
BULK INSERT #Import_Prostoje
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\Prostoje.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.Prostoje (prostoj_id, stroj_id, zakazka_id, datum, smena, duvod_prostoje, popis, delka_prostoje_h, zdrojovy_soubor)
SELECT prostoj_id, stroj_id, zakazka_id, datum, smena, duvod_prostoje, popis, delka_prostoje_h, N'Prostoje.csv'
FROM #Import_Prostoje;
DROP TABLE #Import_Prostoje;
GO

-- StavyZasob
DROP TABLE IF EXISTS #Import_StavyZasob;
CREATE TABLE #Import_StavyZasob (
    stav_id VARCHAR(20),
    datum_stavu DATE,
    stredisko_id VARCHAR(20),
    kategorie_zasob NVARCHAR(50),
    hodnota_zasob DECIMAL(18,2),
    poznamka NVARCHAR(500)
);
BULK INSERT #Import_StavyZasob
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\StavyZasob.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.StavyZasob (stav_id, datum_stavu, stredisko_id, kategorie_zasob, hodnota_zasob, poznamka, zdrojovy_soubor)
SELECT stav_id, datum_stavu, stredisko_id, kategorie_zasob, hodnota_zasob, poznamka, N'StavyZasob.csv'
FROM #Import_StavyZasob;
DROP TABLE #Import_StavyZasob;
GO

-- MaterialoveNormy
DROP TABLE IF EXISTS #Import_MaterialoveNormy;
CREATE TABLE #Import_MaterialoveNormy (
    norma_id VARCHAR(20),
    vyrobek_id VARCHAR(20),
    material_id VARCHAR(20),
    platnost_od DATE,
    platnost_do DATE,
    mnozstvi_na_dobry_kus DECIMAL(18,6),
    planovana_cena_za_jednotku DECIMAL(18,4)
);
BULK INSERT #Import_MaterialoveNormy
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\MaterialoveNormy.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.MaterialoveNormy (norma_id, vyrobek_id, material_id, platnost_od, platnost_do, mnozstvi_na_dobry_kus, planovana_cena_za_jednotku, zdrojovy_soubor)
SELECT norma_id, vyrobek_id, material_id, platnost_od, platnost_do, mnozstvi_na_dobry_kus, planovana_cena_za_jednotku, N'MaterialoveNormy.csv'
FROM #Import_MaterialoveNormy;
DROP TABLE #Import_MaterialoveNormy;
GO

-- VyrobniNormy
DROP TABLE IF EXISTS #Import_VyrobniNormy;
CREATE TABLE #Import_VyrobniNormy (
    norma_id VARCHAR(20),
    vyrobek_id VARCHAR(20),
    stredisko_id VARCHAR(20),
    stroj_id VARCHAR(20),
    platnost_od DATE,
    platnost_do DATE,
    clovekohodiny_na_dobry_kus DECIMAL(18,6),
    strojove_hodiny_na_dobry_kus DECIMAL(18,6),
    planovana_mzdova_sazba DECIMAL(18,4)
);
BULK INSERT #Import_VyrobniNormy
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\VyrobniNormy.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.VyrobniNormy (norma_id, vyrobek_id, stredisko_id, stroj_id, platnost_od, platnost_do, clovekohodiny_na_dobry_kus, strojove_hodiny_na_dobry_kus, planovana_mzdova_sazba, zdrojovy_soubor)
SELECT norma_id, vyrobek_id, stredisko_id, stroj_id, platnost_od, platnost_do, clovekohodiny_na_dobry_kus, strojove_hodiny_na_dobry_kus, planovana_mzdova_sazba, N'VyrobniNormy.csv'
FROM #Import_VyrobniNormy;
DROP TABLE #Import_VyrobniNormy;
GO

-- PlanVyroby
DROP TABLE IF EXISTS #Import_PlanVyroby;
CREATE TABLE #Import_PlanVyroby (
    plan_id VARCHAR(20),
    mesic DATE,
    vyrobek_id VARCHAR(20),
    stredisko_id VARCHAR(20),
    planovane_dobre_kusy INT
);
BULK INSERT #Import_PlanVyroby
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\PlanVyroby.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.PlanVyroby (plan_id, mesic, vyrobek_id, stredisko_id, planovane_dobre_kusy, zdrojovy_soubor)
SELECT plan_id, mesic, vyrobek_id, stredisko_id, planovane_dobre_kusy, N'PlanVyroby.csv'
FROM #Import_PlanVyroby;
DROP TABLE #Import_PlanVyroby;
GO

-- RozpocetRezie
DROP TABLE IF EXISTS #Import_RozpocetRezie;
CREATE TABLE #Import_RozpocetRezie (
    rozpocet_id VARCHAR(20),
    mesic DATE,
    stredisko_id VARCHAR(20),
    kategorie_rezie NVARCHAR(100),
    planovana_fixni_cast DECIMAL(18,2),
    variabilni_sazba_na_strojohodinu DECIMAL(18,4)
);
BULK INSERT #Import_RozpocetRezie
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\RozpocetRezie.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.RozpocetRezie (rozpocet_id, mesic, stredisko_id, kategorie_rezie, planovana_fixni_cast, variabilni_sazba_na_strojohodinu, zdrojovy_soubor)
SELECT rozpocet_id, mesic, stredisko_id, kategorie_rezie, planovana_fixni_cast, variabilni_sazba_na_strojohodinu, N'RozpocetRezie.csv'
FROM #Import_RozpocetRezie;
DROP TABLE #Import_RozpocetRezie;
GO

-- UzaverkoveUpravy
DROP TABLE IF EXISTS #Import_UzaverkoveUpravy;
CREATE TABLE #Import_UzaverkoveUpravy (
    uprava_id VARCHAR(20),
    mesic DATE,
    stredisko_id VARCHAR(20),
    kategorie_rezie NVARCHAR(100),
    souvisejici_polozka_id VARCHAR(20),
    prostoj_id VARCHAR(20),
    typ_upravy NVARCHAR(100),
    popis NVARCHAR(500),
    castka_upravy DECIMAL(18,2)
);
BULK INSERT #Import_UzaverkoveUpravy
FROM 'C:\Users\frant\Documents\data-analytics-workspace\da-end-to-end-projects-portfolio\projects\project-04-sql-excel-power-bi\data\source\UzaverkoveUpravy.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2, FIELDTERMINATOR = ';',
      FIELDQUOTE = '"', ROWTERMINATOR = '0x0a', CODEPAGE = '65001');
INSERT INTO raw.UzaverkoveUpravy (uprava_id, mesic, stredisko_id, kategorie_rezie, souvisejici_polozka_id, prostoj_id, typ_upravy, popis, castka_upravy, zdrojovy_soubor)
SELECT uprava_id, mesic, stredisko_id, kategorie_rezie, souvisejici_polozka_id, prostoj_id, typ_upravy, popis, castka_upravy, N'UzaverkoveUpravy.csv'
FROM #Import_UzaverkoveUpravy;
DROP TABLE #Import_UzaverkoveUpravy;
GO

-- Technická kontrola načtení, nikoliv potvrzení kvality dat.
SELECT N'Vyrobky' AS tabulka, COUNT(*) AS pocet_radku FROM raw.Vyrobky
UNION ALL
SELECT N'Materialy' AS tabulka, COUNT(*) AS pocet_radku FROM raw.Materialy
UNION ALL
SELECT N'Strediska' AS tabulka, COUNT(*) AS pocet_radku FROM raw.Strediska
UNION ALL
SELECT N'Stroje' AS tabulka, COUNT(*) AS pocet_radku FROM raw.Stroje
UNION ALL
SELECT N'VyrobniZakazky' AS tabulka, COUNT(*) AS pocet_radku FROM raw.VyrobniZakazky
UNION ALL
SELECT N'MaterialoveVydeje' AS tabulka, COUNT(*) AS pocet_radku FROM raw.MaterialoveVydeje
UNION ALL
SELECT N'PracovniZaznamy' AS tabulka, COUNT(*) AS pocet_radku FROM raw.PracovniZaznamy
UNION ALL
SELECT N'VyrobniRezie' AS tabulka, COUNT(*) AS pocet_radku FROM raw.VyrobniRezie
UNION ALL
SELECT N'ProvozStroju' AS tabulka, COUNT(*) AS pocet_radku FROM raw.ProvozStroju
UNION ALL
SELECT N'Prostoje' AS tabulka, COUNT(*) AS pocet_radku FROM raw.Prostoje
UNION ALL
SELECT N'StavyZasob' AS tabulka, COUNT(*) AS pocet_radku FROM raw.StavyZasob
UNION ALL
SELECT N'MaterialoveNormy' AS tabulka, COUNT(*) AS pocet_radku FROM raw.MaterialoveNormy
UNION ALL
SELECT N'VyrobniNormy' AS tabulka, COUNT(*) AS pocet_radku FROM raw.VyrobniNormy
UNION ALL
SELECT N'PlanVyroby' AS tabulka, COUNT(*) AS pocet_radku FROM raw.PlanVyroby
UNION ALL
SELECT N'RozpocetRezie' AS tabulka, COUNT(*) AS pocet_radku FROM raw.RozpocetRezie
UNION ALL
SELECT N'UzaverkoveUpravy' AS tabulka, COUNT(*) AS pocet_radku FROM raw.UzaverkoveUpravy
ORDER BY tabulka;
GO