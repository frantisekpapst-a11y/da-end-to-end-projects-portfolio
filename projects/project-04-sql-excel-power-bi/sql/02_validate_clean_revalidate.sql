-- ============================================================
-- Validace dat
-- ============================================================
--
-- ============================================================
-- Část 1: Chybějící hodnoty ve všech 16 tabulkách schématu raw
-- ============================================================
--
-- Povinné údaje: identifikace, klasifikace, data, množství,
-- částky a původ dat.
-- Volitelné sloupce: platnost_do, souvisejici_polozka_id,
-- poznamka, popis a odkazy prostoj_id v jiných tabulkách.
-- V tabulce Prostoje je samotný identifikátor prostoj_id povinný.
-- Datum dokončení je povinné, protože tento export obsahuje
-- pouze dokončené výrobní zakázky.
-- Nula se nepovažuje za chybějící hodnotu.
-- Řádky s požadavkem „Povinný“ a nenulovým počtem chybějících
-- hodnot vyžadují prověření.
-- U volitelných údajů není NULL sám o sobě chybou.

USE manufacturing_controlling;
GO

SELECT N'Vyrobky' AS tabulka, N'vyrobek_id' AS sloupec,
       N'Povinný' AS pozadavek,
       COUNT(*) - COUNT(NULLIF(TRIM([vyrobek_id]), N'')) AS pocet_chybejicich
FROM raw.Vyrobky
UNION ALL
SELECT N'Vyrobky', N'nazev_vyrobku', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([nazev_vyrobku]), N''))
FROM raw.Vyrobky
UNION ALL
SELECT N'Vyrobky', N'skupina_vyrobku', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([skupina_vyrobku]), N''))
FROM raw.Vyrobky
UNION ALL
SELECT N'Vyrobky', N'merna_jednotka', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([merna_jednotka]), N''))
FROM raw.Vyrobky
UNION ALL
SELECT N'Vyrobky', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.Vyrobky
UNION ALL
SELECT N'Vyrobky', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.Vyrobky
UNION ALL
SELECT N'Materialy', N'material_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([material_id]), N''))
FROM raw.Materialy
UNION ALL
SELECT N'Materialy', N'nazev_materialu', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([nazev_materialu]), N''))
FROM raw.Materialy
UNION ALL
SELECT N'Materialy', N'skupina_materialu', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([skupina_materialu]), N''))
FROM raw.Materialy
UNION ALL
SELECT N'Materialy', N'merna_jednotka', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([merna_jednotka]), N''))
FROM raw.Materialy
UNION ALL
SELECT N'Materialy', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.Materialy
UNION ALL
SELECT N'Materialy', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.Materialy
UNION ALL
SELECT N'Strediska', N'stredisko_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stredisko_id]), N''))
FROM raw.Strediska
UNION ALL
SELECT N'Strediska', N'nazev_strediska', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([nazev_strediska]), N''))
FROM raw.Strediska
UNION ALL
SELECT N'Strediska', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.Strediska
UNION ALL
SELECT N'Strediska', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.Strediska
UNION ALL
SELECT N'Stroje', N'stroj_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stroj_id]), N''))
FROM raw.Stroje
UNION ALL
SELECT N'Stroje', N'nazev_stroje', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([nazev_stroje]), N''))
FROM raw.Stroje
UNION ALL
SELECT N'Stroje', N'stredisko_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stredisko_id]), N''))
FROM raw.Stroje
UNION ALL
SELECT N'Stroje', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.Stroje
UNION ALL
SELECT N'Stroje', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.Stroje
UNION ALL
SELECT N'VyrobniZakazky', N'zakazka_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zakazka_id]), N''))
FROM raw.VyrobniZakazky
UNION ALL
SELECT N'VyrobniZakazky', N'vyrobek_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([vyrobek_id]), N''))
FROM raw.VyrobniZakazky
UNION ALL
SELECT N'VyrobniZakazky', N'stredisko_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stredisko_id]), N''))
FROM raw.VyrobniZakazky
UNION ALL
SELECT N'VyrobniZakazky', N'datum_zahajeni', N'Povinný',
       COUNT(*) - COUNT([datum_zahajeni])
FROM raw.VyrobniZakazky
UNION ALL
SELECT N'VyrobniZakazky', N'datum_dokonceni', N'Povinný',
       COUNT(*) - COUNT([datum_dokonceni])
FROM raw.VyrobniZakazky
UNION ALL
SELECT N'VyrobniZakazky', N'stav_zakazky', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stav_zakazky]), N''))
FROM raw.VyrobniZakazky
UNION ALL
SELECT N'VyrobniZakazky', N'dobre_kusy', N'Povinný',
       COUNT(*) - COUNT([dobre_kusy])
FROM raw.VyrobniZakazky
UNION ALL
SELECT N'VyrobniZakazky', N'zmetkove_kusy', N'Povinný',
       COUNT(*) - COUNT([zmetkove_kusy])
FROM raw.VyrobniZakazky
UNION ALL
SELECT N'VyrobniZakazky', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.VyrobniZakazky
UNION ALL
SELECT N'VyrobniZakazky', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.VyrobniZakazky
UNION ALL
SELECT N'MaterialoveVydeje', N'vydej_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([vydej_id]), N''))
FROM raw.MaterialoveVydeje
UNION ALL
SELECT N'MaterialoveVydeje', N'zakazka_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zakazka_id]), N''))
FROM raw.MaterialoveVydeje
UNION ALL
SELECT N'MaterialoveVydeje', N'material_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([material_id]), N''))
FROM raw.MaterialoveVydeje
UNION ALL
SELECT N'MaterialoveVydeje', N'datum_vydeje', N'Povinný',
       COUNT(*) - COUNT([datum_vydeje])
FROM raw.MaterialoveVydeje
UNION ALL
SELECT N'MaterialoveVydeje', N'mnozstvi', N'Povinný',
       COUNT(*) - COUNT([mnozstvi])
FROM raw.MaterialoveVydeje
UNION ALL
SELECT N'MaterialoveVydeje', N'hodnota_spotreby', N'Povinný',
       COUNT(*) - COUNT([hodnota_spotreby])
FROM raw.MaterialoveVydeje
UNION ALL
SELECT N'MaterialoveVydeje', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.MaterialoveVydeje
UNION ALL
SELECT N'MaterialoveVydeje', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.MaterialoveVydeje
UNION ALL
SELECT N'PracovniZaznamy', N'zaznam_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zaznam_id]), N''))
FROM raw.PracovniZaznamy
UNION ALL
SELECT N'PracovniZaznamy', N'zakazka_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zakazka_id]), N''))
FROM raw.PracovniZaznamy
UNION ALL
SELECT N'PracovniZaznamy', N'datum_prace', N'Povinný',
       COUNT(*) - COUNT([datum_prace])
