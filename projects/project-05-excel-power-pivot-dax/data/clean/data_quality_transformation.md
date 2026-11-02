## Kontrola a příprava dat — vrstva clean

Zdrojová data byla zachována beze změn ve vrstvě `raw`.
Ve vrstvě `clean` byly v Power Query vytvořeny navazující dotazy pro všech osm zdrojových tabulek.

### Provedené úpravy

- Odstranění počátečních a koncových mezer v textových hodnotách pomocí funkce Trim.
- Odstranění netisknutelných znaků pomocí funkce Clean.
- Sjednocení vybraných identifikátorů na velká písmena.
- Nastavení odpovídajících datových typů: text, datum, celé číslo, desetinné číslo a pevné desetinné číslo pro částky.
- V tabulce strojů povýšení prvního řádku na záhlaví.

### Kontroly klíčů

Byla ověřena jedinečnost a vyplnění identifikátorů v číselnících:

| Číselník | Klíč | Počet jedinečných hodnot |
|---|---|---:|
| Výrobky | Vyrobek_ID | 18 |
| Stroje | Stroj_ID | 8 |
| Materiály | Material_ID | 4 |

### Kontroly referencí

Pomocí levého anti spojení byly ověřeny následující vazby:
- Výrobky → stroje.
- Výrobky → materiály.
- Výroba → výrobky.
- Provoz strojů → stroje.
- Kvalita → výrobky.
- Zásoby materiálu → materiály.
- Režie → střediska evidovaná v číselníku strojů.

Všechny kontroly vrátily **0 neodpovídajících řádků**.

### Kontroly duplicit

Seskupením podle složených klíčů a filtrem na počet řádků větší než jedna byla ověřena jedinečnost záznamů:

| Tabulka | Složený klíč |
|---|---|
| Výroba | Obdobi + Varianta + Vyrobek_ID |
| Provoz strojů | Obdobi + Varianta + Stroj_ID |
| Režie | Obdobi + Varianta + Stredisko_ID |
| Kvalita | Obdobi + Vyrobek_ID |
| Zásoby materiálu | Obdobi + Varianta + Material_ID |

Nebyly nalezeny duplicity. Žádné záznamy nebyly odstraňovány.

### Kontrola rozsahu dat

Počty řádků ve všech osmi tabulkách odpovídaly zadání. U výroby bylo navíc ověřeno zastoupení všech 18 výrobků v každém období:
- **Plán:** leden–prosinec 2026.
- **Skutečnost:** leden–září 2026.

Kontrolní dotazy byly ponechány pouze jako připojení, bez načtení do datového modelu.

### Výsledek

Data byla připravena pro analytickou vrstvu. Kontroly neodhalily chybějící reference ani duplicitní klíče. Ekonomické a výpočtové návaznosti budou ověřovány při jednotlivých analýzách.