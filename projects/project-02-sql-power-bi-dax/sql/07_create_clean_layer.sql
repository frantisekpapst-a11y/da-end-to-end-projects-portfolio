USE customer_retention_analytics;
GO

/* ============================================================
   8 CREATE CLEAN LAYER

   Cíl:
   Vytvořit datovou vrstvu z vyčištěných
   staging dat a nastavit databázová omezení.
   ============================================================ */

DROP TABLE IF EXISTS clean.PripadyPodpory;
DROP TABLE IF EXISTS clean.Fakturace;
DROP TABLE IF EXISTS clean.MesicniVyuziti;
DROP TABLE IF EXISTS clean.Predplatna;
DROP TABLE IF EXISTS clean.Tarify;
DROP TABLE IF EXISTS clean.Zakaznici;


/* ============================================================
   8.1 ZAKAZNICI
   ============================================================ */

CREATE TABLE clean.Zakaznici (
    zakaznik_id VARCHAR(20) NOT NULL PRIMARY KEY,
    region VARCHAR(100) NOT NULL,
    datum_registrace DATE NOT NULL,
    cas_nacteni DATETIME2 NOT NULL
);


/* ============================================================
   8.2 TARIFY
   ============================================================ */

CREATE TABLE clean.Tarify (
    tarif_id VARCHAR(20) NOT NULL PRIMARY KEY,
    nazev_tarifu VARCHAR(100) NOT NULL,
    mesicni_cena DECIMAL(10,2) NOT NULL CHECK (mesicni_cena > 0),
    cas_nacteni DATETIME2 NOT NULL
);


/* ============================================================
   8.3 PREDPLATNA
   ============================================================ */

CREATE TABLE clean.Predplatna (
    predplatne_id VARCHAR(20) NOT NULL PRIMARY KEY,
    zakaznik_id VARCHAR(20) NOT NULL,
    tarif_id VARCHAR(20) NOT NULL,
    datum_zacatku DATE NOT NULL,
    datum_konce DATE NULL,
    duvod_zruseni VARCHAR(100) NULL,
    cas_nacteni DATETIME2 NOT NULL,

    FOREIGN KEY (zakaznik_id)
        REFERENCES clean.Zakaznici(zakaznik_id),

    FOREIGN KEY (tarif_id)
        REFERENCES clean.Tarify(tarif_id),
);


/* ============================================================
   8.4 MESICNI VYUZITI
   ============================================================ */

CREATE TABLE clean.MesicniVyuziti (
    vyuziti_id VARCHAR(20) NOT NULL PRIMARY KEY,
    predplatne_id VARCHAR(20) NOT NULL,
    mesic_vyuziti DATE NOT NULL,
    hodiny_sledovani DECIMAL(10,1) NOT NULL CHECK (hodiny_sledovani >= 0),
    aktivni_dny INT NOT NULL CHECK (aktivni_dny BETWEEN 0 AND 31),
    cas_nacteni DATETIME2 NOT NULL,

    FOREIGN KEY (predplatne_id)
        REFERENCES clean.Predplatna(predplatne_id),
);


/* ============================================================
   8.5 FAKTURACE
   ============================================================ */

CREATE TABLE clean.Fakturace (
    fakturace_id VARCHAR(20) NOT NULL PRIMARY KEY,
    predplatne_id VARCHAR(20) NOT NULL,
    mesic_fakturace DATE NOT NULL,
    castka DECIMAL(10,2) NOT NULL CHECK (castka > 0),
    cas_nacteni DATETIME2 NOT NULL,

    FOREIGN KEY (predplatne_id)
        REFERENCES clean.Predplatna(predplatne_id),
);
    

/* ============================================================
   8.6 PRIPADY PODPORY
   ============================================================ */

CREATE TABLE clean.PripadyPodpory (
    pripad_id VARCHAR(20) NOT NULL PRIMARY KEY,
    zakaznik_id VARCHAR(20) NOT NULL,
    datum_vytvoreni DATE NOT NULL,
    kategorie_pripadu VARCHAR(100) NOT NULL,
    stav_pripadu VARCHAR(50) NOT NULL,
    cas_nacteni DATETIME2 NOT NULL,

    FOREIGN KEY (zakaznik_id)
        REFERENCES clean.Zakaznici(zakaznik_id)
);