FROM raw.PracovniZaznamy
UNION ALL
SELECT N'PracovniZaznamy', N'druh_casu', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([druh_casu]), N''))
FROM raw.PracovniZaznamy
UNION ALL
SELECT N'PracovniZaznamy', N'clovekohodiny', N'Povinný',
       COUNT(*) - COUNT([clovekohodiny])
FROM raw.PracovniZaznamy
UNION ALL
SELECT N'PracovniZaznamy', N'mzdovy_naklad', N'Povinný',
       COUNT(*) - COUNT([mzdovy_naklad])
FROM raw.PracovniZaznamy
UNION ALL
SELECT N'PracovniZaznamy', N'prostoj_id', N'Volitelný',
       COUNT(*) - COUNT(NULLIF(TRIM([prostoj_id]), N''))
FROM raw.PracovniZaznamy
UNION ALL
SELECT N'PracovniZaznamy', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.PracovniZaznamy
UNION ALL
SELECT N'PracovniZaznamy', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.PracovniZaznamy
UNION ALL
SELECT N'VyrobniRezie', N'polozka_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([polozka_id]), N''))
FROM raw.VyrobniRezie
UNION ALL
SELECT N'VyrobniRezie', N'datum_nakladu', N'Povinný',
       COUNT(*) - COUNT([datum_nakladu])
FROM raw.VyrobniRezie
UNION ALL
SELECT N'VyrobniRezie', N'stredisko_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stredisko_id]), N''))
FROM raw.VyrobniRezie
UNION ALL
SELECT N'VyrobniRezie', N'kategorie_rezie', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([kategorie_rezie]), N''))
FROM raw.VyrobniRezie
UNION ALL
SELECT N'VyrobniRezie', N'popis', N'Volitelný',
       COUNT(*) - COUNT(NULLIF(TRIM([popis]), N''))
FROM raw.VyrobniRezie
UNION ALL
SELECT N'VyrobniRezie', N'castka', N'Povinný',
       COUNT(*) - COUNT([castka])
FROM raw.VyrobniRezie
UNION ALL
SELECT N'VyrobniRezie', N'prostoj_id', N'Volitelný',
       COUNT(*) - COUNT(NULLIF(TRIM([prostoj_id]), N''))
FROM raw.VyrobniRezie
UNION ALL
SELECT N'VyrobniRezie', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.VyrobniRezie
UNION ALL
SELECT N'VyrobniRezie', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.VyrobniRezie
UNION ALL
SELECT N'ProvozStroju', N'provoz_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([provoz_id]), N''))
FROM raw.ProvozStroju
UNION ALL
SELECT N'ProvozStroju', N'datum', N'Povinný',
       COUNT(*) - COUNT([datum])
FROM raw.ProvozStroju
UNION ALL
SELECT N'ProvozStroju', N'smena', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([smena]), N''))
FROM raw.ProvozStroju
UNION ALL
SELECT N'ProvozStroju', N'stroj_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stroj_id]), N''))
FROM raw.ProvozStroju
UNION ALL
SELECT N'ProvozStroju', N'vyrobek_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([vyrobek_id]), N''))
FROM raw.ProvozStroju
UNION ALL
SELECT N'ProvozStroju', N'dobre_kusy', N'Povinný',
       COUNT(*) - COUNT([dobre_kusy])
FROM raw.ProvozStroju
UNION ALL
SELECT N'ProvozStroju', N'zmetkove_kusy', N'Povinný',
       COUNT(*) - COUNT([zmetkove_kusy])
FROM raw.ProvozStroju
UNION ALL
SELECT N'ProvozStroju', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.ProvozStroju
UNION ALL
SELECT N'ProvozStroju', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.ProvozStroju
UNION ALL
SELECT N'Prostoje', N'prostoj_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([prostoj_id]), N''))
FROM raw.Prostoje
UNION ALL
SELECT N'Prostoje', N'stroj_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stroj_id]), N''))
FROM raw.Prostoje
UNION ALL
SELECT N'Prostoje', N'zakazka_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zakazka_id]), N''))
FROM raw.Prostoje
UNION ALL
SELECT N'Prostoje', N'datum', N'Povinný',
       COUNT(*) - COUNT([datum])
FROM raw.Prostoje
UNION ALL
SELECT N'Prostoje', N'smena', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([smena]), N''))
FROM raw.Prostoje
UNION ALL
SELECT N'Prostoje', N'duvod_prostoje', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([duvod_prostoje]), N''))
FROM raw.Prostoje
UNION ALL
SELECT N'Prostoje', N'popis', N'Volitelný',
       COUNT(*) - COUNT(NULLIF(TRIM([popis]), N''))
FROM raw.Prostoje
UNION ALL
SELECT N'Prostoje', N'delka_prostoje_h', N'Povinný',
       COUNT(*) - COUNT([delka_prostoje_h])
FROM raw.Prostoje
UNION ALL
SELECT N'Prostoje', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.Prostoje
UNION ALL
SELECT N'Prostoje', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.Prostoje
UNION ALL
SELECT N'StavyZasob', N'stav_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stav_id]), N''))
FROM raw.StavyZasob
UNION ALL
SELECT N'StavyZasob', N'datum_stavu', N'Povinný',
       COUNT(*) - COUNT([datum_stavu])
FROM raw.StavyZasob
UNION ALL
SELECT N'StavyZasob', N'stredisko_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stredisko_id]), N''))
FROM raw.StavyZasob
UNION ALL
SELECT N'StavyZasob', N'kategorie_zasob', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([kategorie_zasob]), N''))
FROM raw.StavyZasob
UNION ALL
SELECT N'StavyZasob', N'hodnota_zasob', N'Povinný',
       COUNT(*) - COUNT([hodnota_zasob])
FROM raw.StavyZasob
UNION ALL
SELECT N'StavyZasob', N'poznamka', N'Volitelný',
       COUNT(*) - COUNT(NULLIF(TRIM([poznamka]), N''))
