USE customer_retention_analytics;
GO

/* ============================================================
   8 CREATE ANALYTICAL LAYER

   Cíl:
   Připravit data z clean vrstvy pro business analýzu,
   KPI a následné použití v Power BI.

   Hlavní granularita:
   1 řádek = 1 zákazník × 1 měsíc
   ============================================================ */

DROP TABLE IF EXISTS analytics.FactZakaznikMesic;

CREATE TABLE analytics.FactZakaznikMesic (
    zakaznik_id VARCHAR(20) NOT NULL,
    mesic DATE NOT NULL,
    predplatne_id VARCHAR(20),
    tarif_id VARCHAR(20),

    aktivni_na_zacatku BIT NOT NULL,
    aktivni_na_konci BIT NOT NULL,

    nova_aktivace BIT NOT NULL,
    ukonceni_predplatneho BIT NOT NULL,
    churn BIT NOT NULL,
    reaktivace BIT NOT NULL,
    baze_reaktivace BIT NOT NULL,

    typ_predplatneho VARCHAR(20),
    delka_predplatneho_mesice INT,
    duvod_zruseni VARCHAR(100),

    pocet_pripadu_podpory INT NOT NULL,
    doba_do_reaktivace_dny INT,

    trzby DECIMAL(10, 2) NOT NULL,

    PRIMARY KEY (zakaznik_id, mesic)
);

/* ============================================================
   NAPLNĚNÍ ZÁKLADU FACT TABULKY
   Zákazník × relevantní měsíc
   ============================================================ */

WITH PrvniAktivace AS (
    SELECT
        zakaznik_id,
        MIN(datum_zacatku) AS prvni_aktivace
    FROM clean.Predplatna
    GROUP BY zakaznik_id
),
Mesice AS (
    SELECT DISTINCT
        mesic_fakturace AS mesic
    FROM clean.Fakturace
)
INSERT INTO analytics.FactZakaznikMesic (
    zakaznik_id,
    mesic,
    aktivni_na_zacatku,
    aktivni_na_konci,
    nova_aktivace,
    ukonceni_predplatneho,
    churn,
    reaktivace,
    baze_reaktivace,
    pocet_pripadu_podpory,
    trzby
)
SELECT
    pa.zakaznik_id,
    m.mesic,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
FROM PrvniAktivace pa
CROSS JOIN Mesice m
WHERE m.mesic >= DATEFROMPARTS(
    YEAR(pa.prvni_aktivace),
    MONTH(pa.prvni_aktivace),
    1
);


/* ============================================================
   DOPLNĚNÍ PŘEDPLATNÉHO A TARIFU
   ============================================================ */

UPDATE f
SET
    f.predplatne_id = p.predplatne_id,
    f.tarif_id = p.tarif_id
FROM analytics.FactZakaznikMesic f
JOIN clean.Predplatna p
    ON f.zakaznik_id = p.zakaznik_id
WHERE p.datum_zacatku <= EOMONTH(f.mesic)
    AND (
        p.datum_konce IS NULL
        OR p.datum_konce >= f.mesic
    );


/* ============================================================
   AKTIVITA NA ZAČÁTKU A KONCI MĚSÍCE
   ============================================================ */

UPDATE f
SET aktivni_na_zacatku = 1
FROM analytics.FactZakaznikMesic f
JOIN clean.Predplatna p
    ON f.zakaznik_id = p.zakaznik_id
WHERE p.datum_zacatku <= EOMONTH(DATEADD(MONTH, -1, f.mesic))
  AND (
      p.datum_konce IS NULL
      OR p.datum_konce >= EOMONTH(DATEADD(MONTH, -1, f.mesic))
  );


UPDATE f
SET aktivni_na_konci = 1
FROM analytics.FactZakaznikMesic f
JOIN clean.Predplatna p
    ON f.zakaznik_id = p.zakaznik_id
WHERE p.datum_zacatku <= EOMONTH(f.mesic)
  AND (
      p.datum_konce IS NULL
      OR p.datum_konce >= EOMONTH(f.mesic)
  );


/* ============================================================
   AKTIVACE, UKONČENÍ A CHURN
   ============================================================ */

WITH PrvniAktivace AS (
    SELECT
        zakaznik_id,
        MIN(datum_zacatku) AS prvni_aktivace
    FROM clean.Predplatna
    GROUP BY zakaznik_id
)
UPDATE f
SET nova_aktivace = 1
FROM analytics.FactZakaznikMesic f
JOIN PrvniAktivace pa
    ON f.zakaznik_id = pa.zakaznik_id