SELECT *
FROM clean.Zakaznici;

SELECT *
FROM clean.Tarify;

SELECT *
FROM clean.Predplatna;

SELECT *
FROM clean.MesicniVyuziti;

SELECT *
FROM clean.Fakturace;

SELECT *
FROM clean.PripadyPodpory;


/* ============================================================
   8.7 NACTENI DAT DO CLEAN VRSTVY

   Cíl:
   Načíst vyčištěná data ze staging vrstvy
   do připravených clean tabulek.
   ============================================================ */


/* ZAKAZNICI */

INSERT INTO clean.Zakaznici (
    zakaznik_id,
    region,
    datum_registrace,
    cas_nacteni
)
SELECT
    zakaznik_id,
    region,
    datum_registrace,
    cas_nacteni
FROM stg.Zakaznici;


/* TARIFY */

INSERT INTO clean.Tarify (
    tarif_id,
    nazev_tarifu,
    mesicni_cena,
    cas_nacteni
)
SELECT
    tarif_id,
    nazev_tarifu,
    mesicni_cena,
    cas_nacteni
FROM stg.Tarify;


/* PREDPLATNA */

INSERT INTO clean.Predplatna (
    predplatne_id,
    zakaznik_id,
    tarif_id,
    datum_zacatku,
    datum_konce,
    duvod_zruseni,
    cas_nacteni
)
SELECT
    predplatne_id,
    zakaznik_id,
    tarif_id,
    datum_zacatku,
    datum_konce,
    duvod_zruseni,
    cas_nacteni
FROM stg.Predplatna;


/* MESICNI VYUZITI */

INSERT INTO clean.MesicniVyuziti (
    vyuziti_id,
    predplatne_id,
    mesic_vyuziti,
    hodiny_sledovani,
    aktivni_dny,
    cas_nacteni
)
SELECT
    vyuziti_id,
    predplatne_id,
    mesic_vyuziti,
    hodiny_sledovani,
    aktivni_dny,
    cas_nacteni
FROM stg.MesicniVyuziti;


/* FAKTURACE */

INSERT INTO clean.Fakturace (
    fakturace_id,
    predplatne_id,
    mesic_fakturace,
    castka,
    cas_nacteni
)
SELECT
    fakturace_id,
    predplatne_id,
    mesic_fakturace,
    castka,
    cas_nacteni
FROM stg.Fakturace;


/* PRIPADY PODPORY */

INSERT INTO clean.PripadyPodpory (
    pripad_id,
    zakaznik_id,
    datum_vytvoreni,
    kategorie_pripadu,
    stav_pripadu,
    cas_nacteni
)
SELECT
    pripad_id,
    zakaznik_id,
    datum_vytvoreni,
    kategorie_pripadu,
    stav_pripadu,
    cas_nacteni
FROM stg.PripadyPodpory;


/* ============================================================
   8.8 KONTROLA NACTENI CLEAN VRSTVY
   ============================================================ */

SELECT
    (SELECT COUNT(*) FROM stg.Zakaznici) AS zakaznici,
    (SELECT COUNT(*) FROM stg.Predplatna) AS predplatna,
    (SELECT COUNT(*) FROM stg.Tarify) AS tarify,
    (SELECT COUNT(*) FROM stg.MesicniVyuziti) AS mesicni_vyuziti,
    (SELECT COUNT(*) FROM stg.Fakturace) AS fakturace,
    (SELECT COUNT(*) FROM stg.PripadyPodpory) AS pripady_podpory;

    
SELECT
    (SELECT COUNT(*) FROM clean.Zakaznici) AS zakaznici,
    (SELECT COUNT(*) FROM clean.Predplatna) AS predplatna,
    (SELECT COUNT(*) FROM clean.Tarify) AS tarify,
    (SELECT COUNT(*) FROM clean.MesicniVyuziti) AS mesicni_vyuziti,
    (SELECT COUNT(*) FROM clean.Fakturace) AS fakturace,
    (SELECT COUNT(*) FROM clean.PripadyPodpory) AS pripady_podpory;