FROM raw.StavyZasob
UNION ALL
SELECT N'StavyZasob', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.StavyZasob
UNION ALL
SELECT N'StavyZasob', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.StavyZasob
UNION ALL
SELECT N'MaterialoveNormy', N'norma_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([norma_id]), N''))
FROM raw.MaterialoveNormy
UNION ALL
SELECT N'MaterialoveNormy', N'vyrobek_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([vyrobek_id]), N''))
FROM raw.MaterialoveNormy
UNION ALL
SELECT N'MaterialoveNormy', N'material_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([material_id]), N''))
FROM raw.MaterialoveNormy
UNION ALL
SELECT N'MaterialoveNormy', N'platnost_od', N'Povinný',
       COUNT(*) - COUNT([platnost_od])
FROM raw.MaterialoveNormy
UNION ALL
SELECT N'MaterialoveNormy', N'platnost_do', N'Volitelný',
       COUNT(*) - COUNT([platnost_do])
FROM raw.MaterialoveNormy
UNION ALL
SELECT N'MaterialoveNormy', N'mnozstvi_na_dobry_kus', N'Povinný',
       COUNT(*) - COUNT([mnozstvi_na_dobry_kus])
FROM raw.MaterialoveNormy
UNION ALL
SELECT N'MaterialoveNormy', N'planovana_cena_za_jednotku', N'Povinný',
       COUNT(*) - COUNT([planovana_cena_za_jednotku])
FROM raw.MaterialoveNormy
UNION ALL
SELECT N'MaterialoveNormy', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.MaterialoveNormy
UNION ALL
SELECT N'MaterialoveNormy', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.MaterialoveNormy
UNION ALL
SELECT N'VyrobniNormy', N'norma_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([norma_id]), N''))
FROM raw.VyrobniNormy
UNION ALL
SELECT N'VyrobniNormy', N'vyrobek_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([vyrobek_id]), N''))
FROM raw.VyrobniNormy
UNION ALL
SELECT N'VyrobniNormy', N'stredisko_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stredisko_id]), N''))
FROM raw.VyrobniNormy
UNION ALL
SELECT N'VyrobniNormy', N'stroj_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stroj_id]), N''))
FROM raw.VyrobniNormy
UNION ALL
SELECT N'VyrobniNormy', N'platnost_od', N'Povinný',
       COUNT(*) - COUNT([platnost_od])
FROM raw.VyrobniNormy
UNION ALL
SELECT N'VyrobniNormy', N'platnost_do', N'Volitelný',
       COUNT(*) - COUNT([platnost_do])
FROM raw.VyrobniNormy
UNION ALL
SELECT N'VyrobniNormy', N'clovekohodiny_na_dobry_kus', N'Povinný',
       COUNT(*) - COUNT([clovekohodiny_na_dobry_kus])
FROM raw.VyrobniNormy
UNION ALL
SELECT N'VyrobniNormy', N'strojove_hodiny_na_dobry_kus', N'Povinný',
       COUNT(*) - COUNT([strojove_hodiny_na_dobry_kus])
FROM raw.VyrobniNormy
UNION ALL
SELECT N'VyrobniNormy', N'planovana_mzdova_sazba', N'Povinný',
       COUNT(*) - COUNT([planovana_mzdova_sazba])
FROM raw.VyrobniNormy
UNION ALL
SELECT N'VyrobniNormy', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.VyrobniNormy
UNION ALL
SELECT N'VyrobniNormy', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.VyrobniNormy
UNION ALL
SELECT N'PlanVyroby', N'plan_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([plan_id]), N''))
FROM raw.PlanVyroby
UNION ALL
SELECT N'PlanVyroby', N'mesic', N'Povinný',
       COUNT(*) - COUNT([mesic])
FROM raw.PlanVyroby
UNION ALL
SELECT N'PlanVyroby', N'vyrobek_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([vyrobek_id]), N''))
FROM raw.PlanVyroby
UNION ALL
SELECT N'PlanVyroby', N'stredisko_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stredisko_id]), N''))
FROM raw.PlanVyroby
UNION ALL
SELECT N'PlanVyroby', N'planovane_dobre_kusy', N'Povinný',
       COUNT(*) - COUNT([planovane_dobre_kusy])
FROM raw.PlanVyroby
UNION ALL
SELECT N'PlanVyroby', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.PlanVyroby
UNION ALL
SELECT N'PlanVyroby', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.PlanVyroby
UNION ALL
SELECT N'RozpocetRezie', N'rozpocet_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([rozpocet_id]), N''))
FROM raw.RozpocetRezie
UNION ALL
SELECT N'RozpocetRezie', N'mesic', N'Povinný',
       COUNT(*) - COUNT([mesic])
FROM raw.RozpocetRezie
UNION ALL
SELECT N'RozpocetRezie', N'stredisko_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stredisko_id]), N''))
FROM raw.RozpocetRezie
UNION ALL
SELECT N'RozpocetRezie', N'kategorie_rezie', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([kategorie_rezie]), N''))
FROM raw.RozpocetRezie
UNION ALL
SELECT N'RozpocetRezie', N'planovana_fixni_cast', N'Povinný',
       COUNT(*) - COUNT([planovana_fixni_cast])
FROM raw.RozpocetRezie
UNION ALL
SELECT N'RozpocetRezie', N'variabilni_sazba_na_strojohodinu', N'Povinný',
       COUNT(*) - COUNT([variabilni_sazba_na_strojohodinu])
FROM raw.RozpocetRezie
UNION ALL
SELECT N'RozpocetRezie', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.RozpocetRezie
UNION ALL
SELECT N'RozpocetRezie', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.RozpocetRezie
UNION ALL
SELECT N'UzaverkoveUpravy', N'uprava_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([uprava_id]), N''))
FROM raw.UzaverkoveUpravy
UNION ALL
SELECT N'UzaverkoveUpravy', N'mesic', N'Povinný',
       COUNT(*) - COUNT([mesic])
FROM raw.UzaverkoveUpravy
UNION ALL
SELECT N'UzaverkoveUpravy', N'stredisko_id', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([stredisko_id]), N''))
FROM raw.UzaverkoveUpravy
UNION ALL
SELECT N'UzaverkoveUpravy', N'kategorie_rezie', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([kategorie_rezie]), N''))
FROM raw.UzaverkoveUpravy
UNION ALL
SELECT N'UzaverkoveUpravy', N'souvisejici_polozka_id', N'Volitelný',
       COUNT(*) - COUNT(NULLIF(TRIM([souvisejici_polozka_id]), N''))
FROM raw.UzaverkoveUpravy
UNION ALL
SELECT N'UzaverkoveUpravy', N'prostoj_id', N'Volitelný',
       COUNT(*) - COUNT(NULLIF(TRIM([prostoj_id]), N''))