WHERE pa.prvni_aktivace >= f.mesic
  AND pa.prvni_aktivace <= EOMONTH(f.mesic);


UPDATE f
SET ukonceni_predplatneho = 1
FROM analytics.FactZakaznikMesic f
JOIN clean.Predplatna p
    ON f.zakaznik_id = p.zakaznik_id
WHERE p.datum_konce >= f.mesic
  AND p.datum_konce <= EOMONTH(f.mesic);


UPDATE analytics.FactZakaznikMesic
SET churn = 1
WHERE aktivni_na_zacatku = 1
  AND ukonceni_predplatneho = 1;


/* ============================================================
   REAKTIVACE A ZÁKLADNA PRO REAKTIVACI
   ============================================================ */

WITH PoradiPredplatneho AS (
    SELECT
        zakaznik_id,
        datum_zacatku,
        ROW_NUMBER() OVER (
            PARTITION BY zakaznik_id
            ORDER BY datum_zacatku
        ) AS poradi
    FROM clean.Predplatna
)
UPDATE f
SET reaktivace = 1
FROM analytics.FactZakaznikMesic f
JOIN PoradiPredplatneho p
    ON f.zakaznik_id = p.zakaznik_id
WHERE p.poradi > 1
  AND p.datum_zacatku >= f.mesic
  AND p.datum_zacatku <= EOMONTH(f.mesic);


UPDATE f
SET baze_reaktivace = 1
FROM analytics.FactZakaznikMesic f

JOIN clean.Predplatna p_predchozi
    ON f.zakaznik_id = p_predchozi.zakaznik_id
    AND p_predchozi.datum_konce < f.mesic

LEFT JOIN clean.Predplatna p_aktivni
    ON f.zakaznik_id = p_aktivni.zakaznik_id
    AND p_aktivni.datum_zacatku <= f.mesic
    AND (
        p_aktivni.datum_konce IS NULL
        OR p_aktivni.datum_konce >= f.mesic
    )
WHERE p_aktivni.predplatne_id IS NULL;


/* ============================================================
   ÚDAJE O PŘEDPLATNÉM
   ============================================================ */

WITH PoradiPredplatneho AS (
    SELECT
        predplatne_id,
        ROW_NUMBER() OVER (
            PARTITION BY zakaznik_id
            ORDER BY datum_zacatku
        ) AS poradi
    FROM clean.Predplatna
)
UPDATE f
SET
    typ_predplatneho =
        CASE
            WHEN pp.poradi = 1 THEN 'Prvni'
            ELSE 'Reaktivovane'
        END,

    delka_predplatneho_mesice =
        DATEDIFF(MONTH, p.datum_zacatku, f.mesic) + 1,

    duvod_zruseni =
        CASE
            WHEN f.ukonceni_predplatneho = 1
            THEN p.duvod_zruseni
        END

FROM analytics.FactZakaznikMesic f
JOIN clean.Predplatna p
    ON f.predplatne_id = p.predplatne_id
JOIN PoradiPredplatneho pp
    ON f.predplatne_id = pp.predplatne_id;


/* ============================================================
   PODPORA
   ============================================================ */

WITH PodporaMesic AS (
    SELECT
        zakaznik_id,
        DATEFROMPARTS(
            YEAR(datum_vytvoreni),
            MONTH(datum_vytvoreni),
            1
        ) AS mesic,
        COUNT(*) AS pocet_pripadu
    FROM clean.PripadyPodpory
    GROUP BY
        zakaznik_id,
        DATEFROMPARTS(
            YEAR(datum_vytvoreni),
            MONTH(datum_vytvoreni),
            1
        )
)
UPDATE f
SET pocet_pripadu_podpory = p.pocet_pripadu
FROM analytics.FactZakaznikMesic f
JOIN PodporaMesic p
    ON f.zakaznik_id = p.zakaznik_id
    AND f.mesic = p.mesic;


/* ============================================================
   DOBA DO REAKTIVACE
   ============================================================ */

WITH Reaktivace AS (
    SELECT
        predplatne_id,
        zakaznik_id,
        datum_zacatku,
        LAG(datum_konce) OVER (
            PARTITION BY zakaznik_id
            ORDER BY datum_zacatku
        ) AS predchozi_konec
    FROM clean.Predplatna
)
UPDATE f
SET doba_do_reaktivace_dny =
    DATEDIFF(DAY, r.predchozi_konec, r.datum_zacatku)
FROM analytics.FactZakaznikMesic f
JOIN Reaktivace r
    ON f.predplatne_id = r.predplatne_id
