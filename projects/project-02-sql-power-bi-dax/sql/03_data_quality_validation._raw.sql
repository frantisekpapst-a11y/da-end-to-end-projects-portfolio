USE customer_retention_analytics;
GO

/* ============================================================
   5.1 MISSING VALUES

   Cíl:
   Ověřit chybějící hodnoty a rozlišit,
   zda jde o chybu, nebo očekávaný stav.
   ============================================================ */


/* ============================================================
   Tabulka: raw.Zakaznici

   Povinné:
   zakaznik_id
   region
   datum_registrace
   cas_nacteni
   ============================================================ */

SELECT
    SUM(CASE WHEN zakaznik_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_zakaznik_id,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END)
        AS chybejici_region,
    SUM(CASE WHEN datum_registrace IS NULL THEN 1 ELSE 0 END)
        AS chybejici_datum_registrace,
    SUM(CASE WHEN cas_nacteni IS NULL THEN 1 ELSE 0 END)
        AS chybejici_cas_nacteni
FROM raw.Zakaznici;


/* ============================================================
   Tabulka: raw.Predplatna

   Povinné:
   predplatne_id
   zakaznik_id
   tarif_id
   datum_zacatku
   cas_nacteni

   Podmíněné:
   datum_konce
   duvod_zruseni
   ============================================================ */