FROM raw.UzaverkoveUpravy
UNION ALL
SELECT N'UzaverkoveUpravy', N'typ_upravy', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([typ_upravy]), N''))
FROM raw.UzaverkoveUpravy
UNION ALL
SELECT N'UzaverkoveUpravy', N'popis', N'Volitelný',
       COUNT(*) - COUNT(NULLIF(TRIM([popis]), N''))
FROM raw.UzaverkoveUpravy
UNION ALL
SELECT N'UzaverkoveUpravy', N'castka_upravy', N'Povinný',
       COUNT(*) - COUNT([castka_upravy])
FROM raw.UzaverkoveUpravy
UNION ALL
SELECT N'UzaverkoveUpravy', N'zdrojovy_soubor', N'Povinný',
       COUNT(*) - COUNT(NULLIF(TRIM([zdrojovy_soubor]), N''))
FROM raw.UzaverkoveUpravy
UNION ALL
SELECT N'UzaverkoveUpravy', N'cas_nacteni', N'Povinný',
       COUNT(*) - COUNT([cas_nacteni])
FROM raw.UzaverkoveUpravy

ORDER BY pozadavek, pocet_chybejicich DESC, tabulka, sloupec;
GO

-- Detail výdeje s chybějícím množstvím
SELECT *
FROM raw.MaterialoveVydeje
WHERE mnozstvi IS NULL;

-- ============================================================
-- Část 2: Duplicity a jednoznačnost ID
-- ============================================================

SELECT
    N'Vyrobky' AS tabulka,
    vyrobek_id AS id,
    COUNT(*) AS pocet_vyskytu
FROM raw.Vyrobky
GROUP BY vyrobek_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'Materialy', material_id, COUNT(*)
FROM raw.Materialy
GROUP BY material_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'Strediska', stredisko_id, COUNT(*)
FROM raw.Strediska
GROUP BY stredisko_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'Stroje', stroj_id, COUNT(*)
FROM raw.Stroje
GROUP BY stroj_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'VyrobniZakazky', zakazka_id, COUNT(*)
FROM raw.VyrobniZakazky
GROUP BY zakazka_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'MaterialoveVydeje', vydej_id, COUNT(*)
FROM raw.MaterialoveVydeje
GROUP BY vydej_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'PracovniZaznamy', zaznam_id, COUNT(*)
FROM raw.PracovniZaznamy
GROUP BY zaznam_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'VyrobniRezie', polozka_id, COUNT(*)
FROM raw.VyrobniRezie
GROUP BY polozka_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'ProvozStroju', provoz_id, COUNT(*)
FROM raw.ProvozStroju
GROUP BY provoz_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'Prostoje', prostoj_id, COUNT(*)
FROM raw.Prostoje
GROUP BY prostoj_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'StavyZasob', stav_id, COUNT(*)
FROM raw.StavyZasob
GROUP BY stav_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'MaterialoveNormy', norma_id, COUNT(*)
FROM raw.MaterialoveNormy
GROUP BY norma_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'VyrobniNormy', norma_id, COUNT(*)
FROM raw.VyrobniNormy
GROUP BY norma_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'PlanVyroby', plan_id, COUNT(*)
FROM raw.PlanVyroby
GROUP BY plan_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'RozpocetRezie', rozpocet_id, COUNT(*)
FROM raw.RozpocetRezie
GROUP BY rozpocet_id
HAVING COUNT(*) > 1
UNION ALL
SELECT N'UzaverkoveUpravy', uprava_id, COUNT(*)
FROM raw.UzaverkoveUpravy
GROUP BY uprava_id
HAVING COUNT(*) > 1

ORDER BY tabulka, id;
GO

-- Detail opakovaného materiálového výdeje
SELECT *
FROM raw.MaterialoveVydeje
WHERE vydej_id = 'V04P02072';

-- Detail opakované režijní položky
SELECT *
FROM raw.VyrobniRezie
WHERE polozka_id = 'RE04C02Poj';

-- ============================================================
-- Část 3: Kontrola datových typů
-- ============================================================

SELECT
    TABLE_NAME AS tabulka,
    COLUMN_NAME AS sloupec,
    DATA_TYPE AS datovy_typ,
    CHARACTER_MAXIMUM_LENGTH AS maximalni_delka,
    NUMERIC_PRECISION AS celkovy_pocet_cislic,
    NUMERIC_SCALE AS desetinna_mista
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'raw'
ORDER BY TABLE_NAME, ORDINAL_POSITION;

-- ============================================================
-- Část 4: Platnost hodnot a business pravidla
-- ============================================================

SELECT
    N'MaterialoveVydeje' AS tabulka,
    COUNT(*) AS pocet_podezrelych_radku
FROM raw.MaterialoveVydeje
WHERE mnozstvi <= 0
   OR hodnota_spotreby < 0
UNION ALL
SELECT N'PracovniZaznamy', COUNT(*)
FROM raw.PracovniZaznamy
WHERE clovekohodiny <= 0
   OR mzdovy_naklad < 0
UNION ALL
SELECT N'VyrobniZakazky', COUNT(*)
FROM raw.VyrobniZakazky
WHERE dobre_kusy < 0
   OR zmetkove_kusy < 0
UNION ALL
SELECT N'ProvozStroju', COUNT(*)
FROM raw.ProvozStroju
WHERE dobre_kusy < 0
   OR zmetkove_kusy < 0
UNION ALL
SELECT N'Prostoje', COUNT(*)
FROM raw.Prostoje
WHERE delka_prostoje_h <= 0
UNION ALL
SELECT N'StavyZasob', COUNT(*)
FROM raw.StavyZasob
WHERE hodnota_zasob < 0
UNION ALL
SELECT N'MaterialoveNormy', COUNT(*)
FROM raw.MaterialoveNormy
WHERE mnozstvi_na_dobry_kus <= 0
   OR planovana_cena_za_jednotku <= 0
UNION ALL
SELECT N'VyrobniNormy', COUNT(*)
FROM raw.VyrobniNormy
WHERE clovekohodiny_na_dobry_kus <= 0
   OR strojove_hodiny_na_dobry_kus <= 0
   OR planovana_mzdova_sazba <= 0
UNION ALL
SELECT N'PlanVyroby', COUNT(*)
FROM raw.PlanVyroby
WHERE planovane_dobre_kusy < 0
UNION ALL
SELECT N'RozpocetRezie', COUNT(*)
FROM raw.RozpocetRezie
WHERE planovana_fixni_cast < 0
   OR variabilni_sazba_na_strojohodinu < 0
