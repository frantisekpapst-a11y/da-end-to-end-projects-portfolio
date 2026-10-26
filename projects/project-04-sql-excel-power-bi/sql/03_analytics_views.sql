USE manufacturing_controlling;
GO

-- ============================================================
-- Skutečná spotřeba materiálu
-- Jeden řádek = zakázka × materiál
-- ============================================================

CREATE OR ALTER VIEW analytics.v_MaterialSkutecnost
AS
SELECT
    zakazka_id,
    material_id,
    SUM(mnozstvi) AS skutecne_mnozstvi,
    SUM(hodnota_spotreby) AS skutecny_naklad
FROM clean.MaterialoveVydeje
GROUP BY
    zakazka_id,
    material_id;
GO

-- ============================================================
-- Skutečné hodiny a mzdové náklady
-- Jeden řádek = výrobní zakázka
-- ============================================================

CREATE OR ALTER VIEW analytics.v_PraceSkutecnost
AS
SELECT
    zakazka_id,
    SUM(clovekohodiny) AS clovekohodiny_celkem,
    SUM(mzdovy_naklad) AS mzdovy_naklad_celkem,
    SUM(CASE WHEN druh_casu = N'Prace'
             THEN clovekohodiny ELSE 0 END) AS hodiny_prace,
    SUM(CASE WHEN druh_casu = N'Cekani'
             THEN clovekohodiny ELSE 0 END) AS hodiny_cekani,
    SUM(CASE WHEN druh_casu = N'Prace'
             THEN mzdovy_naklad ELSE 0 END) AS naklad_prace,
    SUM(CASE WHEN druh_casu = N'Cekani'
             THEN mzdovy_naklad ELSE 0 END) AS naklad_cekani
FROM clean.PracovniZaznamy
GROUP BY zakazka_id;
GO

-- ============================================================
-- Skutečná výrobní režie před uzávěrkovými úpravami
-- Jeden řádek = měsíc × středisko × kategorie režie
-- ============================================================

CREATE OR ALTER VIEW analytics.v_RezieSkutecnost
AS
SELECT
    DATEFROMPARTS(
        YEAR(datum_nakladu),
        MONTH(datum_nakladu),
        1
    ) AS mesic,
    stredisko_id,
    kategorie_rezie,
    SUM(castka) AS skutecny_naklad
FROM clean.VyrobniRezie
GROUP BY
    DATEFROMPARTS(
        YEAR(datum_nakladu),
        MONTH(datum_nakladu),
        1
    ),
    stredisko_id,
    kategorie_rezie;
GO

-- Kontrola obsahu vytvořených pohledů

SELECT TOP (5) *
FROM analytics.v_MaterialSkutecnost
ORDER BY zakazka_id, material_id;

SELECT TOP (5) *
FROM analytics.v_PraceSkutecnost
ORDER BY zakazka_id;

SELECT TOP (5) *
FROM analytics.v_RezieSkutecnost
ORDER BY mesic, stredisko_id, kategorie_rezie;