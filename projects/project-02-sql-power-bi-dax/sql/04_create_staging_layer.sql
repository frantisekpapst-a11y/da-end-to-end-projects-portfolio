USE customer_retention_analytics;
GO

/* ============================================================
   6. DATA CLEANING - STAGING

   Cíl:
   Vytvořit pracovní stg vrstvu z raw dat.

   V této části zatím neprovádíme žádné čištění.
   stg tabulky nejprve vytvoříme jako kopie raw vrstvy.
   ============================================================ */


DROP TABLE IF EXISTS stg.Zakaznici;


SELECT *
INTO stg.Zakaznici
FROM raw.Zakaznici;


DROP TABLE IF EXISTS stg.Predplatna;


SELECT *
INTO stg.Predplatna
FROM raw.Predplatna;


DROP TABLE IF EXISTS stg.Tarify;


SELECT *
INTO stg.Tarify
FROM raw.Tarify;


DROP TABLE IF EXISTS stg.MesicniVyuziti;


SELECT *
INTO stg.MesicniVyuziti
FROM raw.MesicniVyuziti;


DROP TABLE IF EXISTS stg.Fakturace;


SELECT *
INTO stg.Fakturace
FROM raw.Fakturace;


DROP TABLE IF EXISTS stg.PripadyPodpory;


SELECT *
INTO stg.PripadyPodpory
FROM raw.PripadyPodpory;


/* ============================================================
   6.0 KONTROLA VYTVOŘENÍ STAGING VRSTVY

   Cíl:
   Ověřit, že raw a stg mají před čištěním
   stejný počet řádků.
   ============================================================ */


SELECT
    (SELECT COUNT(*) FROM stg.Zakaznici) AS zakaznici,
    (SELECT COUNT(*) FROM stg.Predplatna) AS predplatna,
    (SELECT COUNT(*) FROM stg.Tarify) AS tarify,
    (SELECT COUNT(*) FROM stg.MesicniVyuziti) AS mesicni_vyuziti,
    (SELECT COUNT(*) FROM stg.Fakturace) AS fakturace,
    (SELECT COUNT(*) FROM stg.PripadyPodpory) AS pripady_podpory;