UNION ALL
SELECT N'VyrobniRezie', COUNT(*)
FROM raw.VyrobniRezie
WHERE castka < 0

ORDER BY tabulka;
GO

-- ============================================================
-- 4.2: Přehled textových kategorií
-- ============================================================

SELECT DISTINCT skupina_vyrobku
FROM raw.Vyrobky;

SELECT DISTINCT merna_jednotka
FROM raw.Vyrobky;

SELECT DISTINCT skupina_materialu
FROM raw.Materialy;

SELECT DISTINCT merna_jednotka
FROM raw.Materialy;

SELECT DISTINCT stav_zakazky
FROM raw.VyrobniZakazky;

SELECT DISTINCT druh_casu
FROM raw.PracovniZaznamy;

SELECT DISTINCT kategorie_rezie
FROM raw.VyrobniRezie;

SELECT DISTINCT smena
FROM raw.ProvozStroju;

SELECT DISTINCT smena
FROM raw.Prostoje;

SELECT DISTINCT duvod_prostoje
FROM raw.Prostoje;

SELECT DISTINCT kategorie_zasob
FROM raw.StavyZasob;

SELECT DISTINCT kategorie_rezie
FROM raw.RozpocetRezie;

SELECT DISTINCT kategorie_rezie
FROM raw.UzaverkoveUpravy;

SELECT DISTINCT typ_upravy
FROM raw.UzaverkoveUpravy;
GO

-- ============================================================
-- 4.3: Vztahy mezi hodnotami
-- ============================================================

SELECT
    N'Dokončení zakázky před zahájením' AS kontrola,
    COUNT(*) AS pocet_problemu
FROM raw.VyrobniZakazky
WHERE datum_dokonceni < datum_zahajeni
UNION ALL
SELECT N'Konec materiálové normy před začátkem', COUNT(*)
FROM raw.MaterialoveNormy
WHERE platnost_do < platnost_od
UNION ALL
SELECT N'Konec výrobní normy před začátkem', COUNT(*)
FROM raw.VyrobniNormy
WHERE platnost_do < platnost_od

ORDER BY kontrola;
GO

-- ============================================================
-- Část 5: Referenční integrita
-- ============================================================

SELECT
    N'Stroj bez existujícího střediska' AS kontrola,
    COUNT(*) AS pocet_problemu
FROM raw.Stroje AS t
LEFT JOIN raw.Strediska AS s
    ON t.stredisko_id = s.stredisko_id
WHERE s.stredisko_id IS NULL
UNION ALL
SELECT N'Zakázka bez existujícího výrobku', COUNT(*)
FROM raw.VyrobniZakazky AS z
LEFT JOIN raw.Vyrobky AS v
    ON z.vyrobek_id = v.vyrobek_id
WHERE v.vyrobek_id IS NULL
UNION ALL
SELECT N'Zakázka bez existujícího střediska', COUNT(*)
FROM raw.VyrobniZakazky AS z
LEFT JOIN raw.Strediska AS s
    ON z.stredisko_id = s.stredisko_id
WHERE s.stredisko_id IS NULL
UNION ALL
SELECT N'Výdej bez existující zakázky', COUNT(*)
FROM raw.MaterialoveVydeje AS v
LEFT JOIN raw.VyrobniZakazky AS z
    ON v.zakazka_id = z.zakazka_id
WHERE z.zakazka_id IS NULL
UNION ALL
SELECT N'Výdej bez existujícího materiálu', COUNT(*)
FROM raw.MaterialoveVydeje AS v
LEFT JOIN raw.Materialy AS m
    ON v.material_id = m.material_id
WHERE m.material_id IS NULL
UNION ALL
SELECT N'Pracovní záznam bez existující zakázky', COUNT(*)
FROM raw.PracovniZaznamy AS p
LEFT JOIN raw.VyrobniZakazky AS z
    ON p.zakazka_id = z.zakazka_id
WHERE z.zakazka_id IS NULL
UNION ALL
SELECT N'Pracovní záznam s neexistujícím prostojem', COUNT(*)
FROM raw.PracovniZaznamy AS p
LEFT JOIN raw.Prostoje AS d
    ON p.prostoj_id = d.prostoj_id
WHERE p.prostoj_id IS NOT NULL
  AND d.prostoj_id IS NULL
UNION ALL
SELECT N'Režijní položka bez existujícího střediska', COUNT(*)
FROM raw.VyrobniRezie AS r
LEFT JOIN raw.Strediska AS s
    ON r.stredisko_id = s.stredisko_id
WHERE s.stredisko_id IS NULL
UNION ALL
SELECT N'Režijní položka s neexistujícím prostojem', COUNT(*)
FROM raw.VyrobniRezie AS r
LEFT JOIN raw.Prostoje AS p
    ON r.prostoj_id = p.prostoj_id
WHERE r.prostoj_id IS NOT NULL
  AND p.prostoj_id IS NULL
UNION ALL
SELECT N'Provozní záznam bez existujícího stroje', COUNT(*)
FROM raw.ProvozStroju AS p
LEFT JOIN raw.Stroje AS s
    ON p.stroj_id = s.stroj_id
WHERE s.stroj_id IS NULL
UNION ALL
SELECT N'Provozní záznam bez existujícího výrobku', COUNT(*)
FROM raw.ProvozStroju AS p
LEFT JOIN raw.Vyrobky AS v
    ON p.vyrobek_id = v.vyrobek_id
WHERE v.vyrobek_id IS NULL
UNION ALL
SELECT N'Prostoj bez existujícího stroje', COUNT(*)
FROM raw.Prostoje AS p
LEFT JOIN raw.Stroje AS s
    ON p.stroj_id = s.stroj_id
WHERE s.stroj_id IS NULL
UNION ALL
SELECT N'Prostoj bez existující zakázky', COUNT(*)
FROM raw.Prostoje AS p
LEFT JOIN raw.VyrobniZakazky AS z
    ON p.zakazka_id = z.zakazka_id
WHERE z.zakazka_id IS NULL
UNION ALL
SELECT N'Stav zásob bez existujícího střediska', COUNT(*)
FROM raw.StavyZasob AS z
LEFT JOIN raw.Strediska AS s
    ON z.stredisko_id = s.stredisko_id
