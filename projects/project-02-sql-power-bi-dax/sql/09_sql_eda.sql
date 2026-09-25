USE customer_retention_analytics;
GO

/* ============================================================
   9 SQL EDA

   Cíl:
   Prozkoumat hlavní analytické otázky nad analytics vrstvou
   před tvorbou reportu v Power BI.
   ============================================================ */

/* ============================================================
   STRUKTURA FACT TABULKY
   ============================================================ */

EXEC sp_help 'analytics.FactZakaznikMesic';


/* ============================================================
   1. VÝVOJ ZÁKAZNICKÉ ZÁKLADNY, CHURNU A RETENCE
   ============================================================ */

SELECT
    mesic,
    SUM(CAST(aktivni_na_konci AS INT)) AS aktivni_zakaznici,
    SUM(CAST(nova_aktivace AS INT)) AS nove_aktivace,
    SUM(CAST(reaktivace AS INT)) AS reaktivace,
    SUM(CAST(ukonceni_predplatneho AS INT)) AS ukonceni,
    SUM(CAST(aktivni_na_zacatku AS INT))
        - SUM(CAST(churn AS INT))
        AS retence,
    ROUND(
        100.0 * (
            SUM(CAST(aktivni_na_zacatku AS INT))
            - SUM(CAST(churn AS INT))
        )
        / NULLIF(SUM(CAST(aktivni_na_zacatku AS INT)), 0),
        2
    ) AS mira_retence,
    SUM(CAST(churn AS INT)) AS churn,
    ROUND(
        100.0 * SUM(CAST(churn AS INT))
        / NULLIF(SUM(CAST(aktivni_na_zacatku AS INT)), 0),
        2
    ) AS mira_churnu,
    SUM(CAST(nova_aktivace AS INT))
        - SUM(CAST(ukonceni_predplatneho AS INT))
        AS rozdil_aktivace_ukonceni
FROM analytics.FactZakaznikMesic
GROUP BY mesic
ORDER BY mesic;


/* ============================================================
   2. CHURN - SEGMENTY A DUVODY
   ============================================================ */

/* ============================================================
   2.1 CHURN PODLE TARIFU
   ============================================================ */

SELECT
    d.nazev_tarifu,
    SUM(CAST(f.churn AS INT)) AS churn,
    ROUND(
        100.0 * SUM(CAST(f.churn AS INT))
        / NULLIF(SUM(CAST(f.aktivni_na_zacatku AS INT)), 0),
        2
    ) AS mira_churnu
FROM analytics.FactZakaznikMesic f
JOIN analytics.DimTarif d
    ON f.tarif_id = d.tarif_id
GROUP BY d.nazev_tarifu
ORDER BY mira_churnu DESC;


/* ============================================================
   2.2 CHURN PODLE REGIONU
   ============================================================ */

SELECT
    d.region,
    SUM(CAST(f.churn AS INT)) AS churn,
    ROUND(
        100.0 * SUM(CAST(f.churn AS INT))
        / NULLIF(SUM(CAST(f.aktivni_na_zacatku AS INT)), 0),
        2
    ) AS mira_churnu
FROM analytics.FactZakaznikMesic f
JOIN analytics.DimZakaznik d
    ON f.zakaznik_id = d.zakaznik_id
GROUP BY d.region
ORDER BY mira_churnu DESC;


/* ============================================================
   2.3 CHURN PRVNI VS REAKTIVOVANI
   ============================================================ */

SELECT
    typ_predplatneho,
    SUM(CAST(churn AS INT)) AS churn,
    ROUND(
        100.0 * SUM(CAST(churn AS INT))
        / NULLIF(SUM(CAST(aktivni_na_zacatku AS INT)), 0),
        2
    ) AS mira_churnu
FROM analytics.FactZakaznikMesic
WHERE typ_predplatneho IS NOT NULL
GROUP BY typ_predplatneho
ORDER BY mira_churnu DESC;


/* ============================================================
   2.4 DŮVODY UKONČENÍ
   ============================================================ */

SELECT
    duvod_zruseni,
    COUNT(*) AS pocet_ukonceni,
    ROUND(
        100.0 * COUNT(*)
        / (
            SELECT COUNT(*)
            FROM analytics.FactZakaznikMesic
            WHERE duvod_zruseni IS NOT NULL
        ),
        2
    ) AS podil
FROM analytics.FactZakaznikMesic
WHERE duvod_zruseni IS NOT NULL
GROUP BY duvod_zruseni
ORDER BY pocet_ukonceni DESC;


/* ============================================================
   2.5 DŮVODY UKONČENÍ A MEZIROČNÍ POROVNÁNÍ
   ============================================================ */

SELECT
    YEAR(mesic) AS rok,
    duvod_zruseni,
    COUNT(*) AS pocet_ukonceni
