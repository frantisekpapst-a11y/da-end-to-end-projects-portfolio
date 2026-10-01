# Zdrojová data

Projekt používá dva hlavní typy zdrojů:

- **ČSOB JSON prices endpoint** pro historické a průběžně doplňované hodnoty fondů;
- **KID dokumenty** pro popisná metadata jednotlivých fondů.

## ČSOB JSON cenové endpointy

JSON endpointy slouží jako hlavní zdroje časových řad.

Pro každý fond poskytují historické hodnoty ve struktuře obsahující:

```text
timestamp
hodnota podílového listu / NAV
```

Po načtení Pythonem jsou data validována a převedena do struktury:

```text
fund_id
date
nav_value
```

Granularita hlavních analytických dat:

```text
1 fond × 1 dostupné datum
```

Business key:

```text
fund_id + date
```

Historická data se mezi jednotlivými fondy liší délkou dostupné historie. Hlavní srovnávací analýza používá společné období dostupné pro všech šest fondů.

Nové hodnoty jsou standardně publikovány v pracovní dny. Python proces bude pravidelně kontrolovat dostupnost nových dat a doplňovat je do SQL Serveru pomocí incremental loadu.

Při každém úspěšném API requestu bude zároveň uložena původní JSON odpověď do lokální raw vrstvy.

Raw snapshoty nejsou určeny k publikaci v GitHub repozitáři.

# Zdrojová metadata o fondech

Metadata jednotlivých fondů jsou čerpána z veřejně dostupných dokumentů KID (Key Information Document – sdělení klíčových informací).

KID dokumenty slouží jako zdroj popisných údajů pro dimenzi `DimFund`, například:

```text
ISIN
název fondu
kategorie
měna
datum vzniku
SRI
doporučená doba držení
vstupní poplatek
průběžné náklady
benchmark / referenční hodnota
```

## ČSOB Akciový pro digitalizaci zodpovědný

ISIN: `BE6339813873`

KID:  
https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_BE6339813873_CS.PDF

## ČSOB Akciový srdce Evropy

ISIN: `CZ0008472610`

KID:  
https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_CZ0008472610_CS.PDF

## ČSOB Premium Velmi odvážný

ISIN: `BE6285921308`

KID:  
https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_BE6285921308_CS.PDF

## ČSOB Premium Velmi odvážný zodpovědný

ISIN: `CZ0008477080`

KID:  
https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_CZ0008477080_CS.PDF

## ČSOB Krátkodobý

ISIN: `BE0173476400`

KID:  
https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_BE0173476400_CS.PDF

## ČSOB Dluhopisový

ISIN: `770000001147`

KID:  
https://multimediafiles.kbcgroup.eu/ng/feed/am/funds/KID/KID_770000001147_CS.PDF

## Použití zdrojů v projektu

Časová řada z JSON endpointu tvoří hlavní analytická data projektu.

KID dokumenty slouží pouze jako zdroj popisných metadat fondů.

Externí KID dokumenty nejsou ukládány přímo do GitHub repozitáře. Projekt místo toho uchovává odkazy na původní