WHERE s.stredisko_id IS NULL
UNION ALL
SELECT N'Materiálová norma bez existujícího výrobku', COUNT(*)
FROM raw.MaterialoveNormy AS n
LEFT JOIN raw.Vyrobky AS v
    ON n.vyrobek_id = v.vyrobek_id
WHERE v.vyrobek_id IS NULL
UNION ALL
SELECT N'Materiálová norma bez existujícího materiálu', COUNT(*)
FROM raw.MaterialoveNormy AS n
LEFT JOIN raw.Materialy AS m
    ON n.material_id = m.material_id
WHERE m.material_id IS NULL
UNION ALL
SELECT N'Výrobní norma bez existujícího výrobku', COUNT(*)
FROM raw.VyrobniNormy AS n
LEFT JOIN raw.Vyrobky AS v
    ON n.vyrobek_id = v.vyrobek_id
WHERE v.vyrobek_id IS NULL
UNION ALL
SELECT N'Výrobní norma bez existujícího střediska', COUNT(*)
FROM raw.VyrobniNormy AS n
LEFT JOIN raw.Strediska AS s
    ON n.stredisko_id = s.stredisko_id
WHERE s.stredisko_id IS NULL
UNION ALL
SELECT N'Výrobní norma bez existujícího stroje', COUNT(*)
FROM raw.VyrobniNormy AS n
LEFT JOIN raw.Stroje AS s
    ON n.stroj_id = s.stroj_id
WHERE s.stroj_id IS NULL
UNION ALL
SELECT N'Plán výroby bez existujícího výrobku', COUNT(*)
FROM raw.PlanVyroby AS p
LEFT JOIN raw.Vyrobky AS v
    ON p.vyrobek_id = v.vyrobek_id
WHERE v.vyrobek_id IS NULL
UNION ALL
SELECT N'Plán výroby bez existujícího střediska', COUNT(*)
FROM raw.PlanVyroby AS p
LEFT JOIN raw.Strediska AS s
    ON p.stredisko_id = s.stredisko_id
WHERE s.stredisko_id IS NULL
UNION ALL
SELECT N'Rozpočet režie bez existujícího střediska', COUNT(*)
FROM raw.RozpocetRezie AS r
LEFT JOIN raw.Strediska AS s
    ON r.stredisko_id = s.stredisko_id
WHERE s.stredisko_id IS NULL
UNION ALL
SELECT N'Uzávěrková úprava bez existujícího střediska', COUNT(*)
FROM raw.UzaverkoveUpravy AS u
LEFT JOIN raw.Strediska AS s
    ON u.stredisko_id = s.stredisko_id
WHERE s.stredisko_id IS NULL
UNION ALL
SELECT N'Uzávěrková úprava s neexistující režijní položkou', COUNT(*)
FROM raw.UzaverkoveUpravy AS u
LEFT JOIN raw.VyrobniRezie AS r
    ON u.souvisejici_polozka_id = r.polozka_id
WHERE u.souvisejici_polozka_id IS NOT NULL
  AND r.polozka_id IS NULL
UNION ALL
SELECT N'Uzávěrková úprava s neexistujícím prostojem', COUNT(*)
FROM raw.UzaverkoveUpravy AS u
LEFT JOIN raw.Prostoje AS p
    ON u.prostoj_id = p.prostoj_id
WHERE u.prostoj_id IS NOT NULL
  AND p.prostoj_id IS NULL

ORDER BY pocet_problemu DESC, kontrola;

-- Detail výdeje bez odpovídající zakázky
SELECT v.*
FROM raw.MaterialoveVydeje AS v
LEFT JOIN raw.VyrobniZakazky AS z
    ON v.zakazka_id = z.zakazka_id
WHERE z.zakazka_id IS NULL;
GO

-- ============================================================
-- Část 6: Vytvoření a naplnění staging tabulek
-- ============================================================

DROP TABLE IF EXISTS staging.Vyrobky;
DROP TABLE IF EXISTS staging.Materialy;
DROP TABLE IF EXISTS staging.Strediska;
DROP TABLE IF EXISTS staging.Stroje;
DROP TABLE IF EXISTS staging.VyrobniZakazky;
DROP TABLE IF EXISTS staging.MaterialoveVydeje;
DROP TABLE IF EXISTS staging.PracovniZaznamy;
DROP TABLE IF EXISTS staging.VyrobniRezie;
DROP TABLE IF EXISTS staging.ProvozStroju;
DROP TABLE IF EXISTS staging.Prostoje;
DROP TABLE IF EXISTS staging.StavyZasob;
DROP TABLE IF EXISTS staging.MaterialoveNormy;
DROP TABLE IF EXISTS staging.VyrobniNormy;
DROP TABLE IF EXISTS staging.PlanVyroby;
DROP TABLE IF EXISTS staging.RozpocetRezie;
DROP TABLE IF EXISTS staging.UzaverkoveUpravy;
GO

SELECT *
INTO staging.Vyrobky
FROM raw.Vyrobky;

SELECT *
INTO staging.Materialy
FROM raw.Materialy;

SELECT *
INTO staging.Strediska
FROM raw.Strediska;

SELECT *
INTO staging.Stroje
FROM raw.Stroje;

SELECT *
INTO staging.VyrobniZakazky
FROM raw.VyrobniZakazky;

SELECT *
INTO staging.MaterialoveVydeje
FROM raw.MaterialoveVydeje;

SELECT *
INTO staging.PracovniZaznamy
FROM raw.PracovniZaznamy;

SELECT *
INTO staging.VyrobniRezie
FROM raw.VyrobniRezie;

SELECT *
INTO staging.ProvozStroju
FROM raw.ProvozStroju;

SELECT *
INTO staging.Prostoje
FROM raw.Prostoje;

SELECT *
INTO staging.StavyZasob
FROM raw.StavyZasob;

SELECT *
INTO staging.MaterialoveNormy
FROM raw.MaterialoveNormy;

SELECT *
INTO staging.VyrobniNormy
FROM raw.VyrobniNormy;

SELECT *
INTO staging.PlanVyroby
FROM raw.PlanVyroby;

SELECT *
INTO staging.RozpocetRezie
FROM raw.RozpocetRezie;

SELECT *
INTO staging.UzaverkoveUpravy
FROM raw.UzaverkoveUpravy;

GO

-- ============================================================
-- Čištění: Chybějící množství materiálu
-- ============================================================

DROP TABLE IF EXISTS staging.MaterialoveVydeje_ChybejiciMnozstvi;
GO

SELECT
    *,
    N'Chybí množství vydaného materiálu' AS duvod_provereni
