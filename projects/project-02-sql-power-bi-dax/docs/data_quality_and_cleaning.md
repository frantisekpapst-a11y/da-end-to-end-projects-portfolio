# Data Quality and Cleaning

Tento dokument shrnuje kontrolu kvality dat, čištění staging vrstvy, validaci výsledku a vytvoření clean vrstvy pro projekt Customer Retention & Churn Analysis.

Hlavní princip:
```text
raw
→ kontrola kvality
→ staging - cleaning
→ validace
→ clean
```

Raw vrstva zůstává beze změny a slouží jako referenční kopie vstupních dat.

---

## Zdrojové tabulky

Projekt pracuje se šesti hlavními tabulkami:
```text
Zakaznici
Predplatna
Tarify
MesicniVyuziti
Fakturace
PripadyPodpory
```

Po načtení do SQL Serveru byly zdrojové tabulky uloženy v `raw` vrstvě.

---

## Kontrola kvality raw vrstvy

Kontrolovaly se zejména:
- chybějící hodnoty;
- full-row duplicity;
- duplicity podle business key;
- datové typy;
- neplatné hodnoty;
- technické a business klíče;
- referenční integrita;
- časová návaznost;
- business pravidla;
- reconciliation.

### Hlavní nalezené problémy

```text
297
→ ukončených předplatných bez uvedeného důvodu zrušení

301
→ duplicit podle business key v MesicniVyuziti

253
→ duplicit podle business key ve Fakturace

62
→ záznamů MesicniVyuziti s neplatnými hodnotami

58
→ fakturačních záznamů s částkou neodpovídající ceně tarifu
```

Dále byly nalezeny nejednotné textové hodnoty u:
```text
region
duvod_zruseni
kategorie_pripadu
```

---

## Staging vrstva

Pro čištění byla vytvořena pracovní `stg` vrstva jako kopie raw tabulek.

Raw data tak zůstala nezměněná a všechny opravy probíhaly pouze ve staging vrstvě.

---

## Chybějící hodnoty

U ukončených předplatných bez vyplněného důvodu zrušení byla doplněna hodnota:
```text
Neuvedeno
```

Použitá logika:
```text
datum_konce IS NOT NULL
AND duvod_zruseni IS NULL
```

Tím zůstává zachován rozdíl mezi:
```text
aktivní předplatné
→ důvod zrušení ještě neexistuje

ukončené předplatné bez uvedeného důvodu
→ Neuvedeno
```

---

## Duplicity

Duplicity byly řešeny podle business key.

### MesicniVyuziti

Business key:
```text
predplatne_id + mesic_vyuziti
```

### Fakturace

Business key:
```text
predplatne_id + mesic_fakturace
```

Technické ID nebylo použito jako business pravidlo jedinečnosti.

---

## Standardizace textových hodnot

Sjednoceny byly hodnoty u:
```text
region
duvod_zruseni
kategorie_pripadu
```

Použity byly zejména:
```text
TRIM()
LOWER()
CASE
```

Cílem bylo odstranit rozdíly způsobené mezerami, velikostí písmen a variantami stejného textu.

---

## Neplatné hodnoty využití

Za neplatné byly považovány řádky, kde platilo:
```text
hodiny_sledovani < 0
OR aktivni_dny < 0
OR aktivni_dny > 31
```

Tyto záznamy nebyly bez stopy odstraněny a byly přesunuty do:
```text
stg.MesicniVyuziti_Vyrazene
```

---

## Referenční integrita

Ověřeny byly vazby:
```text
Predplatna.zakaznik_id
→ Zakaznici.zakaznik_id

Predplatna.tarif_id
→ Tarify.tarif_id

MesicniVyuziti.predplatne_id
→ Predplatna.predplatne_id

Fakturace.predplatne_id
→ Predplatna.predplatne_id

PripadyPodpory.zakaznik_id
→ Zakaznici.zakaznik_id
```

Nebyla nalezena žádná porušená vazba.

---

## Časová návaznost

Bylo ověřeno, že měsíční využití odpovídá období platnosti předplatného.

Kontrola ověřovala, zda měsíc využití neleží:
```text
před začátkem předplatného
nebo
po skončení předplatného
```

---

## Business pravidla

### Fakturovaná částka

Fakturovaná částka musí odpovídat ceně tarifu.

Správná hodnota byla dostupná v tabulce tarifů, proto byla částka opravena podle:
```text
stg.Tarify.mesicni_cena
```

Další ověřená pravidla:
```text
aktivní předplatné nesmí mít důvod zrušení
→ bez problému

zákazník nesmí mít překrývající se předplatná
→ bez problému
```

---

## Validace staging vrstvy

Po dokončení čištění proběhla souhrnná validace staging vrstvy.

Kontrolovalo se zejména:
- ukončené předplatné bez důvodu;
- aktivní předplatné s důvodem zrušení;
- business duplicity;
- neplatné hodnoty využití;
- sjednocené textové hodnoty;
- fakturační částky;
- reconciliation.

---

## Reconciliation

### MesicniVyuziti

```text
Raw počet                 640 279
- odstraněné duplicity        301
- vyřazené neplatné řádky      62
= Staging počet            639 916
```

Kontrola:
```text
639 916 + 301 + 62 = 640 279
```

Rozdíl:
```text
0
```

### Fakturace

```text
Raw počet                 640 231
- odstraněné duplicity        253
= Staging počet            639 978
```

Kontrola:
```text
639 978 + 253 = 640 231
```

Rozdíl:
```text
0
```

Reconciliation potvrdila, že žádné řádky nezmizely bez vysvětlení.

---

## Clean vrstva

Po úspěšné validaci staging vrstvy byla vytvořena `clean` vrstva.

Použity jsou:
```text
PRIMARY KEY
FOREIGN KEY
NOT NULL
CHECK
```

Původní zdrojová ID byla použita jako primary keys.

---

## Finální počty řádků v clean vrstvě

```text
Zakaznici          40 000
Predplatna         44 277
Tarify                  3
MesicniVyuziti     639 916
Fakturace          639 978
PripadyPodpory      94 344
```

Počty odpovídají validované staging vrstvě.

---

## Výsledek

Výsledný tok:
```text
raw
→ původní nezměněná data

stg
→ pracovní a vyčištěná data

stg.MesicniVyuziti_Vyrazene
→ problematické řádky zachované pro dohledání

clean
→ ověřená data připravená pro analytickou vrstvu
```

Clean vrstva je následně použita jako vstup pro tvorbu analytického modelu a Power BI reportu.