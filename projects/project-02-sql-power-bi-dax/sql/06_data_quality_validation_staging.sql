USE customer_retention_analytics;
GO

/* ============================================================
   7 DATA QUALITY VALIDATION - STAGING

   Cíl:
   Ověřit výsledek čištění staging vrstvy před vytvořením
   clean vrstvy.
   ============================================================ */


/* ============================================================
   7.1 MISSING VALUES
   ============================================================ */

SELECT COUNT(*) AS ukoncena_bez_duvodu
FROM stg.Predplatna
WHERE datum_konce IS NOT NULL
  AND duvod_zruseni IS NULL;


SELECT COUNT(*) AS aktivni_s_duvodem
FROM stg.Predplatna
WHERE datum_konce IS NULL
  AND duvod_zruseni IS NOT NULL;


/* ============================================================
   7.2 DUPLICITY
   ============================================================ */

SELECT
    predplatne_id,
    mesic_vyuziti,
    COUNT(*) AS pocet
FROM stg.MesicniVyuziti
GROUP BY predplatne_id, mesic_vyuziti
HAVING COUNT(*) > 1;


SELECT
    predplatne_id,
    mesic_fakturace,
    COUNT(*) AS pocet
FROM stg.Fakturace
GROUP BY predplatne_id, mesic_fakturace
HAVING COUNT(*) > 1;


/* ============================================================
   7.3 NEPLATNÉ A NESJEDNOCENÉ HODNOTY
   ============================================================ */

SELECT COUNT(*) AS neplatne_vyuziti
FROM stg.MesicniVyuziti
WHERE hodiny_sledovani < 0
   OR aktivni_dny < 0
   OR aktivni_dny > 31;


SELECT DISTINCT region
FROM stg.Zakaznici
ORDER BY region;


SELECT DISTINCT duvod_zruseni
FROM stg.Predplatna
ORDER BY duvod_zruseni;


SELECT DISTINCT kategorie_pripadu
FROM stg.PripadyPodpory
ORDER BY kategorie_pripadu;


/* ============================================================
   7.4 BUSINESS RULES
   ============================================================ */

SELECT COUNT(*) AS chybna_castka
FROM stg.Fakturace f
JOIN stg.Predplatna p
    ON f.predplatne_id = p.predplatne_id
JOIN stg.Tarify t
    ON p.tarif_id = t.tarif_id
WHERE f.castka <> t.mesicni_cena;


/* ============================================================
   7.5 RECONCILIATION
   ============================================================ */

SELECT
    (SELECT COUNT(*) FROM raw.Zakaznici) AS zakaznici,
    (SELECT COUNT(*) FROM raw.Predplatna) AS predplatna,
    (SELECT COUNT(*) FROM raw.Tarify) AS tarify,
    (SELECT COUNT(*) FROM raw.MesicniVyuziti) AS mesicni_vyuziti,
    (SELECT COUNT(*) FROM raw.Fakturace) AS fakturace,
    (SELECT COUNT(*) FROM raw.PripadyPodpory) AS pripady_podpory;


SELECT
    (SELECT COUNT(*) FROM stg.Zakaznici) AS zakaznici,
    (SELECT COUNT(*) FROM stg.Predplatna) AS predplatna,
    (SELECT COUNT(*) FROM stg.Tarify) AS tarify,
    (SELECT COUNT(*) FROM stg.MesicniVyuziti) AS mesicni_vyuziti,
    (SELECT COUNT(*) FROM stg.Fakturace) AS fakturace,
    (SELECT COUNT(*) FROM stg.PripadyPodpory) AS pripady_podpory;


SELECT COUNT(*) AS vyrazene_mesicni_vyuziti
FROM stg.MesicniVyuziti_Vyrazene;