WHERE f.reaktivace = 1
  AND r.predchozi_konec IS NOT NULL;


/* ============================================================
   TRŽBY
   ============================================================ */

UPDATE f
SET trzby = b.castka
FROM analytics.FactZakaznikMesic f
JOIN clean.Fakturace b
    ON f.predplatne_id = b.predplatne_id
    AND f.mesic = b.mesic_fakturace;


/* ============================================================
   FINÁLNÍ KONTROLA FACT TABULKY
   ============================================================ */

SELECT
    COUNT(*) AS pocet_radku,
    COUNT(DISTINCT zakaznik_id) AS pocet_zakazniku,
    MIN(mesic) AS prvni_mesic,
    MAX(mesic) AS posledni_mesic,

    SUM(CAST(nova_aktivace AS INT)) AS nove_aktivace,
    SUM(CAST(ukonceni_predplatneho AS INT)) AS ukonceni,
    SUM(CAST(churn AS INT)) AS churn,
    SUM(CAST(reaktivace AS INT)) AS reaktivace,

    SUM(trzby) AS trzby,

    SUM(
        CASE
            WHEN churn = 1 AND aktivni_na_zacatku = 0
            THEN 1 ELSE 0
        END
    ) AS chyba_churn,

    SUM(
        CASE
            WHEN reaktivace = 1 AND nova_aktivace = 1
            THEN 1 ELSE 0
        END
    ) AS chyba_reaktivace

FROM analytics.FactZakaznikMesic;


/* ============================================================
   DIMENZE ZÁKAZNÍKA
   ============================================================ */

DROP TABLE IF EXISTS analytics.DimZakaznik;

CREATE TABLE analytics.DimZakaznik (
    zakaznik_id VARCHAR(20) NOT NULL PRIMARY KEY,
    region VARCHAR(50) NOT NULL
);

INSERT INTO analytics.DimZakaznik (
    zakaznik_id,
    region
)
SELECT
    zakaznik_id,
    region
FROM clean.Zakaznici;


/* ============================================================
   DIMENZE TARIFU
   ============================================================ */

DROP TABLE IF EXISTS analytics.DimTarif;

CREATE TABLE analytics.DimTarif (
    tarif_id VARCHAR(20) NOT NULL PRIMARY KEY,
    nazev_tarifu VARCHAR(50) NOT NULL,
    mesicni_cena DECIMAL(10, 2) NOT NULL
);

INSERT INTO analytics.DimTarif (
    tarif_id,
    nazev_tarifu,
    mesicni_cena
)
SELECT
    tarif_id,
    nazev_tarifu,
    mesicni_cena
FROM clean.Tarify;


/* ============================================================
   DIMENZE MĚSÍCE
   ============================================================ */

DROP TABLE IF EXISTS analytics.DimMesic;

CREATE TABLE analytics.DimMesic (
    mesic DATE NOT NULL PRIMARY KEY,
    rok INT NOT NULL,
    cislo_mesice INT NOT NULL
);

INSERT INTO analytics.DimMesic (
    mesic,
    rok,
    cislo_mesice
)
SELECT DISTINCT
    mesic,
    YEAR(mesic),
    MONTH(mesic)
FROM analytics.FactZakaznikMesic;


/* ============================================================
   FINÁLNÍ VALIDACE ANALYTICKÉ VRSTVY
   ============================================================ */

SELECT COUNT(*) AS fact_radky
FROM analytics.FactZakaznikMesic;

SELECT COUNT(*) AS zakaznici
FROM analytics.DimZakaznik;

SELECT COUNT(*) AS tarify
FROM analytics.DimTarif;

SELECT
    COUNT(*) AS mesice,
    MIN(mesic) AS prvni_mesic,
    MAX(mesic) AS posledni_mesic
FROM analytics.DimMesic;


/* Kontrola vazeb na dimenze */

SELECT COUNT(*) AS chybejici_zakaznici
FROM analytics.FactZakaznikMesic f
LEFT JOIN analytics.DimZakaznik d
    ON f.zakaznik_id = d.zakaznik_id
WHERE d.zakaznik_id IS NULL;

SELECT COUNT(*) AS chybejici_tarify
FROM analytics.FactZakaznikMesic f
LEFT JOIN analytics.DimTarif d
    ON f.tarif_id = d.tarif_id
WHERE f.tarif_id IS NOT NULL
  AND d.tarif_id IS NULL;

SELECT COUNT(*) AS chybejici_mesice
FROM analytics.FactZakaznikMesic f
LEFT JOIN analytics.DimMesic d
    ON f.mesic = d.mesic
WHERE d.mesic IS NULL;