SELECT
    SUM(CASE WHEN predplatne_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_predplatne_id,
    SUM(CASE WHEN zakaznik_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_zakaznik_id,
    SUM(CASE WHEN tarif_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_tarif_id,
    SUM(CASE WHEN datum_zacatku IS NULL THEN 1 ELSE 0 END)
        AS chybejici_datum_zacatku,
    SUM(CASE WHEN cas_nacteni IS NULL THEN 1 ELSE 0 END)
        AS chybejici_cas_nacteni,
    SUM(
        CASE
            WHEN datum_konce IS NOT NULL
             AND duvod_zruseni IS NULL
            THEN 1
            ELSE 0
        END
    ) AS ukoncena_predplatna_bez_duvodu
FROM raw.Predplatna;


/* ============================================================
   Tabulka: raw.Tarify

   Povinné:
   tarif_id
   nazev_tarifu
   mesicni_cena
   cas_nacteni
   ============================================================ */

SELECT
    SUM(CASE WHEN tarif_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_tarif_id,
    SUM(CASE WHEN nazev_tarifu IS NULL THEN 1 ELSE 0 END)
        AS chybejici_nazev_tarifu,
    SUM(CASE WHEN mesicni_cena IS NULL THEN 1 ELSE 0 END)
        AS chybejici_mesicni_cena,
    SUM(CASE WHEN cas_nacteni IS NULL THEN 1 ELSE 0 END)
        AS chybejici_cas_nacteni
FROM raw.Tarify;


/* ============================================================
   Tabulka: raw.MesicniVyuziti

   Povinné:
   vyuziti_id
   predplatne_id
   mesic_vyuziti
   hodiny_sledovani
   aktivni_dny
   cas_nacteni
   ============================================================ */

SELECT
    SUM(CASE WHEN vyuziti_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_vyuziti_id,
    SUM(CASE WHEN predplatne_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_predplatne_id,
    SUM(CASE WHEN mesic_vyuziti IS NULL THEN 1 ELSE 0 END)
        AS chybejici_mesic_vyuziti,
    SUM(CASE WHEN hodiny_sledovani IS NULL THEN 1 ELSE 0 END)
        AS chybejici_hodiny_sledovani,
    SUM(CASE WHEN aktivni_dny IS NULL THEN 1 ELSE 0 END)
        AS chybejici_aktivni_dny,
    SUM(CASE WHEN cas_nacteni IS NULL THEN 1 ELSE 0 END)
        AS chybejici_cas_nacteni
FROM raw.MesicniVyuziti;


/* ============================================================
   Tabulka: raw.Fakturace

   Povinné:
   fakturace_id
   predplatne_id
   mesic_fakturace
   castka
   cas_nacteni
   ============================================================ */

SELECT
    SUM(CASE WHEN fakturace_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_fakturace_id,
    SUM(CASE WHEN predplatne_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_predplatne_id,
    SUM(CASE WHEN mesic_fakturace IS NULL THEN 1 ELSE 0 END)
        AS chybejici_mesic_fakturace,
    SUM(CASE WHEN castka IS NULL THEN 1 ELSE 0 END)
        AS chybejici_castka,
    SUM(CASE WHEN cas_nacteni IS NULL THEN 1 ELSE 0 END)
        AS chybejici_cas_nacteni
FROM raw.Fakturace;


/* ============================================================
   Tabulka: raw.PripadyPodpory

   Povinné:
   pripad_id
   zakaznik_id
   datum_vytvoreni
   kategorie_pripadu
   stav_pripadu
   cas_nacteni
   ============================================================ */

SELECT
    SUM(CASE WHEN pripad_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_pripad_id,
    SUM(CASE WHEN zakaznik_id IS NULL THEN 1 ELSE 0 END)
        AS chybejici_zakaznik_id,
    SUM(CASE WHEN datum_vytvoreni IS NULL THEN 1 ELSE 0 END)
        AS chybejici_datum_vytvoreni,
    SUM(CASE WHEN kategorie_pripadu IS NULL THEN 1 ELSE 0 END)
        AS chybejici_kategorie_pripadu,
    SUM(CASE WHEN stav_pripadu IS NULL THEN 1 ELSE 0 END)
        AS chybejici_stav_pripadu,
    SUM(CASE WHEN cas_nacteni IS NULL THEN 1 ELSE 0 END)
        AS chybejici_cas_nacteni
FROM raw.PripadyPodpory;


/* ============================================================
   5.2 DUPLICITY

   Část A:
   Kontrola full-row duplicit.

   cas_nacteni se nekontroluje,
   protože není součástí původních zdrojových dat.

   Pokud dotaz nevrátí žádný řádek:
   → full-row duplicity nebyly nalezeny.

   Pokud vrátí řádky:
   → hodnota pocet říká, kolikrát se daný celý řádek opakuje.
   ============================================================ */


SELECT
    COUNT(*) AS pocet
FROM raw.Zakaznici
GROUP BY
    zakaznik_id,
    region,
    datum_registrace
HAVING COUNT(*) > 1;


SELECT
    COUNT(*) AS pocet
FROM raw.Predplatna
GROUP BY
    predplatne_id,
    zakaznik_id,
    tarif_id,
    datum_zacatku,
    datum_konce,
    duvod_zruseni
HAVING COUNT(*) > 1;


SELECT
    COUNT(*) AS pocet
FROM raw.Tarify
GROUP BY
    tarif_id,
    nazev_tarifu,
    mesicni_cena
HAVING COUNT(*) > 1;


SELECT
    COUNT(*) AS pocet
FROM raw.MesicniVyuziti
GROUP BY
    vyuziti_id,
    predplatne_id,
    mesic_vyuziti,
    hodiny_sledovani,
    aktivni_dny
HAVING COUNT(*) > 1;


SELECT
    COUNT(*) AS pocet
FROM raw.Fakturace
GROUP BY
    fakturace_id,
    predplatne_id,
    mesic_fakturace,
    castka
HAVING COUNT(*) > 1;


SELECT
    COUNT(*) AS pocet
FROM raw.PripadyPodpory
GROUP BY
    pripad_id,
    zakaznik_id,
    datum_vytvoreni,
    kategorie_pripadu,
    stav_pripadu
HAVING COUNT(*) > 1;


/* ============================================================
   5.2 DUPLICITY

   Část B:
   Kontrola duplicit podle business key.
   ============================================================ */


SELECT
    zakaznik_id,
    COUNT(*) AS pocet
FROM raw.Zakaznici
GROUP BY zakaznik_id
HAVING COUNT(*) > 1;


SELECT
    predplatne_id,
    COUNT(*) AS pocet
FROM raw.Predplatna
GROUP BY predplatne_id
HAVING COUNT(*) > 1;


SELECT
    tarif_id,
    COUNT(*) AS pocet
FROM raw.Tarify
GROUP BY tarif_id
HAVING COUNT(*) > 1;


/* ============================================================
   Tabulka: raw.MesicniVyuziti

   Business key:
   predplatne_id + mesic_vyuziti
   ============================================================ */

SELECT
    predplatne_id,
    mesic_vyuziti,
    COUNT(*) AS pocet
FROM raw.MesicniVyuziti
GROUP BY
    predplatne_id,
    mesic_vyuziti
HAVING COUNT(*) > 1;


/* ============================================================
   Tabulka: raw.Fakturace

   Business key:
   predplatne_id + mesic_fakturace
   ============================================================ */

SELECT
    predplatne_id,
    mesic_fakturace,
    COUNT(*) AS pocet
FROM raw.Fakturace
GROUP BY
    predplatne_id,
    mesic_fakturace
HAVING COUNT(*) > 1;


SELECT
    pripad_id,
    COUNT(*) AS pocet
FROM raw.PripadyPodpory
GROUP BY pripad_id
HAVING COUNT(*) > 1;


/* ============================================================
   5.3 DATOVÉ TYPY

   Cíl:
   Ověřit datové typy sloupců a kompatibilitu
   klíčů mezi souvisejícími tabulkami.
   ============================================================ */

SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'raw'
ORDER BY
    TABLE_NAME,
    ORDINAL_POSITION;


/* ============================================================
   5.4 NEPLATNÉ HODNOTY

   Cíl:
   Ověřit hodnoty, které mají správný datový typ,
   ale nemusí odpovídat očekávaným hodnotám nebo rozsahům.
   ============================================================ */


/* ============================================================
   Tabulka: raw.Zakaznici
   ============================================================ */

SELECT DISTINCT
    region
FROM raw.Zakaznici
ORDER BY region;


/* ============================================================
   Tabulka: raw.Predplatna
   ============================================================ */

SELECT DISTINCT
    duvod_zruseni
FROM raw.Predplatna
ORDER BY duvod_zruseni;


/* ============================================================
   Tabulka: raw.Tarify
   ============================================================ */

SELECT *
FROM raw.Tarify
WHERE mesicni_cena <= 0;


/* ============================================================
   Tabulka: raw.MesicniVyuziti

   Pravidla:
   hodiny_sledovani >= 0
   aktivni_dny BETWEEN 0 AND 31
   ============================================================ */

SELECT *
FROM raw.MesicniVyuziti
WHERE hodiny_sledovani < 0
   OR aktivni_dny < 0
   OR aktivni_dny > 31;


/* ============================================================
   Tabulka: raw.Fakturace

   Pravidlo:
   castka musí být větší než 0
   ============================================================ */

SELECT *
FROM raw.Fakturace
WHERE castka <= 0;


/* ============================================================
   Tabulka: raw.PripadyPodpory
   ============================================================ */

SELECT DISTINCT
    kategorie_pripadu
FROM raw.PripadyPodpory
ORDER BY kategorie_pripadu;

SELECT DISTINCT
    stav_pripadu
FROM raw.PripadyPodpory
ORDER BY stav_pripadu;


/* ============================================================
   5.5 KLÍČE

   Cíl:
   Ověřit jedinečnost technických klíčů
   a business klíčů.
   ============================================================ */


/* ============================================================
   Tabulka: raw.MesicniVyuziti
   Technický klíč: vyuziti_id
   ============================================================ */

SELECT
    vyuziti_id,
    COUNT(*) AS pocet
FROM raw.MesicniVyuziti
GROUP BY vyuziti_id
HAVING COUNT(*) > 1;


/* ============================================================
   Tabulka: raw.Fakturace
   Technický klíč: fakturace_id
   ============================================================ */

SELECT
    fakturace_id,
    COUNT(*) AS pocet
FROM raw.Fakturace
GROUP BY fakturace_id
HAVING COUNT(*) > 1;


/* ============================================================
   5.6 REFERENČNÍ INTEGRITA

   Cíl:
   Ověřit, že hodnoty cizích klíčů
   odkazují na existující záznamy.
   ============================================================ */


/* ============================================================
   Predplatna.zakaznik_id
   → Zakaznici.zakaznik_id
   ============================================================ */

SELECT DISTINCT
    p.zakaznik_id
FROM raw.Predplatna p
LEFT JOIN raw.Zakaznici z
    ON p.zakaznik_id = z.zakaznik_id
WHERE z.zakaznik_id IS NULL;


/* ============================================================
   Predplatna.tarif_id
   → Tarify.tarif_id
   ============================================================ */

SELECT DISTINCT
    p.tarif_id
FROM raw.Predplatna p
LEFT JOIN raw.Tarify t
    ON p.tarif_id = t.tarif_id
WHERE t.tarif_id IS NULL;


/* ============================================================
   MesicniVyuziti.predplatne_id
   → Predplatna.predplatne_id
   ============================================================ */

SELECT DISTINCT
    mv.predplatne_id
FROM raw.MesicniVyuziti mv
LEFT JOIN raw.Predplatna p
    ON mv.predplatne_id = p.predplatne_id
WHERE p.predplatne_id IS NULL;


/* ============================================================
   Fakturace.predplatne_id
   → Predplatna.predplatne_id
   ============================================================ */

SELECT DISTINCT
    f.predplatne_id
FROM raw.Fakturace f
LEFT JOIN raw.Predplatna p
    ON f.predplatne_id = p.predplatne_id
WHERE p.predplatne_id IS NULL;


/* ============================================================
   PripadyPodpory.zakaznik_id
   → Zakaznici.zakaznik_id
   ============================================================ */

SELECT DISTINCT
    pp.zakaznik_id
FROM raw.PripadyPodpory pp
LEFT JOIN raw.Zakaznici z
    ON pp.zakaznik_id = z.zakaznik_id
WHERE z.zakaznik_id IS NULL;


/* ============================================================
   5.7 ČASOVÁ NÁVAZNOST

   Cíl:
   Ověřit správné pořadí událostí,
   návaznost časových údajů
   a očekávané období dat.
   ============================================================ */


/* ============================================================
   Tabulka: raw.Predplatna

   Pravidlo:
   datum_konce nesmí být před datum_zacatku
   ============================================================ */

SELECT *
FROM raw.Predplatna
WHERE datum_konce < datum_zacatku;


/* ============================================================
   Tabulky: raw.Zakaznici + raw.Predplatna

   Pravidlo:
   předplatné nesmí začít před registrací zákazníka
   ============================================================ */

SELECT
    p.predplatne_id,
    p.zakaznik_id,
    z.datum_registrace,
    p.datum_zacatku
FROM raw.Predplatna p
JOIN raw.Zakaznici z
    ON p.zakaznik_id = z.zakaznik_id
WHERE p.datum_zacatku < z.datum_registrace;


/* ============================================================
   Tabulky: raw.MesicniVyuziti + raw.Predplatna

   Pravidlo:
   měsíc využití se musí překrývat
   s aktivním obdobím předplatného
   ============================================================ */

SELECT
    mv.vyuziti_id,
    mv.predplatne_id,
    mv.mesic_vyuziti,
    p.datum_zacatku,
    p.datum_konce
FROM raw.MesicniVyuziti mv
JOIN raw.Predplatna p
    ON mv.predplatne_id = p.predplatne_id
WHERE EOMONTH(mv.mesic_vyuziti) < p.datum_zacatku
   OR (
        p.datum_konce IS NOT NULL
        AND mv.mesic_vyuziti > p.datum_konce
   );


/* ============================================================
   Tabulky: raw.Fakturace + raw.Predplatna

   Pravidlo:
   měsíc fakturace se musí překrývat
   s aktivním obdobím předplatného
   ============================================================ */

SELECT
    f.fakturace_id,
    f.predplatne_id,
    f.mesic_fakturace,
    p.datum_zacatku,
    p.datum_konce
FROM raw.Fakturace f
JOIN raw.Predplatna p
    ON f.predplatne_id = p.predplatne_id
WHERE EOMONTH(f.mesic_fakturace) < p.datum_zacatku
   OR (
        p.datum_konce IS NOT NULL
        AND f.mesic_fakturace > p.datum_konce
   );


/* ============================================================
   Tabulka: raw.MesicniVyuziti

   Pravidlo:
   aktivni_dny nesmí být vyšší než počet dní
   v konkrétním kalendářním měsíci
   ============================================================ */

SELECT *
FROM raw.MesicniVyuziti
WHERE aktivni_dny > DAY(EOMONTH(mesic_vyuziti));


/* ============================================================
   Tabulky: raw.PripadyPodpory + raw.Zakaznici

   Pravidlo:
   případ podpory nesmí vzniknout
   před registrací zákazníka
   ============================================================ */

SELECT
    pp.pripad_id,
    pp.zakaznik_id,
    pp.datum_vytvoreni,
    z.datum_registrace
FROM raw.PripadyPodpory pp
JOIN raw.Zakaznici z
    ON pp.zakaznik_id = z.zakaznik_id
WHERE pp.datum_vytvoreni < z.datum_registrace;


/* ============================================================
   Tabulka: raw.MesicniVyuziti

   Očekávané analytické období:
   2024-09 až 2026-08
   ============================================================ */

SELECT *
FROM raw.MesicniVyuziti
WHERE mesic_vyuziti < '2024-09-01'
   OR mesic_vyuziti > '2026-08-01';


/* ============================================================
   Tabulka: raw.Fakturace

   Očekávané analytické období:
   2024-09 až 2026-08
   ============================================================ */

SELECT *
FROM raw.Fakturace
WHERE mesic_fakturace < '2024-09-01'
   OR mesic_fakturace > '2026-08-01';


/* ============================================================
   5.8 BUSINESS RULES

   Cíl:
   Ověřit pravidla vycházející z fungování
   předplatitelské služby.
   ============================================================ */


/* ============================================================
   Pravidlo:
   Fakturovaná částka musí odpovídat
   měsíční ceně tarifu předplatného.
   ============================================================ */

SELECT
    f.fakturace_id,
    f.predplatne_id,
    f.castka,
    t.nazev_tarifu,
    t.mesicni_cena
FROM raw.Fakturace f
JOIN raw.Predplatna p
    ON f.predplatne_id = p.predplatne_id
JOIN raw.Tarify t
    ON p.tarif_id = t.tarif_id
WHERE f.castka <> t.mesicni_cena;


/* ============================================================
   Pravidlo:
   Aktivní předplatné nesmí mít důvod zrušení.
   ============================================================ */

SELECT *
FROM raw.Predplatna
WHERE datum_konce IS NULL
  AND duvod_zruseni IS NOT NULL;


/* ============================================================
   Pravidlo:
   Jeden zákazník nesmí mít dvě překrývající se
   období předplatného.

   Každé další předplatné musí začít až po skončení
   předchozího.
   ============================================================ */

WITH poradi_predplatnych AS (
    SELECT
        predplatne_id,
        zakaznik_id,
        datum_zacatku,
        datum_konce,

        LAG(datum_konce) OVER (
            PARTITION BY zakaznik_id
            ORDER BY datum_zacatku
        ) AS predchozi_datum_konce

    FROM raw.Predplatna
)

SELECT *
FROM poradi_predplatnych
WHERE predchozi_datum_konce IS NOT NULL
  AND datum_zacatku <= predchozi_datum_konce;


  /* ============================================================
   5.9 RECONCILIATION

   Cíl:
   Zachytit výchozí počty řádků v raw vrstvě.
   Po čištění budou tyto hodnoty porovnány
   s počty ve staging a clean vrstvě.
   ============================================================ */

/* ============================================================
   5.9 RECONCILIATION

   Cíl:
   Zachytit výchozí počty řádků v raw vrstvě.
   Po čištění budou tyto hodnoty porovnány
   s počty ve staging a clean vrstvě.
   ============================================================ */

SELECT
    (SELECT COUNT(*) FROM raw.Zakaznici) AS zakaznici,
    (SELECT COUNT(*) FROM raw.Predplatna) AS predplatna,
    (SELECT COUNT(*) FROM raw.Tarify) AS tarify,
    (SELECT COUNT(*) FROM raw.MesicniVyuziti) AS mesicni_vyuziti,
    (SELECT COUNT(*) FROM raw.Fakturace) AS fakturace,
    (SELECT COUNT(*) FROM raw.PripadyPodpory) AS pripady_podpory;


/* ============================================================
   5.10 AUDIT TRAIL

   Auditní stopa je v projektu zajištěna pomocí:
   - cas_nacteni v raw vrstvě
   - verzovaných SQL skriptů
   - evidence nalezených problémů
   - reconciliation před a po čištění

   Detailní výsledky budou doplněny po vytvoření
   staging a clean vrstvy.
   ============================================================ */


   /* ============================================================
   5.11 VALIDACE PŘED PUBLIKACÍ

   Technická validace:
   - povinné hodnoty
   - duplicity
   - datové typy
   - klíče
   - referenční integrita
   - časová návaznost

   Business validace:
   - business pravidla
   - reconciliation
   - vysvětlené odstraněné / upravené řádky

   Stav publikace:
   SUCCESS
   WARNING
   FAILED

   Finální kontrola bude provedena
   po vytvoření staging a clean vrstvy.
   ============================================================ */