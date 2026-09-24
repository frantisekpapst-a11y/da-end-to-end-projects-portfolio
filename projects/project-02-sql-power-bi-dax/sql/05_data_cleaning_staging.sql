USE customer_retention_analytics;
GO

/* ============================================================
   6.1 MISSING VALUES

   Úprava:
   U ukončených předplatných bez uvedeného důvodu
   nahradit NULL hodnotou 'Neuvedeno'.

   U aktivních předplatných zůstává duvod_zruseni NULL.
   ============================================================ */

UPDATE stg.Predplatna
SET duvod_zruseni = 'Neuvedeno'
WHERE datum_konce IS NOT NULL
  AND duvod_zruseni IS NULL;


/* ============================================================
   6.2 DUPLICITY

   Cíl:
   Odstranit potvrzené duplicity podle business klíče
   a zachovat vždy jeden záznam.
   ============================================================ */


/* ============================================================
   Tabulka: stg.MesicniVyuziti

   Business key:
   predplatne_id + mesic_vyuziti
   ============================================================ */

WITH duplicity AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY predplatne_id, mesic_vyuziti
            ORDER BY vyuziti_id
        ) AS rn
    FROM stg.MesicniVyuziti
)

DELETE FROM duplicity
WHERE rn > 1;


/* ============================================================
   Tabulka: stg.Fakturace

   Business key:
   predplatne_id + mesic_fakturace
   ============================================================ */

WITH duplicity AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY predplatne_id, mesic_fakturace
            ORDER BY fakturace_id
        ) AS rn
    FROM stg.Fakturace
)

DELETE FROM duplicity
WHERE rn > 1;


/* ============================================================
   6.3 DATOVÉ TYPY

   Výsledek:
   Datové typy v raw vrstvě byly vyhodnoceny jako správné.
   stg tabulky převzaly strukturu z raw vrstvy.

   Žádná úprava není potřeba.
   ============================================================ */


   /* ============================================================
   6.4 NEPLATNÉ HODNOTY

   Cíl:
   Sjednotit potvrzené textové hodnoty
   a řádky s hodnotami, které nelze
   spolehlivě opravit, uložit do jiné tabulky.
   ============================================================ */


/* ============================================================
   Tabulka: stg.Zakaznici
   Sjednocení regionů
   ============================================================ */

UPDATE stg.Zakaznici
SET region =
    CASE LOWER(TRIM(region))
        WHEN 'central bohemia' THEN 'Central Bohemia'
        WHEN 'moravian-silesian' THEN 'Moravian-Silesian'
        WHEN 'other' THEN 'Other'
        WHEN 'prague' THEN 'Prague'
        WHEN 'south moravia' THEN 'South Moravia'
        ELSE TRIM(region)
    END;


/* ============================================================
   Tabulka: stg.Predplatna
   Sjednocení důvodů zrušení
   ============================================================ */

UPDATE stg.Predplatna
SET duvod_zruseni =
    CASE LOWER(TRIM(duvod_zruseni))
        WHEN 'price' THEN 'Price'
        WHEN 'low usage' THEN 'Low Usage'
        WHEN 'technical issues' THEN 'Technical Issues'
        WHEN 'competitor' THEN 'Competitor'
        WHEN 'content selection' THEN 'Content Selection'
        WHEN 'moving' THEN 'Moving'
        WHEN 'other' THEN 'Other'
        WHEN 'neuvedeno' THEN 'Neuvedeno'
        ELSE TRIM(duvod_zruseni)
    END;


/* ============================================================
   Tabulka: stg.PripadyPodpory
   Sjednocení kategorií podpory
   ============================================================ */

UPDATE stg.PripadyPodpory
SET kategorie_pripadu =
    CASE LOWER(TRIM(kategorie_pripadu))
        WHEN 'technical' THEN 'Technical'
        WHEN 'billing' THEN 'Billing'
        WHEN 'content' THEN 'Content'
        WHEN 'account' THEN 'Account'
        WHEN 'other' THEN 'Other'
        ELSE TRIM(kategorie_pripadu)
    END;


/* ============================================================
   Tabulka: stg.MesicniVyuziti

   Neplatné hodnoty nelze spolehlivě opravit.
   Problematicé řádky budou zachovány pro kontrolu
   a vyřazeny z hlavní staging tabulky.
   ============================================================ */

DROP TABLE IF EXISTS stg.MesicniVyuziti_Vyrazene;


SELECT *
INTO stg.MesicniVyuziti_Vyrazene
FROM stg.MesicniVyuziti
WHERE hodiny_sledovani < 0
   OR aktivni_dny < 0
   OR aktivni_dny > 31;


DELETE FROM stg.MesicniVyuziti
WHERE hodiny_sledovani < 0
   OR aktivni_dny < 0
   OR aktivni_dny > 31;


/* ============================================================
   6.5 KLÍČE

   Výsledek:
   Technická ID byla v raw vrstvě unikátní.
   Duplicity business klíčů byly odstraněny v části 6.2.

   Ve staging vrstvě zatím nevytváříme PK, FK ani UNIQUE.
   Omezení budou nastavena až v clean vrstvě.
   ============================================================ */


/* ============================================================
   6.6 REFERENČNÍ INTEGRITA

   Výsledek:
   V raw vrstvě nebyly nalezeny žádné porušené vazby
   mezi tabulkami.

   Dosavadní čištění ve staging vrstvě nevytváří
   nové problémy referenční integrity.

   Žádná úprava není potřeba.
   ============================================================ */


   /* ============================================================
   6.7 ČASOVÁ NÁVAZNOST

   Výsledek:
   Měsíční využití odpovídá období platnosti předplatného.
   Nebyly nalezeny záznamy mimo dobu trvání předplatného.

   Žádná úprava není potřeba.
   ============================================================ */


   /* ============================================================
   6.8 BUSINESS RULES

   Cíl:
   Opravit fakturovanou částku tak, aby odpovídala
   měsíční ceně příslušného tarifu.
   ============================================================ */

UPDATE f
SET f.castka = t.mesicni_cena
FROM stg.Fakturace f
JOIN stg.Predplatna p
    ON f.predplatne_id = p.predplatne_id
JOIN stg.Tarify t
    ON p.tarif_id = t.tarif_id
WHERE f.castka <> t.mesicni_cena;