INTO staging.MaterialoveVydeje_ChybejiciMnozstvi
FROM staging.MaterialoveVydeje
WHERE mnozstvi IS NULL;

-- Kontrola: očekáváme jeden řádek
SELECT *
FROM staging.MaterialoveVydeje_ChybejiciMnozstvi;
GO

-- ============================================================
-- Čištění: Odstranění přesných duplicit materiálových výdejů
-- ============================================================

WITH OcislovaneVydeje AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY
                vydej_id,
                zakazka_id,
                material_id,
                datum_vydeje,
                mnozstvi,
                hodnota_spotreby
            ORDER BY cas_nacteni
        ) AS poradi
    FROM staging.MaterialoveVydeje
)
DELETE FROM OcislovaneVydeje
WHERE poradi > 1;

-- Kontrola: po odstranění duplicity očekáváme 864 řádků
SELECT COUNT(*) AS pocet_vydeju
FROM staging.MaterialoveVydeje;
GO

-- ============================================================
-- Čištění: Režijní položky s opakovaným ID k prověření
-- ============================================================

DROP TABLE IF EXISTS staging.VyrobniRezie_KProvereni;
GO

WITH OpakovanaID AS (
    SELECT polozka_id
    FROM staging.VyrobniRezie
    GROUP BY polozka_id
    HAVING COUNT(*) > 1
)
SELECT
    r.*,
    N'Opakované ID – ověřit rozdíly mezi záznamy' AS duvod_provereni
INTO staging.VyrobniRezie_KProvereni
FROM staging.VyrobniRezie AS r
INNER JOIN OpakovanaID AS o
    ON r.polozka_id = o.polozka_id;

-- Kontrola: očekáváme dva řádky
SELECT *
FROM staging.VyrobniRezie_KProvereni;
GO

-- ============================================================
-- Čištění: Úprava textových údajů
-- ============================================================

UPDATE staging.Vyrobky
SET vyrobek_id = TRIM(vyrobek_id),
    nazev_vyrobku = TRIM(nazev_vyrobku),
    skupina_vyrobku = TRIM(skupina_vyrobku),
    merna_jednotka = TRIM(merna_jednotka);

UPDATE staging.Materialy
SET material_id = TRIM(material_id),
    nazev_materialu = TRIM(nazev_materialu),
    skupina_materialu = TRIM(skupina_materialu),
    merna_jednotka = TRIM(merna_jednotka);

UPDATE staging.Strediska
SET stredisko_id = TRIM(stredisko_id),
    nazev_strediska = TRIM(nazev_strediska);

UPDATE staging.Stroje
SET stroj_id = TRIM(stroj_id),
    nazev_stroje = TRIM(nazev_stroje),
    stredisko_id = TRIM(stredisko_id);

UPDATE staging.VyrobniZakazky
SET zakazka_id = TRIM(zakazka_id),
    vyrobek_id = TRIM(vyrobek_id),
    stredisko_id = TRIM(stredisko_id),
    stav_zakazky = TRIM(stav_zakazky);

UPDATE staging.MaterialoveVydeje
SET vydej_id = TRIM(vydej_id),
    zakazka_id = TRIM(zakazka_id),
    material_id = TRIM(material_id);

UPDATE staging.PracovniZaznamy
SET zaznam_id = TRIM(zaznam_id),
    zakazka_id = TRIM(zakazka_id),
    prostoj_id = TRIM(prostoj_id),
    druh_casu =
        CASE UPPER(TRIM(druh_casu))
            WHEN N'PRACE' THEN N'Prace'
            WHEN N'CEKANI' THEN N'Cekani'
            ELSE TRIM(druh_casu)
        END;

UPDATE staging.VyrobniRezie
SET polozka_id = TRIM(polozka_id),
    stredisko_id = TRIM(stredisko_id),
    kategorie_rezie = TRIM(kategorie_rezie),
    prostoj_id = TRIM(prostoj_id);

UPDATE staging.ProvozStroju
SET provoz_id = TRIM(provoz_id),
    smena = TRIM(smena),
    stroj_id = TRIM(stroj_id),
    vyrobek_id = TRIM(vyrobek_id);

UPDATE staging.Prostoje
SET prostoj_id = TRIM(prostoj_id),
    stroj_id = TRIM(stroj_id),
    zakazka_id = TRIM(zakazka_id),
    smena = TRIM(smena),
    duvod_prostoje = TRIM(duvod_prostoje);

UPDATE staging.StavyZasob
SET stav_id = TRIM(stav_id),
    stredisko_id = TRIM(stredisko_id),
    kategorie_zasob = TRIM(kategorie_zasob);

UPDATE staging.MaterialoveNormy
SET norma_id = TRIM(norma_id),
    vyrobek_id = TRIM(vyrobek_id),
    material_id = TRIM(material_id);

UPDATE staging.VyrobniNormy
SET norma_id = TRIM(norma_id),
    vyrobek_id = TRIM(vyrobek_id),
    stredisko_id = TRIM(stredisko_id),
    stroj_id = TRIM(stroj_id);

UPDATE staging.PlanVyroby
SET plan_id = TRIM(plan_id),
    vyrobek_id = TRIM(vyrobek_id),
    stredisko_id = TRIM(stredisko_id);

UPDATE staging.RozpocetRezie
SET rozpocet_id = TRIM(rozpocet_id),
    stredisko_id = TRIM(stredisko_id),
    kategorie_rezie = TRIM(kategorie_rezie);

UPDATE staging.UzaverkoveUpravy
SET uprava_id = TRIM(uprava_id),
    stredisko_id = TRIM(stredisko_id),
    kategorie_rezie = TRIM(kategorie_rezie),
    souvisejici_polozka_id = TRIM(souvisejici_polozka_id),
    prostoj_id = TRIM(prostoj_id),
    typ_upravy = TRIM(typ_upravy);
GO

-- ============================================================
-- Čištění: Materiálové výdeje bez existující zakázky
-- ============================================================

DROP TABLE IF EXISTS staging.MaterialoveVydeje_BezZakazky;
GO

SELECT
    v.*,
    N'Zakázka nebyla nalezena v exportu výrobních zakázek'
        AS duvod_provereni
INTO staging.MaterialoveVydeje_BezZakazky
FROM staging.MaterialoveVydeje AS v
LEFT JOIN staging.VyrobniZakazky AS z
    ON v.zakazka_id = z.zakazka_id
WHERE z.zakazka_id IS NULL;