FROM analytics.FactZakaznikMesic
WHERE ukonceni_predplatneho = 1
  AND YEAR(mesic) IN (2025, 2026)
  AND MONTH(mesic) BETWEEN 1 AND 8
GROUP BY
    YEAR(mesic),
    duvod_zruseni
ORDER BY
    duvod_zruseni,
    rok;


/* ============================================================
   3 CHURN PODLE DÉLKY PŘEDPLATNÉHO
   ============================================================ */

WITH DelkaPredplatneho AS (
    SELECT
        delka_predplatneho_mesice,
        ukonceni_predplatneho,
        CASE
            WHEN delka_predplatneho_mesice BETWEEN 1 AND 3 THEN '1-3 mesice'
            WHEN delka_predplatneho_mesice BETWEEN 4 AND 6 THEN '4-6 mesicu'
            WHEN delka_predplatneho_mesice BETWEEN 7 AND 12 THEN '7-12 mesicu'
            WHEN delka_predplatneho_mesice BETWEEN 13 AND 24 THEN '13-24 mesicu'
            ELSE '25+ mesicu'
        END AS obdobi

    FROM analytics.FactZakaznikMesic
    WHERE predplatne_id IS NOT NULL
)
SELECT
    obdobi,
    COUNT(*) AS pocet_zakaznickych_mesicu,
    SUM(CAST(ukonceni_predplatneho AS INT)) AS pocet_ukonceni,

    ROUND(
        100.0 * SUM(CAST(ukonceni_predplatneho AS INT))
        / NULLIF(COUNT(*), 0),
        2
    ) AS mira_odchodu
FROM DelkaPredplatneho
GROUP BY obdobi
ORDER BY MIN(delka_predplatneho_mesice);


/* ============================================================
   4.1 REAKTIVACE
   ============================================================ */

/* ============================================================
   4.1 REAKTIVACE V ČASE
   ============================================================ */

SELECT
    mesic,
    SUM(CAST(reaktivace AS INT)) AS pocet_reaktivaci,
    ROUND(
        100.0 * SUM(CAST(reaktivace AS INT))
        / NULLIF(SUM(CAST(baze_reaktivace AS INT)), 0),
        2
    ) AS mira_reaktivace
FROM analytics.FactZakaznikMesic
GROUP BY mesic
ORDER BY mesic;


/* ============================================================
   4.2 DOBA DO REAKTIVACE
   ============================================================ */

SELECT
    COUNT(*) AS pocet_reaktivaci,
    ROUND(AVG(CAST(doba_do_reaktivace_dny AS DECIMAL(10, 2))), 2)
        AS prumerna_doba_do_reaktivace_dny,
    MIN(doba_do_reaktivace_dny) AS nejkratsi_doba_dny,
    MAX(doba_do_reaktivace_dny) AS nejdelsi_doba_dny
FROM analytics.FactZakaznikMesic
WHERE reaktivace = 1;


/* ============================================================
   5 TRŽBY ZÁKLADNY A CHURNU
   ============================================================ */

/* ============================================================
   5.1 VÝVOJ MĚSÍČNÍCH TRŽEB
   ============================================================ */

SELECT
    mesic,
    SUM(trzby) AS trzby
FROM analytics.FactZakaznikMesic
GROUP BY mesic
ORDER BY mesic;


/* ============================================================
   5.2 TRŽBY PODLE TARIFU
   ============================================================ */

SELECT
    d.nazev_tarifu,
    SUM(f.trzby) AS trzby
FROM analytics.FactZakaznikMesic f
JOIN analytics.DimTarif d
    ON f.tarif_id = d.tarif_id
GROUP BY d.nazev_tarifu
ORDER BY trzby DESC;


/* ============================================================
   5.3 TRŽBY PODLE REGIONU
   ============================================================ */

SELECT
    d.region,
    SUM(f.trzby) AS trzby
FROM analytics.FactZakaznikMesic f
JOIN analytics.DimZakaznik d
    ON f.zakaznik_id = d.zakaznik_id
GROUP BY d.region
ORDER BY trzby DESC;


/* ============================================================
   5.4 TRŽBY PODLE TYPU PŘEDPLATNÉHO
   ============================================================ */

SELECT
    typ_predplatneho,
    SUM(trzby) AS trzby
FROM analytics.FactZakaznikMesic
WHERE typ_predplatneho IS NOT NULL
GROUP BY typ_predplatneho
ORDER BY trzby DESC;


/* ============================================================
   5.5 TRŽBY ZÁKAZNÍKŮ, KTEŘÍ UKONČILI PŘEDPLATNÉ
   ============================================================ */

SELECT
    mesic,
    SUM(trzby) AS trzby_ukoncenych
FROM analytics.FactZakaznikMesic
WHERE ukonceni_predplatneho = 1
GROUP BY mesic
ORDER BY mesic;