-- Kontrola: očekáváme jeden řádek
SELECT *
FROM staging.MaterialoveVydeje_BezZakazky;
GO

-- ============================================================
-- Čištění: Vytvoření tabulek clean
-- ============================================================

DROP TABLE IF EXISTS clean.Vyrobky;
DROP TABLE IF EXISTS clean.Materialy;
DROP TABLE IF EXISTS clean.Strediska;
DROP TABLE IF EXISTS clean.Stroje;
DROP TABLE IF EXISTS clean.VyrobniZakazky;
DROP TABLE IF EXISTS clean.MaterialoveVydeje;
DROP TABLE IF EXISTS clean.PracovniZaznamy;
DROP TABLE IF EXISTS clean.VyrobniRezie;
DROP TABLE IF EXISTS clean.ProvozStroju;
DROP TABLE IF EXISTS clean.Prostoje;
DROP TABLE IF EXISTS clean.StavyZasob;
DROP TABLE IF EXISTS clean.MaterialoveNormy;
DROP TABLE IF EXISTS clean.VyrobniNormy;
DROP TABLE IF EXISTS clean.PlanVyroby;
DROP TABLE IF EXISTS clean.RozpocetRezie;
DROP TABLE IF EXISTS clean.UzaverkoveUpravy;
GO

SELECT *
INTO clean.Vyrobky
FROM staging.Vyrobky;

SELECT *
INTO clean.Materialy
FROM staging.Materialy;

SELECT *
INTO clean.Strediska
FROM staging.Strediska;

SELECT *
INTO clean.Stroje
FROM staging.Stroje;

SELECT *
INTO clean.VyrobniZakazky
FROM staging.VyrobniZakazky;

-- Materiálové výdeje:
-- pouze se známým množstvím a existující zakázkou i materiálem
SELECT v.*
INTO clean.MaterialoveVydeje
FROM staging.MaterialoveVydeje AS v
JOIN clean.VyrobniZakazky AS z
    ON v.zakazka_id = z.zakazka_id
JOIN clean.Materialy AS m
    ON v.material_id = m.material_id
WHERE v.mnozstvi IS NOT NULL;

SELECT *
INTO clean.PracovniZaznamy
FROM staging.PracovniZaznamy;

-- Výrobní režie:
-- vynechání všech řádků s ID označeným k prověření
SELECT r.*
INTO clean.VyrobniRezie
FROM staging.VyrobniRezie AS r
LEFT JOIN staging.VyrobniRezie_KProvereni AS p
    ON r.polozka_id = p.polozka_id
WHERE p.polozka_id IS NULL;

SELECT *
INTO clean.ProvozStroju
FROM staging.ProvozStroju;

SELECT *
INTO clean.Prostoje
FROM staging.Prostoje;

SELECT *
INTO clean.StavyZasob
FROM staging.StavyZasob;

SELECT *
INTO clean.MaterialoveNormy
FROM staging.MaterialoveNormy;

SELECT *
INTO clean.VyrobniNormy
FROM staging.VyrobniNormy;

SELECT *
INTO clean.PlanVyroby
FROM staging.PlanVyroby;

SELECT *
INTO clean.RozpocetRezie
FROM staging.RozpocetRezie;

SELECT *
INTO clean.UzaverkoveUpravy
FROM staging.UzaverkoveUpravy;

GO

-- ============================================================
-- Opakovaná validace: Počty řádků v clean
-- ============================================================

SELECT
    N'Vyrobky' AS tabulka,
    COUNT(*) AS skutecny_pocet,
    6 AS ocekavany_pocet
FROM clean.Vyrobky
UNION ALL
SELECT N'Materialy', COUNT(*), 4
FROM clean.Materialy
UNION ALL
SELECT N'Strediska', COUNT(*), 2
FROM clean.Strediska
UNION ALL
SELECT N'Stroje', COUNT(*), 3
FROM clean.Stroje
UNION ALL
SELECT N'VyrobniZakazky', COUNT(*), 432
FROM clean.VyrobniZakazky
UNION ALL
SELECT N'MaterialoveVydeje', COUNT(*), 862
FROM clean.MaterialoveVydeje
UNION ALL
SELECT N'PracovniZaznamy', COUNT(*), 864
FROM clean.PracovniZaznamy
UNION ALL
SELECT N'VyrobniRezie', COUNT(*), 61
FROM clean.VyrobniRezie
UNION ALL
SELECT N'ProvozStroju', COUNT(*), 432
FROM clean.ProvozStroju
UNION ALL
SELECT N'Prostoje', COUNT(*), 432
FROM clean.Prostoje
UNION ALL
SELECT N'StavyZasob', COUNT(*), 42
FROM clean.StavyZasob
UNION ALL
SELECT N'MaterialoveNormy', COUNT(*), 6
FROM clean.MaterialoveNormy
UNION ALL
SELECT N'VyrobniNormy', COUNT(*), 6
FROM clean.VyrobniNormy
UNION ALL
SELECT N'PlanVyroby', COUNT(*), 72
FROM clean.PlanVyroby
UNION ALL
SELECT N'RozpocetRezie', COUNT(*), 120
FROM clean.RozpocetRezie
UNION ALL
SELECT N'UzaverkoveUpravy', COUNT(*), 6
FROM clean.UzaverkoveUpravy

ORDER BY tabulka;
GO

-- ============================================================
-- Kontrola po čištění
-- ============================================================

-- Chybějící množství: očekáváme 0
SELECT COUNT(*) AS chybejici_mnozstvi
FROM clean.MaterialoveVydeje
WHERE mnozstvi IS NULL;

-- Duplicitní výdeje: očekáváme prázdný výsledek
SELECT vydej_id, COUNT(*) AS pocet
FROM clean.MaterialoveVydeje
GROUP BY vydej_id
HAVING COUNT(*) > 1;

-- Duplicitní režijní položky: očekáváme prázdný výsledek
SELECT polozka_id, COUNT(*) AS pocet
FROM clean.VyrobniRezie
GROUP BY polozka_id
HAVING COUNT(*) > 1;

-- Výdeje bez zakázky: očekáváme 0
SELECT COUNT(*) AS vydeje_bez_zakazky
FROM clean.MaterialoveVydeje AS v
LEFT JOIN clean.VyrobniZakazky AS z
    ON v.zakazka_id = z.zakazka_id
WHERE z.zakazka_id IS NULL;

-- Očekáváme Prace a Cekani
SELECT DISTINCT druh_casu
FROM clean.PracovniZaznamy;
GO