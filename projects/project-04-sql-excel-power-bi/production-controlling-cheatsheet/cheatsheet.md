# Cheatsheet výrobní (production) controlling

Praktická příručka pro začínajícího výrobního controllera. Odborné anglické názvy jsou uvedené u jednotlivých témat a souhrnně v závěrečném slovníčku. Částky v příkladech jsou bez DPH. Pokud není uvedeno jinak, předpokládáme jeden výrobek, stálé ceny a srovnatelné podmínky. Účetní příklady vysvětlují ekonomickou logiku; konkrétní účtování a ocenění se řídí pravidly a metodikou firmy. Pojem „náklad“ vždy čti v kontextu: výrobní kalkulace a výsledek hospodaření nejsou stejný pohled.

## Obsah

1. [Role výrobního controllera](#1-role-výrobního-controllera)
2. [Ekonomika výroby](#2-ekonomika-výroby)
3. [Členění nákladů](#3-členění-nákladů)
4. [Kalkulace výrobku](#4-kalkulace-výrobku)
5. [Plán, skutečnost a odchylky](#5-plán-skutečnost-a-odchylky)
6. [Výrobní ukazatele a kapacita](#6-výrobní-ukazatele-a-kapacita)
7. [Zásoby a rozpracovaná výroba](#7-zásoby-a-rozpracovaná-výroba)
8. [Rozhodování a ekonomický přínos](#8-rozhodování-a-ekonomický-přínos)
9. [Měsíční uzávěrka, reporting a prognóza](#9-měsíční-uzávěrka-reporting-a-prognóza)
10. [Souhrnný měsíční příklad](#10-souhrnný-měsíční-příklad)
11. [Přehled vzorců](#11-přehled-vzorců)
12. [Časté chyby a pracovní postup](#12-časté-chyby-a-pracovní-postup)
13. [Česko-anglický slovníček a zkratky](#13-česko-anglický-slovníček-a-zkratky)

**Doplněné průřezové části:** finanční výkazy, EBITDA, ROA/ROE a provozní páka (§ 2.6–2.9); CNC sazby a seřizování (§ 4.4–4.5); EBITDA bridge a režijní odchylky (§ 5.6–5.7); OEE a COPQ v penězích (§ 6.7–6.8); pracovní kapitál (§ 7.8); Make or Buy, CAPEX/NPV a zákaznická profitabilita (§ 8.8–8.10); směnnost a manažerský report (§ 9.6).

## 1. Role výrobního controllera

**Anglicky:** výrobní controller = *manufacturing controller / plant controller*; výrobní controlling = *manufacturing controlling / plant controlling*. Výrobní controller propojuje provozní údaje s jejich ekonomickým dopadem. Pomáhá plánovat, vyhodnocovat výsledky, vysvětlovat náklady, odchylky a rizika a připravovat podklady pro rozhodnutí.

### 1.1 Co controller řeší

| Činnost | Základní otázka |
| --- | --- |
| Plánování | Kolik bude plánovaná výroba stát a jaké zdroje potřebuje? |
| Vyhodnocení | Jak skutečnost dopadla proti plánu? |
| Vysvětlení příčin | Jakou část rozdílu způsobily objem, sortiment, ceny, spotřeba nebo jiné vlivy? |
| Podpora rozhodnutí | Jaký ekonomický přínos bude mít navrhované opatření? |
| Kontrola účinku | Bylo opatření provedeno a přineslo očekávaný výsledek? |
| Aktualizace výhledu | Jak se nové informace projeví v dalších měsících? |

**Pojmy:** plán = *plan*; skutečnost = *actuals*; odchylka = *variance*; prognóza = *forecast*. Základní otázky výrobního controllera: Kolik měla výroba stát při skutečně vyrobeném množství a sortimentu? Kolik skutečně stála a proč? Jde o změnu objemu, sortimentu, ceny, spotřeby, produktivity, nebo jinou příčinu? Jaký přínos bude mít navrhované opatření pro celou firmu? Jak se zjištění projeví v dalších měsících? Před hodnocením controller ověří správnost dat a srovnatelnost výroby. Vyšší celkové náklady mohou odpovídat většímu objemu nebo náročnějšímu sortimentu; samy o sobě neznamenají nehospodárnost.

### 1.2 Odpovědnost za analýzu a za provoz

**Pojmy:** nákup = *purchasing / procurement*; údržba = *maintenance*; nákladové středisko = *cost centre*; odpovědná osoba = *owner*. Rozdělení pravomocí záleží na firmě. Obvykle platí: Provozní vedoucí odpovídá za řízení svého útvaru a provedení opatření. Controller ověřuje ekonomické údaje, vyčísluje příčiny a pomáhá posoudit řešení. Účetní oddělení zajišťuje správné účetní zachycení.

| Oblast | S kým controller spolupracuje | Co controller řeší |
| --- | --- | --- |
| Cena a dodávky materiálu | Nákup | Cenové dopady a podmínky budoucích dodávek |
| Spotřeba a produktivita | Výroba, technologie | Porovnání normy a skutečnosti, příčiny odchylek |
| Vady materiálu a výrobků | Kvalita, výroba, nákup | Náklady vad a přínos nápravných opatření |
| Poruchy a prostoje | Údržba, servis | Souvislost oprav, prostojů a ekonomického dopadu |
| Fyzické zásoby | Sklad, logistika | Hodnotu, stáří, obrátkovost a rizika zásob |
| Budoucí využití materiálu | Plánování, výroba, obchod | Podklady pro ekonomické hodnocení zásob |
| Nižší objem výroby | Plánování, výroba, případně obchod | Zda chyběly objednávky, nebo výrobu omezil provozní problém |
| Tržby a obchodní odchylky | Obchod, obchodní či finanční controlling | Souvislosti s výrobou; rozsah vlastní analýzy záleží na roli |
| Účetní zachycení | Účetní oddělení | Chybějící podklady, úplnost a návaznost reportu |

Controller nemusí sám opravovat stroj, hledat kupce materiálu ani vyjednávat s dodavatelem. Od odpovědných kolegů získává informace a převádí je na ekonomické závěry. **Příklad: nadspotřebu způsobilo nesprávné nastavení stroje.** Výroba a technologie zjistí technickou příčinu a zajistí správné nastavení. Controller vyčíslí dopad nadspotřeby a ověří datum nápravy. Po nápravě společně ověří, zda spotřeba odpovídá normě. Pokud příčina vysvětluje jen část překročení nákladů, zbývající část je nutné dále objasnit.

> Provedení opatření není totéž jako ověřený ekonomický přínos.

### 1.3 Náklady, zásoby a platby: tři různé otázky

**Pojmy:** výrobní náklady = *manufacturing costs*; zásoby = *inventory*; náklady prodaných výrobků = *cost of goods sold — COGS*; peněžní výdaj = *cash outflow*.

| Pohled | Základní otázka |
| --- | --- |
| Výrobní / kalkulační | Jaké zdroje jsme spotřebovali při výrobě a kolik stály? |
| Výsledek období | Jaké náklady ovlivní zisk daného měsíce? |
| Peněžní | Kdy skutečně odešly peníze? |

Jde o různé pohledy na stejnou činnost firmy. Spotřebovaný materiál a vykonaná výrobní práce vytvářejí výrobní náklady bez ohledu na zaplacení faktury nebo vyplacení mzdy. U neprodaných výrobků mohou být příslušné výrobní náklady zahrnuté v zásobách. Při prodeji se jejich hodnota promítne do nákladů prodaných výrobků. **Příklad bez režie:** Materiál a práce na 100 kusech stojí dohromady 20 000 Kč. Pokud všechny kusy zůstanou na skladě, jejich hodnota je 20 000 Kč. Při prodeji poloviny přejde 10 000 Kč do nákladů prodaných výrobků a 10 000 Kč zůstane v zásobách. Okamžik zaplacení materiálu a mezd je samostatná otázka. **Zaplacení tedy neurčuje vznik výrobního nákladu.** Zaplacený, ale nespotřebovaný materiál je stále zásobou materiálu.

Ne všechny náklady firmy souvisejí přímo s výrobou — existují také správní a prodejní náklady. Ani všechny výrobní náklady nelze automaticky zahrnout do zásob; konkrétní ocenění se řídí účetní metodikou. Pohyb peněz je důležitý například při posuzování většího nákupu materiálu. Pro samotné časové zařazení nákladu však datum platby není rozhodující.

### 1.4 Úplnost nákladů a spolupráce při uzávěrce

Controller ověřuje, zda report obsahuje všechny náklady patřící do měsíce a nezahrnuje položky jiných období. Nízké náklady mohou znamenat: skutečnou úsporu; chybějící nebo nesprávně přiřazený náklad; odložení plánované činnosti, například údržby; chybu v datech či reportu. **Příklad:** říjnový report obsahuje údržbu 70 000 Kč, ale chybí říjnová oprava za odhadovaných 18 000 Kč. Pro vyhodnocení října potřebujeme zachytit celkem 88 000 Kč. Obvyklý postup:

1. Interní údržba potvrdí provedení opravy, datum, zařízení a částku či podložený odhad.
2. Controller ověří období, středisko, přiměřenost podkladu a zda náklad už není zahrnutý.
3. Účetní oddělení zvolí odpovídající účetní postup a náklad zachytí.
4. Controller ověří návaznost finálního reportu.
5. Po doručení faktury účetní vypořádají původně zachycenou částku a případný rozdíl.

Externí servis zpravidla poskytne servisní protokol a cenové podklady. Uvnitř firmy informace předává odpovědný pracovník údržby nebo objednatel služby. **Dohadná položka pasivní** se používá zejména tehdy, když náklad patří do období, ale přesná částka zatím není známá. Samotná chybějící faktura automaticky neurčuje účetní postup. **Pozor:** pokud účetní náklad už zahrnuli, controller jej nesmí přičíst podruhé.

### 1.5 Doporučení a eskalace

**Pojmy:** doporučení = *recommendation*; eskalace = *escalation*; předpoklady = *assumptions*. Nejprve ověř důvod návrhu s jeho vlastníkem. Potom porovnej přínosy, dodatečné náklady, alternativy a rizika.

> Nejdřív se ptej „Co tím firma získá?“ Potom počítej, zda očekávaný přínos skutečně vznikne.

Například výroba navíc může snížit vykázané fixní náklady na kus, přestože celkové fixní náklady firmy zůstanou stejné. Samotné zlepšení jednotkového ukazatele proto není důvodem vyrábět na sklad. Pokud přínos není doložený:

1. Vyžádej si chybějící podklady.
2. Vyčísli dopady a formuluj doporučení.
3. Pokud návrh přesto pokračuje, předlož varianty oprávněnému vedení.

Rozhodnutí přijímá osoba s příslušnou pravomocí. Rozhodnutí a jeho předpoklady zaznamenej.

### 1.6 Promítnutí zjištění do prognózy

**Pojmy:** rozpočet = *budget*; prognóza = *forecast*. Po zjištění příčin a účinku opatření controller aktualizuje očekávaný vývoj: Náklady vzniklé před nápravou zůstávají ve skutečnosti. Pokud je příčina prokazatelně odstraněna, další nadspotřebu automaticky nepředpokládáme. Pokračující vyšší cenu materiálu zahrneme do očekávaných nákladů. Případné další náklady na opravy nebo opatření zohledníme samostatně. **Celoroční prognóza = skutečnost dosavadních měsíců + odhad zbývajících měsíců.** Původní schválený rozpočet zachováváme jako základ pro porovnání.

## 2. Ekonomika výroby

### 2.1 Základní vztahy

**Pojmy:** tržby = *sales revenue*; provozní zisk = *operating profit*; příspěvek na úhradu = *contribution / contribution margin*; příspěvek na kus = *unit contribution margin*. V této části používáme **zjednodušený model s variabilními náklady**: Variabilní výrobní náklady vznikají při výrobě jednotlivých kusů. Náklady prodaných kusů odečítáme od tržeb. Náklady vyrobených, ale neprodaných kusů zůstávají v hodnotě zásob. Fixní náklady odečítáme celé za daný měsíc. **Rozlišuj dvě otázky:**

| Otázka | Co počítáme |
| --- | --- |
| Kolik zdrojů jsme spotřebovali při výrobě? | Výrobní náklady všech vyrobených kusů |
| Kolik z těchto nákladů sníží zisk tohoto měsíce? | Náklady prodaných kusů; neprodaná část zůstává v zásobách |

> Spotřebou vznikají výrobní náklady. Neznamená to ale, že celá jejich částka ihned sníží zisk — část může zůstat v hodnotě neprodaných výrobků.

Základní vzorce pro jeden výrobek:

`Tržby = prodané množství × prodejní cena`; `Příspěvek na úhradu na kus = prodejní cena − variabilní náklady na kus`; `Příspěvek na úhradu celkem = prodané množství × příspěvek na kus`; `Stejný příspěvek celkem lze vypočítat: tržby − variabilní náklady prodaných kusů`; `Zisk ve zjednodušeném modelu = příspěvek celkem − fixní náklady`

**Příspěvek na úhradu není další náklad.** Je to část tržeb zbývající po odečtení variabilních nákladů prodaných kusů. Slouží ke krytí fixních nákladů a poté k tvorbě zisku. Zásoby počítáme samostatně. Jejich hodnotu už znovu neodečítáme od příspěvku ani ji k němu nepřičítáme. **Rozsah modelu:** zatím předpokládáme stejné jednotkové náklady, žádnou počáteční zásobu a žádné další variabilní náklady prodeje. Zásoby oceňujeme pouze variabilními výrobními náklady. Účetní ocenění zahrnující také příslušnou fixní výrobní režii může vést k jinému časovému rozložení nákladů do výsledku.

### 2.2 Příklad firmy

**A. Všechno vyrobené také prodáme**

| Položka | Hodnota |
| --- | ---: |
| Vyrobené množství | 1 200 ks |
| Prodané množství | 1 200 ks |
| Prodejní cena | 600 Kč/ks |
| Variabilní materiál | 240 Kč/ks |
| Variabilní výrobní práce — předpoklad modelu | 110 Kč/ks |
| Variabilní výrobní náklady celkem | 350 Kč/ks |
| Fixní náklady | 180 000 Kč/měsíc |

`Tržby = 1 200 × 600 = 720 000 Kč`; `Variabilní náklady vyrobených i prodaných kusů = 1 200 × 350 = 420 000 Kč`; `Příspěvek na kus = 600 − 350 = 250 Kč`; `Příspěvek celkem = 1 200 × 250 = 300 000 Kč`; `Provozní zisk = 300 000 − 180 000 = 120 000 Kč`

Protože jsme všechny kusy prodali, žádné hotové výrobky nezůstávají na skladě.

**B. Část výroby zůstane v zásobách** — Vyrobíme stejných **1 200 kusů**, ale prodáme pouze **1 000 kusů**. Ceny a náklady zůstávají stejné.

| Položka | Výpočet | Částka |
| --- | --- | ---: |
| Tržby | 1 000 × 600 | 600 000 Kč |
| Variabilní výrobní náklady všech vyrobených kusů | 1 200 × 350 | 420 000 Kč |
| Z toho náklady prodaných kusů | 1 000 × 350 | 350 000 Kč |
| Z toho hodnota zásoby 200 kusů | 200 × 350 | 70 000 Kč |

Kontrola rozdělení výrobních nákladů:

`420 000 = 350 000 prodané kusy + 70 000 zásoby`

Výpočet výsledku podle základních vzorců:

`Příspěvek na kus = 600 − 350 = 250 Kč`; `Příspěvek celkem = 1 000 × 250 = 250 000 Kč`; `Provozní zisk = 250 000 − 180 000 = 70 000 Kč`

Stejný výsledek přes celkové částky:

`Provozní zisk = 600 000 tržby − 350 000 variabilní náklady prodaných kusů − 180 000 fixní náklady = 70 000 Kč`

**Výroba spotřebovala zdroje za 420 000 Kč, ale při výpočtu příspěvku odečítáme pouze 350 000 Kč vztahujících se k prodaným kusům.** Zbývajících 70 000 Kč zůstává v zásobách a do nákladů prodaných výrobků přejde při jejich prodeji. Shodná částka zásob a zisku — v tomto příkladu obojí 70 000 Kč — je pouze číselná shoda. Jde o dvě různé veličiny.

### 2.3 Bod zvratu

**Anglicky:** bod zvratu = *break-even point (BEP)*. Bod zvratu je objem prodeje, při kterém příspěvek právě pokryje všechny fixní náklady a zisk je nulový. V našem příkladu: Prodejní cena: **600 Kč/ks**. Variabilní náklady: **350 Kč/ks**. Příspěvek na kus: **250 Kč/ks**. Fixní náklady: **180 000 Kč/měsíc**.

`Bod zvratu v kusech = fixní náklady / příspěvek na kus`; `180 000 / 250 = 720 prodaných kusů`

Kontrola:

| Položka | Výpočet | Částka |
| --- | --- | ---: |
| Tržby | 720 × 600 | 432 000 Kč |
| Variabilní náklady prodaných kusů | 720 × 350 | −252 000 Kč |
| Příspěvek na úhradu | 720 × 250 | 180 000 Kč |
| Fixní náklady |  | −180 000 Kč |
| **Zisk** |  | **0 Kč** |

Za uvedených předpokladů: **Pod 720 prodanými kusy:** ztráta. **Při 720 prodaných kusech:** nulový zisk. **Nad 720 prodanými kusy:** zisk. Každý další prodaný kus zvýší výsledek o **250 Kč**. Samotná výroba na sklad příspěvek z prodeje nevytváří. Například při prodeji 600 kusů:

`Zisk = 600 × 250 − 180 000 = −30 000 Kč`

**Prodej potřebný k dosažení požadovaného zisku** — Příspěvky musí pokrýt fixní náklady i požadovaný zisk:

`Potřebný prodej = (fixní náklady + požadovaný zisk) / příspěvek na kus`

Pro měsíční zisk 60 000 Kč:

`(180 000 + 60 000) / 250 = 960 prodaných kusů`

**Podmínky výpočtu:** kladný příspěvek, stabilní prodejní cena, jednotkové variabilní náklady a celkové fixní náklady v posuzovaném rozsahu. U více výrobků záleží také na prodejním mixu. Pokud potřebný počet celých kusů vyjde desetinný, zaokrouhluj nahoru. Jde pak o nejnižší počet kusů, který náklady nebo požadovaný zisk alespoň pokryje.

### 2.4 Dopad nižšího prodeje

Předpokládáme, že vyrobené množství odpovídá prodanému množství. Nevzniká tedy změna zásob. Cena, variabilní náklady na kus i celkové fixní náklady zůstávají stejné. Při prodeji 1 200 kusů:

`Zisk = 1 200 × 250 − 180 000 = 120 000 Kč`

Při prodeji 900 kusů:

`Zisk = 900 × 250 − 180 000 = 45 000 Kč`

Rozdíl:

`Pokles prodeje = 1 200 − 900 = 300 kusů`; `Ztracený příspěvek = 300 × 250 = 75 000 Kč`; `Pokles zisku = 120 000 − 45 000 = 75 000 Kč`

| Ukazatel | Původně | Nyní | Pokles |
| --- | ---: | ---: | ---: |
| Prodané množství | 1 200 ks | 900 ks | 25 % |
| Příspěvek celkem | 300 000 Kč | 225 000 Kč | 25 % |
| Fixní náklady | 180 000 Kč | 180 000 Kč | 0 % |
| Provozní zisk | 120 000 Kč | 45 000 Kč | **62,5 %** |

**Zisk klesá procentuálně výrazněji než prodej, protože fixní náklady zůstávají stejné.** Každý neuskutečněný prodej znamená ztrátu příspěvku 250 Kč. Nižší prodej zde neznamená, že neprodané kusy leží na skladě — v tomto příkladu jsme je vůbec nevyrobili.

### 2.5 Fixní náklady na kus

**Anglicky:** fixní náklady na kus = *fixed cost per unit*; objem výroby = *production volume*.

`Fixní náklady na kus = celkové fixní náklady / vyrobené množství`

| Ukazatel | Výroba 1 200 ks | Výroba 900 ks |
| --- | ---: | ---: |
| Fixní náklady celkem | 180 000 Kč | 180 000 Kč |
| Fixní náklady na kus | **150 Kč** | **200 Kč** |
| Variabilní náklady na kus | 350 Kč | 350 Kč |
| Celkové náklady na kus v našem modelu | **500 Kč** | **550 Kč** |

**Náklady na kus vzrostly, přestože se nezměnily celkové fixní náklady ani variabilní náklady na kus.** Stejnou fixní částku jsme rozdělili mezi méně výrobků. Vyšší fixní náklad na kus tedy sám o sobě nedokazuje plýtvání. Může vzniknout pouze nižším objemem výroby. Platí také opačný vztah: vyšší výroba může snížit fixní náklady na kus, ale **samotné rozpočítání stejné částky mezi více kusů nevytváří úsporu**. Výroba navíc může zvýšit spotřebu materiálu, práce a hodnotu zásob. Musí proto mít ekonomické opodstatnění, například očekávaný odbyt nebo úsporu budoucích přesčasů. **Pozor:** rozpočítání fixních nákladů v této tabulce slouží k vysvětlení jednotkových nákladů. Nemění náš model výpočtu zisku ani dosavadní ocenění zásob pouze variabilními výrobními náklady.

### 2.6 Finanční výkazy a vazba na výrobu

**Pojmy:** rozvaha = *balance sheet*; výsledovka = *profit and loss statement (P&L) / income statement*; peněžní tok = *cash flow*; akruální princip = *accrual accounting*; aktiva = *assets*; pasiva = *equity and liabilities*. Finanční controlling výrobního závodu potřebuje rozlišovat **výsledek, stav majetku a pohyb peněz**.

| Výkaz | Co ukazuje | Příklad z CNC závodu |
| --- | --- | --- |
| Rozvaha (*balance sheet*) | Majetek a jeho financování k určitému dni | CNC stroj, zásoby, pohledávky; kapitál a úvěry |
| Výsledovka (*P&L*) | Výnosy a náklady za období | Tržby, spotřeba prodaných výrobků, mzdy, odpisy |
| Cash flow (*cash flow statement*) | Skutečné příjmy a výdaje peněz | Platba za stroj, inkaso faktury, splátka úvěru |

`Aktiva = vlastní kapitál + závazky`. **Příklad:** Aktiva 30 mil. Kč, závazky 18 mil. Kč → vlastní kapitál 12 mil. Kč. Nákup materiálu na fakturu za 2 mil. Kč zvýší zásoby i dodavatelské závazky o 2 mil. Kč; sám o sobě nezvýší zisk a nemusí ihned změnit hotovost. Materiálový náklad se promítá podle spotřeby a ocenění výroby/prodeje.

**Časová souvislost:** v říjnu dodáme za 500 000 Kč, zákazník zaplatí v prosinci. Říjnové tržby a případný zisk mohou vzniknout již při dodání, říjnový příjem peněz nikoli; do inkasa evidujeme pohledávku.

### 2.7 EBITDA, EBIT, čistý zisk a marže

**Pojmy:** EBITDA = *Earnings Before Interest, Taxes, Depreciation and Amortisation*; EBIT = *Earnings Before Interest and Taxes*; čistý zisk = *net profit*; EBIT marže = *EBIT margin*; příspěvková marže = *contribution margin ratio*. EBITDA sleduje výsledek před odpisy, úroky a daněmi; EBIT po odpisech, ale před úroky a daněmi. Definici EBITDA a upravených ukazatelů vždy ověř podle firemního reportu.

| Modelová výsledovka za měsíc | Kč |
| --- | ---: |
| Tržby | 8 000 000 |
| Materiál, práce a ostatní provozní náklady bez odpisů | −5 600 000 |
| **EBITDA** | **2 400 000** |
| Odpisy | −400 000 |
| **EBIT** | **2 000 000** |
| Úroky | −100 000 |
| Zisk před daní (*EBT*) | 1 900 000 |
| Daň ze zisku v modelu | −399 000 |
| **Čistý zisk** | **1 501 000** |

`EBITDA = EBIT + odpisy a amortizace` (při srovnatelné definici); `EBIT marže = EBIT / tržby × 100`; `Příspěvková marže = příspěvek na úhradu / tržby × 100`.

**Příklad marží:** cena 750 Kč, variabilní náklad 450 Kč → CM 300 Kč/ks a CM marže 40 %. Prodáme 4 000 ks, fixní provozní náklady 900 000 Kč, bez dalších položek → EBIT 300 000 Kč, tržby 3 mil. Kč, EBIT marže 10 %. Sleva 10 % na cenu při stejném objemu a nákladech sníží CM/ks na 225 Kč a EBIT na nulu. **Pokles ceny o 10 % tedy není automaticky pokles zisku o 10 %.**

**Odpis versus platba:** CNC stroj za 15 mil. Kč s modelovou životností 5 let a nulovou zůstatkovou hodnotou → lineární účetní odpis 3 mil. Kč/rok; při nákupu vznikne peněžní výdaj, odpis se později promítá do EBIT bez nové platby. Po třech letech je při těchto předpokladech účetní zůstatková hodnota 6 mil. Kč.

### 2.8 Rentabilita, likvidita a zadluženost — rychlé minimum

**Pojmy:** rentabilita aktiv = *return on assets (ROA)*; rentabilita vlastního kapitálu = *return on equity (ROE)*; likvidita = *liquidity*; zadluženost = *leverage / indebtedness*. V tomto cheatsheetu používáme pro ROA provozní definici `EBIT / průměrná celková aktiva × 100` a pro ROE `čistý zisk / průměrný vlastní kapitál × 100`. Jiné metodiky mohou používat odlišné čitatele.

| Ukazatel | Jednoduchý příklad | Interpretace |
| --- | --- | --- |
| EBIT marže | EBIT 8 mil. / tržby 100 mil. = 8 % | Provozní zisk ze 100 Kč tržeb |
| ROA | EBIT 16 mil. / průměrná aktiva 100 mil. = 16 % | Provozní výnosnost účetně zachyceného majetku |
| ROE | Čistý zisk 12 mil. / průměrný vlastní kapitál 40 mil. = 30 % | Účetní výnosnost vlastního kapitálu |
| Běžná likvidita (*current ratio*) | Oběžná aktiva 15 mil. / krátkodobé závazky 10 mil. = 1,5 | Orientační krátkodobé krytí závazků |
| Míra zadlužení (*debt-to-equity*) | Úročený dluh 20 mil. / vlastní kapitál 40 mil. = 50 % | Dluh vzhledem ke kapitálu; definuj, které dluhy zahrnuješ |

**Pozor na srovnání závodů:** odpisovaný starší CNC stroj může mít nízkou účetní hodnotu, a tím mechanicky zvyšovat ROA, aniž by vyráběl efektivněji. Vyšší ROE může vyplývat z menšího vlastního kapitálu při větším zadlužení; nemusí znamenat nižší riziko. Likviditu nelze vyvozovat pouze z účetního zisku.

### 2.9 Provozní páka a citlivost výsledku

**Pojem:** provozní páka = *operating leverage*. Při stabilních fixních nákladech může zisk klesat procentuálně rychleji než prodej. **Příklad:** 30 000 prodaných kusů, cena 500 Kč, variabilní náklady 320 Kč/ks, fixní náklady 3,6 mil. Kč → EBIT 1,8 mil. Kč a marže 12 %. Při 24 000 kusech a stejných ostatních podmínkách → EBIT 720 000 Kč a marže 6 %. Prodej klesl o 20 %, EBIT o 60 %. Nižší objem proto vždy vyhodnoť s možnostmi **skutečně ušetřitelných** fixních a směnových nákladů.

## 3. Členění nákladů

### 3.1 Dvě nezávislé otázky

**Pojmy:** fixní náklady = *fixed costs*; variabilní náklady = *variable costs*; přímé náklady = *direct costs*; nepřímé náklady = *indirect costs*; režie = *overhead*. Stejný náklad posuzujeme ze dvou nezávislých hledisek:

| Členění | Otázka | Kategorie |
| --- | --- | --- |
| Podle závislosti na objemu | Jak se změní celkový náklad při změně rozsahu činnosti? | Fixní × variabilní |
| Podle přiřazení | Lze náklad přímo přiřadit konkrétnímu výrobku nebo zakázce? | Přímý × nepřímý neboli režijní |

**Fixní a variabilní náklady** — **Fixní náklady:** v určitém období a rozsahu kapacity zůstávají celkově přibližně stejné. Při rozšíření kapacity mohou skokově vzrůst. **Variabilní náklady:** mění se s rozsahem činnosti. V našich jednoduchých modelech rostou přímo úměrně objemu výroby. **Posuzujeme celkový náklad, nikoli náklad na kus.** Fixní náklad na kus při vyšší výrobě klesá, přestože se jeho celková výše nemění. Příklad: nájem haly je 90 000 Kč měsíčně a materiál stojí 80 Kč na vyrobený kus. Kapacita haly stačí pro obě varianty.

| Náklad | Výroba 500 ks | Výroba 800 ks | Zařazení |
| --- | ---: | ---: | --- |
| Nájem haly | 90 000 Kč | 90 000 Kč | Fixní |
| Materiál | 40 000 Kč | 64 000 Kč | Variabilní |

**Přímé a režijní náklady** — **Přímé náklady:** lze je přímo přiřadit konkrétnímu výrobku, zakázce nebo jinému předmětu kalkulace. **Režijní náklady:** jsou společné více výrobkům či zakázkám. Přiřazujeme je nepřímo podle zvolené rozvrhové základny, například strojových hodin. Rozhoduje, **k čemu náklad přiřazujeme a jak ho evidujeme**. Příklad: firma vyrábí A i B ve společné hale. Spotřebu materiálu eviduje samostatně pro každý výrobek. Materiál je přímý náklad, protože známe spotřebu na A i B. Nájem společné haly je režijní náklad, protože ho mezi A a B musíme rozdělit.

**Kombinace obou členění**

| Příklad a podmínky | Chování vůči objemu | Přiřazení |
| --- | --- | --- |
| Materiál evidovaný na konkrétní výrobek | Variabilní | Přímý |
| Nájem společné výrobní haly | Fixní | Režijní |
| Mazivo, jehož spotřeba roste s provozem strojů, ale nesledujeme ji podle výrobků | Variabilní | Režijní |
| Pevný měsíční pronájem stroje výhradně pro jednu zakázku | Fixní | Přímý k zakázce |
| Pevná mzda mistra dohlížejícího na více výrobků | Fixní v daném rozsahu | Režijní |

**Fixní neznamená režijní. Přímý neznamená automaticky variabilní.**

**Výrobní mzdy nejsou vždy variabilní**

| Způsob odměňování a přiřazení | Zařazení v daném příkladu |
| --- | --- |
| Pracovník má pevnou měsíční mzdu 38 000 Kč, stejnou při výrobě 400 i 600 kusů, a pracuje výhradně na zakázce Z | Fixní a přímý náklad |
| Pracovník dostává pouze 60 Kč za dokončený kus a práci evidujeme na konkrétní zakázku | Variabilní a přímý náklad |

Při rozhodování ověřujeme, zda změna objemu skutečně změní mzdový náklad. Vyšší výroba během stejné placené směny nemusí znamenat vyšší mzdy; další výroba vyžadující přesčas je jiná situace. V kapitole 2 jsme variabilitu výrobní práce stanovili jako **předpoklad modelu**, nikoli jako obecné pravidlo.

### 3.2 Náklad a výdaj

**Pojmy:** náklad = *cost / expense* podle kontextu; peněžní výdaj = *cash outflow / cash payment*; náklady prodaných výrobků = *cost of goods sold — COGS*. Anglické *cost* může označovat nákladovou hodnotu zahrnutou v zásobě. *Expense* označuje náklad promítnutý do výsledku období.

| Pojem | Význam |
| --- | --- |
| Peněžní výdaj | Úbytek peněz, například zaplacení faktury nebo výplata mzdy |
| Náklady na výrobu | Hodnota zdrojů spotřebovaných při výrobě |
| Hodnota zásob | Částka zachycená v materiálu, rozpracované výrobě nebo hotových výrobcích |
| Náklady prodaných výrobků | Výrobní hodnota prodaných kusů promítnutá do výsledku období |

**Zaplacení, spotřeba a prodej mohou nastat v různých měsících.** Zaplacený, ale nespotřebovaný materiál zůstává zásobou materiálu. Spotřebovaný materiál vytváří výrobní náklad, i když dodavateli ještě nebyl zaplacen. Vykonaná výrobní práce vytváří výrobní náklad, i když mzda bude vyplacena později. Příslušné náklady neprodaných výrobků mohou zůstat zahrnuté v zásobách. Při prodeji se hodnota prodaných výrobků promítne do nákladů daného období. Konkrétní rozsah ocenění zásob se řídí účetní metodikou. Nelze do nich automaticky zahrnout všechny náklady firmy. **Příklad: materiál a práce** — V listopadu dokončíme zakázku:

| Položka | Částka | Okamžik platby |
| --- | ---: | --- |
| Materiál spotřebovaný v listopadu | 30 000 Kč | Zaplacen v říjnu |
| Práce vykonaná v listopadu | 20 000 Kč | Mzdy vyplaceny v prosinci |
| **Listopadové výrobní náklady bez režie** | **50 000 Kč** |  |

Pokud všechny výrobky zůstanou na skladě, jejich hodnota je v tomto příkladu **50 000 Kč**. Z této částky zatím nic nepřejde do nákladů prodaných výrobků. Platby v říjnu a prosinci nemění skutečnost, že materiál a práce byly spotřebovány při listopadové výrobě. **Příklad: odpis stroje** — **Anglicky:** odpis = *depreciation*. Stroj jsme koupili a zaplatili před dvěma lety. Jeho listopadový odpis činí 12 000 Kč. Odpis je náklad zachycující postupnou spotřebu hodnoty stroje. V listopadu kvůli tomuto odpisu neodchází 12 000 Kč z účtu. Pokud stroj slouží výrobě, jde o výrobní náklad. Jeho případné zahrnutí do zásob posoudíme podle pravidel ocenění výroby. **Odpis tedy může být nákladem bez současného peněžního výdaje.** **Shrnutí** — U nákladu odděluj tyto otázky:

1. **Jak se mění s objemem?** → fixní × variabilní.
2. **Jak ho přiřadíme výrobku nebo zakázce?** → přímý × režijní.
3. **Kdy byly zdroje spotřebovány?** → vznik výrobních nákladů.
4. **Co zůstává v zásobách a co ovlivňuje výsledek období?**
5. **Kdy odešly peníze?** → peněžní výdaj.

Výrobní náklady zahrnuté do zásob při následném prodeji nezapočítáváme podruhé. Jejich hodnota přechází ze zásob do nákladů prodaných výrobků.

## 4. Kalkulace výrobku

### 4.1 Výrobní a úplná kalkulace

**Pojmy:** kalkulace výrobku = *product costing*; výrobní náklady = *manufacturing costs / production costs*; úplná kalkulace = *full costing*; přímý materiál = *direct materials*; přímé mzdy = *direct labour*; výrobní režie = *manufacturing overhead*; správní režie = *administrative overhead*; prodejní režie = *selling overhead*. Kalkulace výrobku určuje, jaké náklady připadají na jeden výrobek.

| Složka | Kč/ks |
| --- | ---: |
| Přímý materiál | 200 |
| Přímé výrobní mzdy | 100 |
| Výrobní režie | 48 |
| **Vlastní náklady výroby** | **348** |
| Správní režie | 30 |
| Prodejní režie | 22 |
| **Úplné náklady v našem modelu** | **400** |
| Prodejní cena | 500 |
| **Kalkulovaný zisk** | **100** |

**Co jednotlivé režie představují**

| Druh režie | Účel | Příklady |
| --- | --- | --- |
| Výrobní | Zajištění výroby | Mistr, údržba společných strojů, nájem výrobní haly |
| Správní | Celkové řízení a administrativa firmy | Vedení firmy, účetní oddělení, společná administrativa |
| Prodejní | Získávání a obsluha prodeje | Obchodní oddělení, reklama, prodejní podpora |

Rozhoduje účel nákladu, nikoli například to, zda zaměstnanec pracuje v kanceláři. **Výrobní versus úplná kalkulace** — **Výrobní kalkulace** hodnotí náklady na výrobu výrobku. **Úplná kalkulace** pomáhá posoudit dlouhodobé pokrytí všech přiřazených nákladů firmy prodejní cenou. **Kalkulovaný zisk na kus** je rozdíl mezi cenou a úplnými náklady na kus. Není automaticky přírůstkem celkového zisku při dodatečné objednávce.

**Ocenění zásoby versus úplná kalkulace**

| Pohled | Otázka | Hodnota v našem příkladu |
| --- | --- | ---: |
| Ocenění hotového výrobku na skladě | Jaké náklady zahrnujeme do hodnoty vyrobeného kusu? | **348 Kč/ks** |
| Úplná kalkulace | Jaké celkové přiřazené náklady má pokrýt jeho cena? | **400 Kč/ks** |

Předpokládáme, že výrobních **348 Kč/ks** odpovídá nákladům zahrnovaným do ocenění zásob podle naší metodiky. **Obecnou správní a prodejní režii 52 Kč/ks do zásob nezahrnujeme.** Tyto náklady zatěžují období, ke kterému patří. Do úplné kalkulace je přesto zahrnujeme, protože firma je musí dlouhodobě pokrýt z prodejních cen. Příklad: vyrobíme 100 kusů a všechny zůstanou na skladě. Předpokládejme, že skutečné náklady odpovídají kalkulaci:

| Položka | Částka | Zachycení |
| --- | ---: | --- |
| Výrobní náklady | 100 × 348 = **34 800 Kč** | Zůstávají v zásobách výrobků |
| Obecné správní a prodejní náklady | 100 × 52 = **5 200 Kč** | Zatíží výsledek příslušného období |

Při pozdějším prodeji všech kusů přejde **34 800 Kč ze zásob do nákladů prodaných výrobků**. Původních 5 200 Kč správních a prodejních nákladů znovu nezapočítáváme. Pokud v dalším měsíci vzniknou nové správní a prodejní náklady, zatíží tento další měsíc. Jde však o jiné náklady než původních 5 200 Kč. **Ocenění zásob se řídí příslušnou účetní metodikou.** Nelze do zásob libovolně rozpočítat veškeré náklady. Zejména nevyužitá kapacita a mimořádné ztráty vyžadují samostatné posouzení. U správních nákladů je podstatná jejich skutečná souvislost s výrobou; zde máme na mysli obecnou správu firmy.

### 4.2 Rozvrhování výrobní režie

**Pojmy:** rozvrhová základna = *allocation base / absorption base*; režijní sazba = *overhead rate / overhead absorption rate*; strojové hodiny = *machine hours*. **Rozvrhová základna** je veličina, podle které společné režijní náklady přiřadíme výrobkům nebo zakázkám. Základnu vybíráme podle souvislosti nákladů s činností nebo využíváním společných zdrojů. Různé skupiny režie mohou mít různé základny.

| Skupina režijních nákladů | Možná základna | Zdůvodnění |
| --- | --- | --- |
| Provoz společných výrobních strojů | Strojové hodiny | Výrobky využívají stroje různě dlouho |
| Dohled nad ruční výrobou | Přímé pracovní hodiny | Náročnost dohledu může souviset s rozsahem práce |
| Nájem společných prostor při rozdělení mezi pracoviště | Využívaná plocha v m² | Pracoviště zabírají různou část prostor |
| Seřizování mezi zakázkami | Hodiny seřizování | Zakázky vyžadují různě náročnou přípravu |
| Kontrola kvality | Čas kontrol | Výrobky potřebují různý rozsah kontrol |
| Interní manipulace | Čas manipulace, případně počet srovnatelných přesunů | Výrobky vyvolávají různý rozsah přepravy |

Nejde o pevná pravidla. Například počet kontrol je vhodnou základnou pouze tehdy, pokud jsou kontroly přibližně stejně náročné. Jinak může být vhodnější jejich čas. Rozdělení může probíhat ve více krocích:

1. Nájem haly rozdělíme mezi pracoviště podle využívané plochy.
2. Náklady pracoviště následně přiřadíme výrobkům například podle času jejich zpracování.

**Rozvrhová základna neznamená, že je náklad variabilní.** Fixní nájem můžeme rozdělovat podle hodin, přestože jeho celková částka s hodinami neroste.

**Výpočet režijní sazby**

`Režijní sazba = rozdělovaná režie / celkový objem základny`; `Přiřazená režie = využití základny výrobkem × režijní sazba`; `Režie na kus = přiřazená režie / počet vyrobených kusů`

Příklad: režie činí **120 000 Kč** a výrobky využily celkem **1 000 strojových hodin**.

`Režijní sazba = 120 000 / 1 000 = 120 Kč/hod.`

| Výrobek | Vyrobené množství | Strojové hodiny | Přiřazená režie | Režie na kus |
| --- | ---: | ---: | ---: | ---: |
| A | 1 000 ks | 400 | 48 000 Kč | 48 Kč |
| B | 500 ks | 600 | 72 000 Kč | 144 Kč |
| **Celkem** | **1 500 ks** | **1 000** | **120 000 Kč** |  |

Výrobek B využívá na kus více strojového času, proto mu při této základně připadá vyšší režie na kus. Kontrola: součet přiřazené režie musí odpovídat rozdělovaným **120 000 Kč**. **Co způsobí jiná základna** — Pokud stejnou režii rozdělíme rovnoměrně podle počtu kusů:

`120 000 / 1 500 = 80 Kč na každý kus A i B`

| Výrobek | Podle strojových hodin | Podle počtu kusů | Rozdíl proti časové základně |
| --- | ---: | ---: | ---: |
| A | 48 Kč/ks | 80 Kč/ks | +32 Kč/ks |
| B | 144 Kč/ks | 80 Kč/ks | −64 Kč/ks |

Pokud strojové hodiny lépe odpovídají využití společných zdrojů, rozdělení podle kusů náklady A nadhodnocuje a náklady B podhodnocuje. **Celková režie se změnou rozdělení nemění. Mění se náklady přiřazené výrobkům, a tím jejich vykazovaná ziskovost.** Pro porovnání plánu a skutečnosti sleduj odděleně změnu sazby, využití základny a objemu. Mechanické dělení skutečné režie skutečnými hodinami může zakrýt příčiny změny.

### 4.3 Plánovaná a skutečná kalkulace

**Pojmy:** plánované náklady = *planned costs*; standardní náklady = *standard costs*; skutečné náklady = *actual costs*; kalkulace standardních nákladů = *standard costing*. Plánovaná kalkulace stanovuje očekávané náklady. Skutečná kalkulace ukazuje náklady podle dosažené skutečnosti. Při porovnání potřebujeme stejný výrobek, jednotku a rozsah zahrnutých nákladů.

| Položka | Plán Kč/ks | Skutečnost Kč/ks | Rozdíl |
| --- | ---: | ---: | ---: |
| Materiál | 200 | 212 | +12 |
| Výrobní mzdy | 100 | 105 | +5 |
| Výrobní režie | 48 | 51 | +3 |
| Správní a prodejní režie | 52 | 52 | 0 |
| **Celkem** | **400** | **420** | **+20** |

**Která položka nejvíce ovlivnila celkovou odchylku?**

| Položka | Nárůst Kč/ks | Nárůst dané položky | Podíl na celkovém zvýšení o 20 Kč |
| --- | ---: | ---: | ---: |
| Materiál | +12 | 6 % | **60 %** |
| Výrobní mzdy | +5 | 5 % | 25 % |
| Výrobní režie | +3 | 6,25 % | 15 % |
| Správní a prodejní režie | 0 | 0 % | 0 % |
| **Celkem** | **+20** | **5 %** | **100 %** |

Rozlišuj dva různé údaje: Materiálové náklady vzrostly z 200 na 212 Kč/ks, tedy **o 6 %**. Materiál vysvětluje **60 % celkového zvýšení nákladů**, protože představuje 12 Kč z celkové odchylky 20 Kč. Výrobní režie vzrostla procentuálně rychleji, ale materiál má větší korunový dopad.

> Procenta ukazují relativní změnu položky. Koruny ukazují její dopad na celkový výsledek.

**Dopad do kalkulovaného zisku** — Prodejní cena zůstává **500 Kč/ks**.

| Ukazatel | Plán | Skutečnost |
| --- | ---: | ---: |
| Prodejní cena | 500 Kč | 500 Kč |
| Úplné náklady | 400 Kč | 420 Kč |
| **Kalkulovaný zisk** | **100 Kč** | **80 Kč** |

`Zvýšení nákladů = (420 − 400) / 400 × 100 = 5 %`; `Pokles kalkulovaného zisku = (100 − 80) / 100 × 100 = 20 %`

Stejná změna o 20 Kč představuje jiné procento podle toho, k jakému základu ji vztáhneme. **Co samotné porovnání ještě nevysvětluje** — Zvýšení materiálových nákladů o 12 Kč/ks může způsobit: vyšší cena materiálu; vyšší spotřeba na výrobek; kombinace obou vlivů. Podobně vyšší přiřazená režie na kus může souviset se změnou celkové režie, objemu výroby nebo využití rozvrhové základny. Podrobný rozklad těchto příčin následuje v kapitole 5.

### 4.4 Strojní hodinová sazba a seřizování CNC

**Pojmy:** strojní hodinová sazba = *machine-hour rate*; produktivní strojní hodiny = *productive machine hours*; seřízení = *setup / changeover*; výrobní dávka = *production batch / lot size*. Sazba musí mít jasně vymezené náklady, hodiny a způsob alokace, aby se režie nezapočítala dvakrát.

`Plánovaná strojní sazba = plánované fixní náklady / plánované produktivní hodiny + variabilní náklady na hodinu`. **Příklad:** fixní náklady stroje 2 mil. Kč/rok, 4 000 plánovaných produktivních hodin a variabilní náklad 200 Kč/h → sazba `2 000 000 / 4 000 + 200 = 700 Kč/h`. Při skutečných 3 000 h vzniknou náklady `2 000 000 + 3 000 × 200 = 2 600 000 Kč`, skutečně `866,67 Kč/produktivní h`. Plánovaná kalkulační sazba může zůstat 700 Kč/h; rozdíl souvisí s využitím kapacity, nikoli se změnou variabilní sazby.

**Nevyužitá fixní kapacita:** pokud fixní náklady 2 mil. Kč rozvrhujeme plánovanou sazbou 500 Kč/h, při skutečně využitých 3 000 produktivních hodinách pokryjeme pouze 1,5 mil. Kč → `500 000 Kč` fixní režie zůstává při této metodice nepokryto. Jde o kalkulační odchylku, nikoli automatický nový peněžní výdaj; při analýze rozlišuj odchylku objemu a skutečné výše režie.

**Seřizování dávky:** 3 h × 600 Kč/h / 500 kusů = **3,60 Kč/ks**. Menší dávka 250 ks při stejném seřízení znamená **7,20 Kč/ks**. Větší dávky snižují seřízení na kus, mohou ale zvětšit zásoby a vázaný kapitál.

**Kompletní kalkulace hřídele:** materiál 180 Kč; nástroje 20 Kč; CNC 12 min × 600 Kč/h = 120 Kč; ruční dokončování 6 min × 300 Kč/h = 30 Kč; seřízení 3,60 Kč; ostatní výrobní režie 40 Kč → **393,60 Kč/ks**. Prodejní cena 450 Kč → rozdíl **56,40 Kč/ks** a při 10 000 prodaných kusech 564 000 Kč před dalšími případnými náklady. Pro schválení ověř další zákaznické, obchodní a logistické náklady, rozsah fixní režie a kapacitní možnosti.

### 4.5 Rozhodovací kalkulace versus úplné náklady

Úplné náklady pomáhají dlouhodobě ověřit pokrytí všech nákladů. Pro jednorázovou objednávku nebo náhradní výrobu jsou rozhodující **budoucí rozdílové náklady a výnosy**; alokovanou fixní režii, která se rozhodnutím nezmění, nepočítej jako nový výdaj. **Příklad:** zakázka 300 ks za 750 Kč, variabilní náklady 600 Kč/ks, víkendové příplatky 35 000 Kč a dodatečné seřízení 15 000 Kč → `300 × (750 − 600) − 35 000 − 15 000 = −5 000 Kč`. Kladný CM na kus zde nestačí; dodatečná zakázka jako celek je ztrátová. Ověř také vytlačení jiných zakázek a možnost získat jiný ekonomický přínos.

## 5. Plán, skutečnost a odchylky

**Pojmy:** plán = *plan*; skutečnost = *actuals*; odchylka = *variance*; analýza odchylek = *variance analysis*; příznivá odchylka = *favourable variance*; nepříznivá odchylka = *adverse / unfavourable variance*. Analýza odchylek vysvětluje rozdíl mezi plánem a skutečností. Nestačí určit, o kolik jsou náklady vyšší nebo nižší. Potřebujeme rozlišit příčiny a jejich dopady. Základní postup:

1. Ověřit správnost a úplnost dat.
2. Zohlednit skutečný objem a sortiment výroby.
3. Oddělit vlivy ceny, spotřeby, času a sazeb.
4. S odpovědnými útvary ověřit provozní příčiny.
5. Doporučit opatření a aktualizovat prognózu.

### 5.1 Srovnatelnost

**Pojmy:** výrobkový mix = *product mix*; norma = *standard*; normované množství pro skutečnou výrobu = *standard quantity allowed for actual output*. Před hodnocením si ověř: Plánovaný a skutečný objem dobré výroby. Výrobkový mix, náročnost a změny výrobních postupů. Změnu nedokončené výroby a způsob evidence výkonů. Stejné období, jednotky, rozsah nákladů a úplnost dat. **Vyšší celkové náklady nemusí znamenat nehospodárnost.** Mohou odpovídat většímu objemu nebo nákladnějšímu sortimentu.

**Tři různé částky**

| Hodnota | Význam |
| --- | --- |
| Původní plán | Kolik měla stát původně plánovaná výroba |
| Plán přepočtený na skutečnou výrobu | Kolik měla skutečná výroba stát podle původních norem a cen |
| Skutečnost | Kolik skutečná výroba opravdu stála |

**Přepočtený plán je stále plán, nikoli skutečnost.** Původní rozpočet nepřepisujeme; vytváříme vedle něj srovnávací hodnotu. Přepočtem měníme objem a případně skladbu výroby, na které použijeme normy. Nezvyšujeme normu jen proto, že skutečná spotřeba byla vyšší. **Příklad srovnání při stejném objemu** — Plán výroby: 400 kusů. Skutečnost: 500 dobrých kusů. Norma: 3 kg materiálu na kus. Plánovaná cena: 40 Kč/kg. Rozpracovanost se nemění.

`Původní plán = 400 × 3 × 40 = 48 000 Kč`; `Plán pro skutečnou výrobu = 500 × 3 × 40 = 60 000 Kč`

Rozdíl **12 000 Kč** odpovídá pouze vyššímu objemu. Pro hodnocení nákladů při stejném objemu porovnáváme skutečné náklady s **60 000 Kč**, protože obě hodnoty se vztahují k 500 kusům. **Znaménka nákladových odchylek** — V této kapitole používáme:

`Nákladová odchylka = skutečnost − srovnávací základ`

| Výsledek | Význam |
| --- | --- |
| Kladná odchylka | Překročení nákladů — nepříznivý vliv |
| Záporná odchylka | Náklady pod srovnávacím základem — příznivý vliv |
| Nulová odchylka | Celkové náklady odpovídají základu; jednotlivé vlivy se ale mohly vyrušit |

Firma může používat opačná znaménka. Vždy ověř metodiku. Používej raději slova **příznivá a nepříznivá** než „pozitivní a negativní“, která lze zaměnit se znaménkem.

### 5.2 Flexibilní rozpočet

**Anglicky:** flexibilní rozpočet = *flexible budget*; rozpočet přepočtený na skutečný objem = *flexed budget*. Přepočítává plán na skutečný rozsah činnosti:

`Flexibilní rozpočet = plánovaná fixní část + plánovaná variabilní sazba × skutečný rozsah činnosti`

Fixní část ponecháváme stejnou, pokud zůstáváme v rozsahu kapacity, pro který platí. Variabilní část přepočítáváme plánovanou sazbou.

**Příklad: vyšší provoz**

| Položka | Hodnota |
| --- | ---: |
| Plánovaná fixní část údržby | 45 000 Kč |
| Plánovaná variabilní sazba | 30 Kč/strojovou hodinu |
| Plánovaný provoz | 1 500 hodin |
| Skutečný provoz | 1 800 hodin |

`Původní rozpočet = 45 000 + 30 × 1 500 = 90 000 Kč`; `Přepočtený rozpočet = 45 000 + 30 × 1 800 = 99 000 Kč`

Pokud skutečné náklady činí 108 000 Kč:

| Vliv | Dopad |
| --- | ---: |
| Vyšší provoz: 99 000 − 90 000 | +9 000 Kč |
| Odchylka proti přepočtenému rozpočtu: 108 000 − 99 000 | +9 000 Kč |
| **Celkové překročení původního rozpočtu** | **+18 000 Kč** |

Prvních 9 000 Kč vysvětluje větší rozsah provozu. Druhých 9 000 Kč potřebujeme vysvětlit například cenami dílů nebo mimořádnou opravou. **Přepočtený rozpočet není povinná skutečná částka** — Skutečnost může být nad přepočteným rozpočtem i pod ním. Pokud by skutečné náklady byly 95 000 Kč:

`90 000 původní plán + 9 000 plánovaný dopad vyššího provozu − 4 000 příznivá nákladová odchylka = 95 000 Kč skutečnost`

Náklady by byly o 5 000 Kč nad původním plánem, ale o 4 000 Kč pod rozpočtem odpovídajícím skutečnému provozu. **Nižší náklady nemusí znamenat úsporu** — Při skutečném provozu pouze 1 200 hodin:

`Přepočtený rozpočet = 45 000 + 30 × 1 200 = 81 000 Kč`

Pokud skutečnost činí 85 000 Kč: Proti původnímu plánu 90 000 Kč jsme o 5 000 Kč níže. Proti přepočtenému rozpočtu 81 000 Kč jsme o 4 000 Kč výše. Nižší celková částka tedy sama o sobě nedokazuje úsporu. **Prověřujeme také příznivé odchylky** — Náklady pod přepočteným rozpočtem mohou znamenat:

- skutečnou úsporu;
- levnější vstupy při stejné kvalitě;
- méně potřebných oprav;
- odloženou údržbu;
- chybějící fakturu nebo nezachycený náklad;
- chybu v datech.

Hloubka prověření má odpovídat významnosti a opakování odchylky.

> Nejprve konstatuj příznivou odchylku. Za skutečnou úsporu ji označ až po ověření příčiny.

### 5.3 Odchylky materiálu

**Pojmy:** spotřební odchylka materiálu = *material usage variance / material quantity variance*; cenová odchylka = *material price variance*. Rozlišujeme: **Spotřebu:** kolik materiálu jsme použili proti normě pro skutečnou výrobu. **Cenu:** kolik stála jednotka skutečně spotřebovaného materiálu proti plánu. **Značení a vzorce** — **Qₐ:** skutečně spotřebované množství materiálu. **Qₛ:** normované množství pro skutečnou výrobu. **Pₐ:** skutečná cena za jednotku materiálu. **Pₛ:** plánovaná cena za jednotku materiálu.

`Spotřební odchylka = (Qₐ − Qₛ) × Pₛ`; `Cenová odchylka = Qₐ × (Pₐ − Pₛ)`; `Celková odchylka = Qₐ × Pₐ − Qₛ × Pₛ`; `Celková odchylka = spotřební odchylka + cenová odchylka`

Normované množství není automaticky původně plánovaná spotřeba. Počítáme ho pro skutečně dosaženou výrobu.

**Příklad: vyšší spotřeba i cena**

- Skutečná výroba: 600 dobrých kusů.
- Norma: 4 kg/ks.
- Plánovaná cena: 50 Kč/kg.
- Skutečná spotřeba: 2 520 kg.
- Skutečná cena: 55 Kč/kg.
- Rozpracovanost se nemění.

`Normované množství = 600 × 4 = 2 400 kg`; `Normované náklady = 2 400 × 50 = 120 000 Kč`

| Vliv | Výpočet | Dopad |
| --- | --- | ---: |
| Vyšší spotřeba | (2 520 − 2 400) × 50 | +6 000 Kč |
| Vyšší cena | 2 520 × (55 − 50) | +12 600 Kč |
| **Celkem** |  | **+18 600 Kč** |

Kontrola:

`Skutečné náklady = 2 520 × 55 = 138 600 Kč`; `138 600 − 120 000 = 18 600 Kč`

**Proč spotřebu oceňujeme plánovanou cenou?** — Postupujeme přes tři částky:

| Krok | Náklady |
| --- | ---: |
| Normovaná spotřeba × plánovaná cena | 120 000 Kč |
| Skutečná spotřeba × plánovaná cena | 126 000 Kč |
| Skutečná spotřeba × skutečná cena | 138 600 Kč |

Nejprve měníme pouze množství, potom cenu. Pokud bychom nadspotřebu 120 kg ocenili skutečnými 55 Kč, dostali bychom 6 600 Kč. To už obsahuje také zdražení těchto 120 kg o 600 Kč. Těchto 600 Kč je ale zahrnuto v cenové odchylce 12 600 Kč. Při použití našich vzorců bychom je započítali dvakrát.

> Spotřebu měníme při plánované ceně. Cenu měníme při skutečné spotřebě.

Jde o jeden konzistentní způsob rozkladu. Nemíchej jednotlivé části s jinou metodou. **Odchylky se mohou vyrušit** — Normované množství 1 500 kg za 80 Kč/kg, skutečnost 1 600 kg za 75 Kč/kg:

`Spotřební odchylka = 100 × 80 = +8 000 Kč`; `Cenová odchylka = 1 600 × (75 − 80) = −8 000 Kč`; `Celková odchylka = 0 Kč`

Celkové náklady odpovídají normě, ale vyšší spotřebu vyrovnala nižší cena. Upozorníme na oba vlivy a ověříme jejich příčiny i možnou souvislost.

**Co prověřovat**

| Odchylka | Možné příčiny k ověření |
| --- | --- |
| Spotřební | Zmetkovitost, kvalita materiálu, odpad, nastavení stroje, norma, evidence výdejů |
| Cenová | Dodavatel, množstevní podmínky, doprava, kurz, změna specifikace |

Výpočet ukazuje velikost vlivu, nikoli automaticky jeho příčinu nebo odpovědného viníka. Zde analyzujeme cenu spotřebovaného materiálu. Samostatná analýza nákupních cen může pracovat s nakoupeným množstvím a jiným okamžikem zachycení.

**Spojení objemu, spotřeby a ceny**

- Plán: 400 kusů.
- Skutečnost: 500 dobrých kusů.
- Norma: 3 kg/ks.
- Plánovaná cena: 40 Kč/kg.
- Skutečná spotřeba: 1 550 kg.
- Skutečná cena: 42 Kč/kg.

| Krok | Dopad | Průběžná částka |
| --- | ---: | ---: |
| Původní plán: 400 × 3 × 40 | — | 48 000 Kč |
| Vyšší objem: 100 × 3 × 40 | +12 000 Kč | 60 000 Kč |
| Nadspotřeba: (1 550 − 1 500) × 40 | +2 000 Kč | 62 000 Kč |
| Vyšší cena: 1 550 × (42 − 40) | +3 100 Kč | **65 100 Kč** |

Proti původnímu plánu jsou náklady vyšší o **17 100 Kč**. Proti plánu přepočtenému na skutečnou výrobu jsou vyšší o **5 100 Kč**. Pro posouzení nákladů při stejném objemu porovnáváme **60 000 Kč a 65 100 Kč**.

### 5.4 Odchylky výrobních mezd

**Pojmy:** odchylka pracnosti = *labour efficiency variance*; odchylka hodinové sazby = *labour rate variance*; normované hodiny pro skutečnou výrobu = *standard hours allowed for actual output*. Princip je stejný jako u materiálu:

| Materiál | Práce |
| --- | --- |
| Množství v kg | Čas v člověkohodinách |
| Cena za kg | Nákladová sazba za hodinu |

Pomůcka: **Pracnost = kolik hodin.**; **Sazba = kolik korun za hodinu.**

**Vzorce**

`Normované hodiny = skutečná výroba × norma času na kus`; `Odchylka pracnosti = (skutečné hodiny − normované hodiny pro skutečnou výrobu) × plánovaná hodinová sazba`; `Odchylka sazby = skutečné hodiny × (skutečná sazba − plánovaná sazba)`; `Celková odchylka = skutečné mzdové náklady − normované mzdové náklady`

Hodiny a náklady musí mít stejný rozsah. Nákladová sazba může podle metodiky zahrnovat i další související osobní náklady; není automaticky totožná s hodinovou mzdou zaměstnance. **Příklad: více hodin a vyšší sazba** — Skutečná výroba: 800 dobrých kusů. Norma: 0,4 hodiny/ks. Plánovaná sazba: 250 Kč/hod. Skutečný čas: 350 hodin. Skutečná sazba: 270 Kč/hod.

`Normované hodiny = 800 × 0,4 = 320 hodin`; `Normované náklady = 320 × 250 = 80 000 Kč`

| Příčina | Výpočet | Dopad |
| --- | --- | ---: |
| Více hodin | (350 − 320) × 250 | +7 500 Kč |
| Vyšší sazba | 350 × (270 − 250) | +7 000 Kč |
| **Celkem** |  | **+14 500 Kč** |

Kontrola:

`Skutečnost = 350 × 270 = 94 500 Kč`; `94 500 − 80 000 = 14 500 Kč`

Stejně jako u materiálu měníme nejprve čas při plánované sazbě a potom sazbu při skutečných hodinách. **Více hodin nemusí znamenat pomalejší práci** — Pokud evidence potvrdí: 320 hodin samotné práce; 30 hodin placeného čekání při poruše pak překročení času vysvětluje prostoj. Samotná práce odpovídá normě. S údržbou dále ověříme příčinu poruchy, její opakování a možnosti prevence. Bez evidence času a provozních podkladů příčinu pouze odhadujeme. Překročení hodin není automaticky důkazem nízkého výkonu pracovníků.

**Méně hodin může doprovázet vyšší sazba**

| Údaj | Norma / plán | Skutečnost |
| --- | ---: | ---: |
| Čas | 400 hodin | 380 hodin |
| Sazba | 200 Kč/hod. | 220 Kč/hod. |

`Odchylka pracnosti = (380 − 400) × 200 = −4 000 Kč`; `Odchylka sazby = 380 × (220 − 200) = +7 600 Kč`; `Celkem = +3 600 Kč`

Možné vysvětlení: zkušenější, ale dražší pracovníci zvládli výrobu rychleji. To je hypotéza k ověření, nikoli závěr ze samotných čísel. **Rozlišení obou odchylek** — Pokud se sazba nezmění, odchylka sazby je nulová bez ohledu na počet hodin. Pokud skutečné hodiny odpovídají normě, odchylka pracnosti je nulová bez ohledu na sazbu.

### 5.5 Rozklad změny zisku

**Anglicky:** rozklad změny zisku = *profit bridge / profit variance analysis*. Rozklad vysvětluje přechod od plánovaného zisku ke skutečnému výsledku podle jednotlivých příčin. Při rozkladu zisku rozlišujeme původní plánovaný zisk a očekávaný zisk při skutečném objemu prodeje, ale plánovaných nákladových podmínkách. Výsledek může být lepší než původní plán, a přesto horší, než by odpovídalo skutečnému prodeji. Vždy proto uvádíme, vůči jakému základu odchylku hodnotíme. **Pozor na znaménka:**

| Nákladová odchylka | Dopad do zisku |
| --- | --- |
| Překročení nákladů +12 000 Kč | Snížení zisku −12 000 Kč |
| Náklady pod normou −4 000 Kč | Zvýšení zisku +4 000 Kč |

**Příklad**

| Údaj | Plán | Skutečnost před nákladovými odchylkami |
| --- | ---: | ---: |
| Vyrobené a prodané množství | 1 200 ks | 1 000 ks |
| Cena | 600 Kč/ks | 600 Kč/ks |
| Variabilní náklady | 350 Kč/ks | 350 Kč/ks |
| Fixní náklady | 180 000 Kč | 180 000 Kč |

Plánovaný příspěvek je **250 Kč/ks**.

`Plánovaný zisk = 1 200 × 250 − 180 000 = 120 000 Kč`; `Dopad nižšího prodeje = (1 000 − 1 200) × 250 = −50 000 Kč`; `Zisk při nižším prodeji a plánovaných nákladech = 120 000 − 50 000 = 70 000 Kč`

Dále zjistíme: Materiálové náklady překročily normu pro skutečnou výrobu o 12 000 Kč. Mzdové náklady byly proti normě pro skutečnou výrobu o 4 000 Kč nižší.

| Příčina | Dopad na zisk |
| --- | ---: |
| Plánovaný zisk | 120 000 Kč |
| Nižší prodej | −50 000 Kč |
| Vyšší materiálové náklady | −12 000 Kč |
| Nižší mzdové náklady | +4 000 Kč |
| **Skutečný zisk** | **62 000 Kč** |

`Celkové zhoršení proti plánu = −50 000 − 12 000 + 4 000 = −58 000 Kč`

**Správná interpretace**

> Skutečný provozní zisk dosáhl 62 000 Kč, tedy o 58 000 Kč méně než plánovaných 120 000 Kč. Nižší prodej o 200 kusů snížil zisk o 50 000 Kč a vyšší materiálové náklady o dalších 12 000 Kč. Nižší mzdové náklady pokles částečně vyrovnaly příznivým dopadem 4 000 Kč.

**O 50 000 Kč neklesl prodej, ale zisk v důsledku nižšího prodeje.** Prodané množství kleslo o 200 kusů. Materiálové a mzdové odchylky porovnáváme s normou pro skutečnou výrobu. Vliv objemu tak nezapočítáme podruhé. Předpoklady příkladu: Všechny vyrobené kusy se prodaly a zásoby se nemění. Prodejní cena a fixní náklady zůstaly stejné. Mzdová odchylka představuje rozdíl nákladů zahrnutých do použitého modelu; nejde automaticky o peněžní úsporu. Ostatní vlivy nejsou přítomné. Analýza prodejních odchylek může patřit jinému controllerovi. Výrobní controller potřebuje znát její relevantní dopad a souvislost s výrobou.

### 5.6 EBITDA bridge — propojení výrobních odchylek s výsledkem

**Pojmy:** můstek EBITDA = *EBITDA bridge / EBITDA waterfall*; dopad na zisk = *profit impact*. Jde o vysvětlení změny finančního výsledku mezi rozpočtem a skutečností; **nepříznivá nákladová odchylka má záporný dopad na EBITDA**.

| Položka | Dopad |
| --- | ---: |
| Budget EBITDA | 8 000 000 Kč |
| Materiálová cenová odchylka | −150 000 Kč |
| Materiálová spotřební odchylka | −250 000 Kč |
| Pracovní efektivita | −100 000 Kč |
| Úspora energie | +80 000 Kč |
| Vyšší prodejní objem — dodatečný CM | +600 000 Kč |
| **Actual EBITDA** | **8 180 000 Kč** |

`Celkový dopad = −150 −250 −100 +80 +600 = +180 tis. Kč`. **Lepší EBITDA automaticky nedokazuje efektivnější výrobu:** pozitivní vliv prodeje může zakrýt nadspotřebu. Materiálové a pracovní odchylky porovnávej se standardem pro skutečný objem; prodejní objem oceň plánovaným CM. Výslovně ověř, že se jednotlivé vlivy nepřekrývají.

**Ovlivnitelnost (*controllability*):** úspora energie může vzniknout levnější nakoupenou kWh (cenový vliv), nižší spotřebou kWh (technický/provozní vliv) nebo objemem výroby. Rozhodování a odpovědnost se řídí skutečnými pravomocemi nákupu, výroby, technologie a údržby; nevkládej každou energetickou odchylku automaticky na výrobního ředitele.

### 5.7 Variance fixní výrobní režie — jednoduchý rozklad

**Pojmy:** odchylka výdajů fixní režie = *fixed overhead spending variance*; odchylka objemu fixní režie = *fixed overhead volume variance*; absorpce = *overhead absorption*. **Příklad:** plán fixní režie 1 mil. Kč a 5 000 normohodin → sazba 200 Kč/h. Skutečný objem výroby odpovídá 4 000 normohodinám, skutečná fixní režie 1 050 000 Kč.

| Vliv | Výpočet | Nepříznivá odchylka |
| --- | --- | ---: |
| Výdajová | 1 050 000 − 1 000 000 | 50 000 Kč |
| Objemová / nepokrytí režie | 1 000 000 − (4 000 × 200) | 200 000 Kč |
| **Celkem vůči absorbované režii** | 1 050 000 − 800 000 | **250 000 Kč** |

Objemová část představuje přiřazení fixní režie na nižší výkon, nikoli další útratu 200 000 Kč. Nákladový dopad do výsledovky závisí na ocenění zásob a metodice uzávěrky; neodečítej automaticky tutéž částku podruhé v EBITDA bridge.

## 6. Výrobní ukazatele a kapacita

### 6.1 Produktivita práce

**Pojmy:** produktivita práce = *labour productivity*; člověkohodiny = *labour hours / person-hours*; normohodiny = *standard hours*. Produktivita vyjadřuje, kolik výstupu získáme za jednotku práce.

`Produktivita = dobré kusy / člověkohodiny`; `Člověkohodiny = součet odpracovaných hodin všech zahrnutých pracovníků`

Například 5 pracovníků pracujících 8 hodin představuje **40 člověkohodin**. Není to totéž jako 8 hodin provozu stroje. **Porovnání směn** — Obě směny vyrábějí stejný výrobek za srovnatelných podmínek.

| Směna | Dobré kusy | Člověkohodiny | Produktivita |
| --- | ---: | ---: | ---: |
| A | 720 | 80 | **9 ks/člověkohodinu** |
| B | 840 | 105 | **8 ks/člověkohodinu** |

Směna B vyrobila více kusů, ale má nižší produktivitu. Samotný objem výroby tedy k hodnocení nestačí. Při produktivitě A by směna B potřebovala:

`Potřebné člověkohodiny = dobré kusy / produktivita`; `840 / 9 ≈ 93,33 člověkohodiny`; `Rozdíl = 105 − 93,33 ≈ 11,67 člověkohodiny`

Rozdíl představuje **potenciál ke zlepšení**, nikoli automaticky chybu pracovníků nebo peněžní úsporu. Nejprve ověř například prostoje, zaučování, organizaci práce a podmínky výroby. **Získaný čas versus peněžní úspora** — Pokud pracovníci dostanou stejnou mzdu a získaný čas se nevyužije, samotné zkrácení práce nemusí snížit náklady. Ekonomický přínos může vzniknout například: omezením placených přesčasů; omezením externí výroby; další výrobou, kterou dokážeme prodat. Porovnávej stejný výrobek a srovnatelné podmínky. U různého sortimentu lze místo prostého počtu kusů použít například normohodiny dobré výroby vůči skutečným hodinám. **Člověkohodiny a strojové hodiny nezaměňuj.**

### 6.2 Prostoje

**Pojmy:** prostoj = *downtime*; porucha = *breakdown*; čas čekání pracovníků = *idle time*; přestavba či seřízení mezi výrobami = *changeover / setup*. Prostoj znamená, že zařízení po určitou dobu nevyrábí. Porucha je jednou z možných příčin. Další příčiny mohou být: čekání na materiál; chybějící dokumentace; chybějící obsluha; seřizování nebo přestavba — podle vymezené metodiky. Eviduj dobu, příčinu, stroj či linku, zakázku a dotčené pracovníky. **Čas stroje a čas lidí** — Stroj stojí 2 hodiny a všichni 3 pracovníci jeho obsluhy po celou dobu čekají:

`Prostoj stroje = 2 hodiny`; `Čekání pracovníků = 2 × 3 = 6 člověkohodin`

Pokud pracovníci během poruchy dělají jinou práci, nelze celý čas automaticky označit za čekání. **Nákladový dopad poruchy** — Při nákladu 280 Kč na placenou člověkohodinu a opravě za 4 500 Kč:

| Dopad | Výpočet | Částka |
| --- | --- | ---: |
| Placené čekání | 6 × 280 | 1 680 Kč |
| Oprava stroje | Zadáno | 4 500 Kč |
| **Celkem** |  | **6 180 Kč** |

Jde o dva různé dopady, proto je můžeme sečíst. Porucha může způsobit také zmetky, přesčasy nebo ztrátu prodejné výroby. Dopady odděluj a nepočítej dvakrát stejnou ztrátu. **Odstranění poruchy nemusí přinést peněžní úsporu celých 6 180 Kč.** Pokud mzdy zůstanou stejné, získáme místo čekání využitelný pracovní čas. Jeho přínos záleží na využití.

### 6.3 Zmetkovitost

**Pojmy:** zmetkovitost = *defect rate / reject rate*; vyřazený materiál či kusy = *scrap*; přepracování = *rework*; dobré kusy = *good units*. *Scrap rate* označuje podíl definitivně vyřazených kusů. Není vždy totožný s podílem všech vadných kusů, protože některé lze opravit.

`Zmetkovitost = vadné kusy / všechny vyrobené kusy × 100 %`; `Podíl dobrých kusů = dobré kusy / všechny vyrobené kusy × 100 %`

**Příklad výroby a dovýroby** — Vyrobili jsme **1 200 kusů**, z toho **60 vadných**:

`Zmetkovitost = 60 / 1 200 × 100 = 5 %`; `Dobré kusy = 1 200 − 60 = 1 140 kusů`

Předpokládáme: všech 60 vadných kusů musíme vyřadit; každý kus už spotřeboval materiál za 150 Kč a variabilní práci za 50 Kč; vyřazené kusy nemají zbytkovou hodnotu; náhradní výroba proběhne bez dalších vad; režii zatím vynecháváme.

`Variabilní náklad na vyrobený kus = 150 + 50 = 200 Kč`; `Náklady vyřazených kusů = 60 × 200 = 12 000 Kč`

Zákazník potřebuje 1 200 dobrých kusů. Musíme proto dovyrobit 60 kusů za dalších 12 000 Kč. **Proč není navýšení nákladů 24 000 Kč?** — Vadné kusy a jejich náhrada skutečně stojí dohromady **24 000 Kč**. Pro posouzení zvýšení nákladů ale porovnáváme stejný výsledek: získání 1 200 dobrých kusů.

| Část výroby | Bez vad | Se zmetky a náhradou |
| --- | ---: | ---: |
| Prvních 1 140 dobrých kusů | 228 000 Kč | 228 000 Kč |
| Dalších 60 dobrých kusů | 12 000 Kč | 12 000 Kč |
| 60 vyřazených kusů navíc | 0 Kč | 12 000 Kč |
| **Celkem na 1 200 dobrých kusů** | **240 000 Kč** | **252 000 Kč** |

Výroba 60 dobrých kusů by stála 12 000 Kč i bez zmetků. Kvůli zmetkům jsme navíc vynaložili 12 000 Kč na vyřazené kusy. Rozlišuj: **Náklady vadných kusů a jejich náhrady dohromady:** 24 000 Kč. **Zvýšení nákladů proti bezvadné výrobě:** 12 000 Kč.

**Náklady na dobrý kus**

`Celkem vyrobeno = 1 260 kusů`; `Dobré kusy = 1 200 kusů`; `Variabilní náklady = 1 260 × 200 = 252 000 Kč`; `Náklady na dobrý kus = 252 000 / 1 200 = 210 Kč`

Náklady vzrostly z 200 na **210 Kč za dobrý kus**. Zmetkovitost původní dávky byla 5 %. Po bezvadné dovýrobě je celkový podíl vadných kusů 60 / 1 260 ≈ 4,76 %. Vždy proto uváděj, ke které dávce nebo období se ukazatel vztahuje. **Pokud plán už počítá se ztrátami** — Plán na stejných 1 200 dobrých kusů obsahuje očekávané ztráty a činí 246 000 Kč.

`Odchylka proti plánu = 252 000 − 246 000 = +6 000 Kč`

| Srovnávací základ | Náklady navíc |
| --- | ---: |
| Bezvadná výroba za 240 000 Kč | 12 000 Kč |
| Plán včetně očekávaných ztrát za 246 000 Kč | 6 000 Kč |

Náklad zahrnutý do normy může být stále příležitostí ke zlepšení.

### 6.4 Kapacitní plán

**Pojmy:** kapacitní plánování = *capacity planning*; dostupná kapacita = *available capacity*; potřebná kapacita = *required capacity*; využití kapacity = *capacity utilisation*.

`Potřebné strojové hodiny = množství × normovaný čas stroje na kus`; `Rozdíl kapacity = potřebné hodiny − dostupné hodiny`

Kladný rozdíl znamená nedostatek kapacity. Záporný znamená rezervu. **Příklad** — Objednávka činí 1 800 kusů. Jeden kus potřebuje 0,4 strojové hodiny. Příští měsíc máme pro objednávku dostupných 600 hodin.

`Potřebná kapacita = 1 800 × 0,4 = 720 hodin`; `Chybějící kapacita = 720 − 600 = 120 hodin`

Pokud můžeme část výroby provést předem:

`Množství k předvýrobě = 120 / 0,4 = 300 kusů`

| Termín | Množství | Strojový čas |
| --- | ---: | ---: |
| Tento měsíc | 300 ks | 120 hodin |
| Příští měsíc | 1 500 ks | 600 hodin |
| **Celkem** | **1 800 ks** | **720 hodin** |

Předpokládáme dostatek materiálu a lidí, možnost skladování a žádné další vady.

**Ekonomické porovnání variant**

| Varianta | Dodatečné náklady |
| --- | ---: |
| Výroba předem: skladování a financování | 8 000 Kč |
| Výroba později: dodatečný přesčasový náklad | 18 000 Kč |

Pokud jsou ostatní náklady a podmínky stejné, výroba předem je levnější o **10 000 Kč**. Kapacitu ověřuj po rozhodujících pracovištích. Dostatek hodin jednoho stroje nestačí, pokud chybí lidé, materiál nebo navazující operace.

### 6.5 Úzké místo

**Pojmy:** úzké místo = *bottleneck*; omezující faktor = *limiting factor / constraint*; příspěvek na hodinu úzkého místa = *contribution per bottleneck hour*. Úzké místo je zdroj, jehož omezená kapacita brání vyrobit vše, co bychom mohli prodat. Při jediném omezeném zdroji porovnávej příspěvek na jeho jednotku:

`Příspěvek na hodinu úzkého místa = příspěvek na kus / čas úzkého místa na kus`

| Výrobek | Cena | Variabilní náklady | Příspěvek/ks | Čas stroje/ks | Příspěvek/hod. |
| --- | ---: | ---: | ---: | ---: | ---: |
| A | 650 Kč | 410 Kč | 240 Kč | 0,5 hod. | **480 Kč** |
| B | 900 Kč | 540 Kč | 360 Kč | 1 hod. | **360 Kč** |

B má vyšší příspěvek na kus, ale A přináší více za hodinu omezeného stroje. Při dostatečné poptávce a uvedených podmínkách dáme přednost A. **Omezení poptávkou** — Máme 120 hodin stroje a zákazníci odeberou maximálně 160 kusů A. Poptávka po B je dostatečná.

| Výrobek | Množství | Čas | Příspěvek celkem |
| --- | ---: | ---: | ---: |
| A | 160 ks | 80 hodin | 38 400 Kč |
| B | 40 ks | 40 hodin | 14 400 Kč |
| **Celkem** |  | **120 hodin** | **52 800 Kč** |

Další A už nemáme komu prodat, proto zbývající čas využijeme na B. **Vyplatí se získat další kapacitu?** — Můžeme získat dalších 10 hodin za dodatečný náklad 2 500 Kč. Vyrobíme a prodáme dalších 10 kusů B.

`Dodatečný příspěvek = 10 × 360 = 3 600 Kč`; `Změna zisku = 3 600 − 2 500 = +1 100 Kč`

Kontrola přes celé částky:

`10 × 900 tržby − 10 × 540 běžné variabilní náklady − 2 500 dodatečná kapacita = +1 100 Kč`

Příspěvek 360 Kč/ks už zahrnuje odečtení běžných variabilních nákladů. Není dalším nákladem. Pokud by kapacita stála 4 000 Kč:

`Změna zisku = 3 600 − 4 000 = −400 Kč`

Stávající fixní náklady se podle zadání nemění. Přednost podle příspěvku na hodinu platí bez dalších významných omezení, smluvních závazků nebo nákladů změny výroby. Při více omezených zdrojích samotné pořadí podle jedné sazby nemusí stačit.

### 6.6 OEE — celková efektivnost zařízení

**Pojmy:** OEE = *Overall Equipment Effectiveness*; dostupnost = *availability*; výkon = *performance*; kvalita = *quality*; ideální čas cyklu = *ideal cycle time*. OEE propojuje tři oblasti výrobních ztrát:

| Složka | Otázka |
| --- | --- |
| Dostupnost | Jakou část plánovaného výrobního času stroj běžel? |
| Výkon | Jak rychle během provozu vyráběl proti ideální rychlosti? |
| Kvalita | Jaký podíl vyrobených kusů byl dobrý? |

`Dostupnost = skutečná doba provozu / plánovaný výrobní čas`; `Výkon = skutečný celkový počet kusů / ideální počet kusů za skutečnou dobu provozu`; `Kvalita = dobré kusy / celkový počet kusů`; `OEE = dostupnost × výkon × kvalita`

Dostupnost je složka OEE; obecné využití kapacity je jiný ukazatel.

**Příklad jedné směny**

- Plánovaný výrobní čas: 8 hodin.
- Prostoje: 2 hodiny.
- Skutečná doba provozu: 6 hodin.
- Ideální rychlost: 20 kusů/hod.
- Celkem vyrobeno: 108 kusů.
- Vadné kusy: 6.
- Dobré kusy: 102.

| Složka | Výpočet | Výsledek |
| --- | --- | ---: |
| Dostupnost | 6 / 8 | **75 %** |
| Výkon | 108 / (6 × 20) | **90 %** |
| Kvalita | 102 / 108 | **94,44 %** |
| **OEE** | 0,75 × 0,90 × (102 / 108) | **63,75 %** |

Výkon počítáme pouze za dobu, kdy stroj běžel. Prostoje jsme už zachytili v dostupnosti. Pro přesnost používej při násobení původní hodnoty a zaokrouhli až konečný výsledek. **Kontrola přímým výpočtem** — Pro jediný výrobek se stejnou ideální rychlostí:

`Ideální výstup za plánovaný čas = 8 × 20 = 160 kusů`; `OEE = 102 dobrých kusů / 160 ideálních kusů = 63,75 %`

Výsledek znamená, že v dobrých kusech jsme získali 63,75 % ideálního výstupu za vymezený plánovaný čas. **Zlepšení dostupnosti** — Pokud prostoje zkrátíme ze 2 hodin na 1 hodinu, stroj poběží 7 hodin.

`Nová dostupnost = 7 / 8 = 87,5 %`

Při zachování výkonu 90 % a stejného podílu dobrých kusů:

`Nové OEE = 0,875 × 0,90 × (102 / 108) = 74,375 % ≈ 74,38 %`; `Zlepšení OEE = 74,375 − 63,75 = 10,625 procentního bodu ≈ 10,63 procentního bodu`

Získali jsme jednu hodinu provozu navíc. Jde o modelový propočet při nezměněném výkonu a kvalitě. **Vyšší OEE není automaticky vyšší zisk** — Ověř: zda další výrobu prodáme; zda máme materiál, pracovníky a navazující kapacity; zda získaný čas umožní omezit přesčasy nebo externí výrobu; kolik stojí opatření na zlepšení. Příklad: získaná hodina nahradí přesčasový provoz s dodatečným nákladem 900 Kč. Opatření stojí 300 Kč za směnu.

`Čistý přínos = 900 − 300 = 600 Kč za směnu`

Běžné náklady stejné výroby zůstávají. Ušetříme dodatečný přesčasový náklad. **Pravidla interpretace** — OEE vztahujeme k vymezenému plánovanému výrobnímu času, nikoli automaticky ke všem kalendářním hodinám. Musíme sjednotit definice času, ideální rychlosti a dobrého kusu. Příklad předpokládá jeden výrobek. Nejnižší složka je podnětem k prověření; prioritu opatření určí také odstranitelnost ztráty, náklady a ekonomický přínos. Souhrnné OEE nevytváříme prostým průměrem směnových procent. Vycházíme ze základních časů, množství a odpovídajících ideálních časů.

### 6.7 Finanční dopad OEE a prostojů

OEE je **provozní poměr, nikoli samo o sobě finanční ztráta**. Finanční efekt ztráty dostupnosti, výkonu či kvality záleží na úzkém místě, poptávce, možnosti nahradit výrobu a skutečně změněných nákladech.

**Příklad:** preventivní údržba obnoví 30 h/měsíc na úzkém místě; ideální cyklus 10 min/ks, poptávka stačí, všechny dodatečné kusy jsou dobré; CM 180 Kč/ks; údržba navíc 12 000 Kč/měsíc. `30 × 60 / 10 = 180 ks`; `180 × 180 = 32 400 Kč CM`; `čistý přínos = 32 400 − 12 000 = 20 400 Kč/měsíc`. Pokud nemáme odbyt nebo navazující operace je plná, dodatečný CM nemusí vzniknout.

**Cena prostoje není automaticky strojní sazba × prostoje.** Fixní odpisy zpravidla pokračují; variabilní provozní náklady mohou během poruchy odpadnout. Porovnávej varianty: ztracený prodej, přesčasy, přesun výroby, externí kooperace a skutečné náklady na odstranění příčiny. U OEE, scrapu a nadspotřeby pozor na dvojí finanční započtení stejné vady.

### 6.8 COPQ — celkové náklady na nekvalitu

**Pojmy:** COPQ = *Cost of Poor Quality*; COQ = *Cost of Quality*; náklady reklamací = *warranty / customer claims costs*; mimořádné třídění = *containment / sorting costs*; interní a externí selhání = *internal / external failure costs*. COPQ může zahrnovat scrap, rework, třídění a reklamace; širší COQ zahrnuje také prevenci a běžné ověřování kvality. Definice nákladů musí být konzistentní a bez duplicit.

| Modelový měsíční COPQ | Kč |
| --- | ---: |
| Scrap | 180 000 |
| Rework | 70 000 |
| Mimořádné třídění | 40 000 |
| Reklamace | 110 000 |
| **Celkem** | **400 000** |

Při tržbách 20 mil. Kč `COPQ / tržby × 100 = 2 %`. **Pokles zmetkovitosti ze 4 % na 2 % nemusí znamenat pokles COPQ o polovinu** — liší se počet kusů, jejich hodnota a další druhy nekvality.

**Rozhodnutí scrap vs. rework:** 500 neshodných dílů, šrot má výnos 20 Kč/ks; oprava stojí dodatečně 70 Kč/ks a po opravě lze díl prodat za 300 Kč. Scrap přinese 10 000 Kč, rework po dodatečných nákladech 115 000 Kč → **rework je o 105 000 Kč výhodnější**. Původní již vzniklé výrobní náklady se mezi variantami nemění; ověř technickou přípustnost opravy, zaručenou prodejnost a případné kapacitní omezení.

## 7. Zásoby a rozpracovaná výroba

### 7.1 Druhy zásob

**Pojmy:** zásoby = *inventory / stock*; materiál = *raw materials*; nedokončená výroba = *work in progress / work in process (WIP)*; hotové výrobky = *finished goods (FG)*; zboží k dalšímu prodeji = *merchandise*.

| Druh | Význam | Příklad |
| --- | --- | --- |
| Materiál | Vstup, který ještě nebyl spotřebován | Plech na skladě |
| Nedokončená výroba | Výrobky, na kterých už proběhla část výroby, ale ještě nejsou hotové | Držáky čekající na požadované lakování |
| Hotové výrobky | Dokončené vlastní výrobky připravené k prodeji | Nalakované a dokončené držáky |
| Zboží | Nakoupené předměty určené k dalšímu prodeji bez vlastní výroby | Nakoupené šrouby prodávané zákazníkům |

**Zásoby jsou vstupy i výstupy výroby.** Zařazení závisí na využití ve firmě. Stejný šroub může být materiálem pro výrobce sestav, hotovým výrobkem pro jeho výrobce a zbožím pro obchodníka. Hotové výrobky neoceňujeme prodejní cenou. Jejich nákladové ocenění vychází z příslušné účetní metodiky; případné znehodnocení posuzujeme samostatně.

### 7.2 Vyrobené versus prodané kusy

**Pojmy:** ocenění zásob = *inventory valuation*; účetní hodnota = *carrying amount / book value*; náklady prodaných výrobků = *cost of goods sold — COGS*. Rozlišujeme dvě otázky:

| Otázka | Co sledujeme |
| --- | --- |
| Kolik zdrojů výroba spotřebovala? | Náklady všech vyrobených kusů |
| Kolik z jejich hodnoty se promítne do výsledku přes prodej? | Náklady prodaných výrobků |

**Příklad** — Vyrobíme 500 držáků. Výrobní náklady zahrnované do ocenění zásob činí 280 Kč/ks. Prodáme 350 kusů. Předpokládáme nulovou počáteční zásobu, stejné jednotkové náklady a žádné jiné pohyby ani ztráty.

| Položka | Výpočet | Hodnota |
| --- | --- | ---: |
| Výrobní náklady všech kusů | 500 × 280 | **140 000 Kč** |
| Náklady prodaných výrobků | 350 × 280 | **98 000 Kč** |
| Zásoba zbývajících 150 kusů | 150 × 280 | **42 000 Kč** |

Kontrola:

`140 000 Kč výrobní náklady = 98 000 Kč prodané výrobky + 42 000 Kč zásoby`

**Celých 140 000 Kč představuje náklady uskutečněné výroby.** Při hodnocení hospodárnosti je porovnáváme s normovanými náklady všech 500 vyrobených kusů. Při hodnocení výsledku období ale rozlišujeme: 98 000 Kč připadá na prodané výrobky a zatíží výsledek; 42 000 Kč zůstává v hodnotě neprodaných výrobků. Hodnota zásoby není další náklad navíc. Je to část stejných výrobních nákladů, která zatím nepřešla do nákladů prodaných výrobků.

**Prodej v dalším měsíci** — Pokud příští měsíc nic nevyrobíme, ale prodáme zbývajících 150 kusů: do nákladů prodaných výrobků přejde **42 000 Kč**; zásoba těchto výrobků klesne na **0 Kč**. Náklady prodaných výrobků tedy mohou vzniknout i v měsíci, kdy nic nevyrábíme. Prodejní cena určuje tržby. Nákladovou hodnotu těchto kusů již známe. Při prodeji ji nezapočítáváme podruhé — převádíme ji ze zásob do nákladů prodaných výrobků.

### 7.3 Nedokončená výroba

**Pojmy:** stupeň dokončení = *degree of completion*; výrobní zakázka = *production order / manufacturing order*. Nedokončená výroba obsahuje výrobní náklady, které již vznikly na dosud nedokončených výrobcích. **Příklad rozpracovanosti** — Na konci měsíce máme 80 rozpracovaných kusů. Na každém: byl spotřebován celý materiál za 150 Kč; proběhla čtvrtina práce, jejíž celkové náklady na hotový kus mají být 120 Kč. Práce vzniká rovnoměrně a režii zatím vynecháváme.

`Dosavadní práce na kus = 120 × 25 % = 30 Kč`; `Hodnota rozpracovaného kusu = 150 + 30 = 180 Kč`; `Nedokončená výroba celkem = 80 × 180 = 14 400 Kč`

**Dokončení práce z 25 % neznamená 25 % všech nákladů.** Materiál už byl spotřebován celý. **Dokončení v příštím měsíci** — Na každý kus zbývá práce za 90 Kč:

| Položka | Výpočet | Hodnota |
| --- | --- | ---: |
| Počáteční nedokončená výroba | 80 × 180 | 14 400 Kč |
| Nové dokončovací práce | 80 × 90 | 7 200 Kč |
| **Hodnota dokončených výrobků** | 80 × 270 | **21 600 Kč** |

V příštím měsíci vzniknou nové výrobní náklady **7 200 Kč**. Původních 14 400 Kč pouze převedeme spolu s nimi z nedokončené výroby do hotových výrobků. **Dokončení není prodej a nevytváří tržby.** Samotný převod mezi kategoriemi zásob nevytváří další náklad. **Co kontroluje controller** — U dlouho rozpracované zakázky ověřuje s odpovědnými kolegy:

- fyzickou existenci a skutečný stav;
- stupeň rozpracovanosti;
- správnost přiřazených nákladů;
- datum poslední aktivity;
- důvod zastavení nebo zdržení;
- plán dokončení a budoucí využití či prodej.

Dlouhá rozpracovanost může být oprávněná, ale také může skrývat zastavenou zakázku nebo nesprávnou evidenci.

### 7.4 Znehodnocení zásob

**Pojmy:** čistá realizovatelná hodnota = *net realisable value — NRV*; snížení hodnoty zásob = *inventory write-down*; úplný odpis zásoby = *inventory write-off*.

`Čistá realizovatelná hodnota = očekávaná prodejní cena − očekávané náklady na dokončení a prodej`

**Příklad** — Rozpracovanou zakázku evidujeme za 70 000 Kč. Po dokončení ji můžeme prodat za 90 000 Kč, ale dokončení a prodej budou stát dalších 35 000 Kč.

`Čistá realizovatelná hodnota = 90 000 − 35 000 = 55 000 Kč`; `Rozdíl proti evidované hodnotě = 70 000 − 55 000 = 15 000 Kč`

Evidovaná hodnota je o **15 000 Kč vyšší**, než kolik podle současného odhadu získáme zpět po dokončení a prodeji. Controller ověří podklady a ekonomický dopad. Účetní oddělení zajistí odpovídající zachycení snížení hodnoty podle příslušných pravidel. **Má smysl ztrátovou zakázku dokončit?** — Hodnocení zásoby a rozhodnutí o dokončení jsou dvě odlišné otázky. Předpokládejme, že bez dokončení nelze zakázku prodat ani jinak využít a opuštění nemá další náklady.

| Varianta | Budoucí příjem | Další náklady | Čistý budoucí přínos |
| --- | ---: | ---: | ---: |
| Opustit bez využití | 0 Kč | 0 Kč | **0 Kč** |
| Dokončit a prodat | 90 000 Kč | 35 000 Kč | **55 000 Kč** |

Dokončení dává za těchto předpokladů smysl: při opuštění bychom nezískali zpět nic z původních 70 000 Kč; dokončením získáme po odečtení dalších nákladů 55 000 Kč; celá zakázka přesto skončí ve ztrátě 15 000 Kč. Dosud nevratně vynaložené náklady označujeme jako **utopené náklady — sunk costs**. Při rozhodování od této chvíle porovnáváme budoucí příjmy, náklady a alternativy.

**Možnost prodat rozpracovanou zakázku** — Evidovaných 70 000 Kč není automaticky cena, za kterou zakázku prodáme. Pokud bychom však skutečně mohli rozpracovanou zakázku prodat za 70 000 Kč bez dalších nákladů: prodej v současném stavu přinese 70 000 Kč; dokončení a prodej přinesou čistě 55 000 Kč; prodej rozpracované zakázky je výhodnější o 15 000 Kč. Při jinak srovnatelných podmínkách a rizicích je prodej v současném stavu výhodnější než dokončení, pokud jeho čistý výnos přesáhne 55 000 Kč. V praxi ověř také jistotu prodeje, smluvní závazky, případné sankce a jiné využití. U materiálu posuzuj také využití ve vlastní výrobě. Nižší nabídka na jeho odprodej sama o sobě nemusí vystihovat hodnotu materiálu, který firma účelně spotřebuje.

### 7.5 Krytí zásob a objednávání

**Pojmy:** doba krytí zásob = *days of supply / inventory coverage*; objednací bod = *reorder point — ROP*; pojistná zásoba = *safety stock*; dodací lhůta = *lead time*; objednací množství = *order quantity*. **Doba krytí** — Říká, na kolik dní očekávané spotřeby vystačí současná použitelná zásoba.

`Doba krytí = aktuální použitelná zásoba / očekávaná denní spotřeba`

Zásoba 2 400 kg, očekávaná spotřeba 80 kg za výrobní den:

`2 400 / 80 = 30 výrobních dní krytí`

**Objednací bod: kdy objednat**

`Objednací bod = spotřeba během dodací lhůty + pojistná zásoba`

Dodací lhůta je 15 výrobních dní, pojistná zásoba odpovídá dalším 5 dnům spotřeby:

| Složka | Výpočet | Množství |
| --- | --- | ---: |
| Spotřeba během dodací lhůty | 15 × 80 | 1 200 kg |
| Pojistná zásoba | 5 × 80 | 400 kg |
| **Objednací bod** |  | **1 600 kg** |

Pokud odpovědný útvar objedná při 1 600 kg a dodávka přijde za plánovaných 15 dní, těsně před jejím přijetím zbude 400 kg. Předpokládáme rovnoměrnou spotřebu a žádnou další otevřenou dodávku. **Objednací množství: kolik objednat** — Pokud chceme při přijetí dodávky doplnit zásobu na 2 400 kg:

`Objednací množství = cílová zásoba po dodání − očekávaná zásoba před dodáním`; `2 400 − 400 = 2 000 kg`

**Objednací bod říká kdy, objednací množství říká kolik.** Používej stejný kalendář spotřeby a dodací lhůty. Pracovní a kalendářní dny nejsou automaticky zaměnitelné. V reálném objednávání zohledni otevřené objednávky, rezervace, kolísání spotřeby, minimální odběr a spolehlivost dodavatele.

**Kdo za co odpovídá**

| Činnost | Typická odpovědnost |
| --- | --- |
| Plán potřeby a termínu doplnění | Materiálové plánování / nákup |
| Vystavení objednávky a řešení dodání | Nákup |
| Fyzická evidence a stav materiálu | Sklad |
| Ekonomické hodnocení zásob a změn parametrů | Controller společně s odpovědnými útvary |

Controller zpravidla neřídí každodenní objednávání. Potřebuje mu rozumět, aby mohl posoudit vázané prostředky, rizika nedostatku a ekonomiku nákupních rozhodnutí.

### 7.6 Obrátkovost a doba obratu

**Pojmy:** obrátkovost zásob = *inventory turnover*; doba obratu zásob = *days inventory outstanding — DIO / inventory holding period*; průměrná zásoba = *average inventory*. Obrátkovost vyjadřuje, kolikrát za období spotřebujeme množství odpovídající průměrné zásobě.

`Obrátkovost materiálu = spotřeba materiálu za období / průměrná zásoba materiálu`; `Doba obratu ve dnech = počet dní období / obrátkovost`

Spotřeba a zásoba musí být ve srovnatelných jednotkách a ocenění. **Příklad** — Pro jednoduchost používáme rok o 360 dnech.

| Roční spotřeba | Průměrná zásoba | Obrátkovost | Doba obratu |
| --- | ---: | ---: | ---: |
| 1 800 000 Kč | 300 000 Kč | **6× ročně** | **60 dní** |
| 1 800 000 Kč | 450 000 Kč | **4× ročně** | **90 dní** |

**Nižší obrátkovost znamená delší dobu obratu.** Při stejné roční spotřebě je ve druhé variantě v průměrné zásobě navíc **150 000 Kč**. To je důvod prověřit příčinu, nikoli automaticky zásobu snížit. Vyšší stav může souviset například se sezonou nebo delšími dodacími lhůtami. **Průměrná zásoba** — Zjednodušeně:

`Průměrná zásoba = (počáteční stav + konečný stav) / 2`

Při kolísání nebo sezonnosti je vhodnější průměr z častějších stavů, například měsíčních nebo denních. U hotových výrobků porovnávej náklady prodaných výrobků s průměrnou zásobou v odpovídajícím ocenění. Tržby a zásoby ve výrobních cenách nejsou bez dalšího vhodným párem.

**Doba obratu versus krytí**

| Ukazatel | Z čeho vychází |
| --- | --- |
| Doba obratu | Průměrná zásoba a spotřeba za uplynulé období |
| Doba krytí | Aktuální použitelná zásoba a očekávaná denní spotřeba |

Ukazatele mohou vyjít podobně, ale odpovídají na jinou otázku.

### 7.7 Stáří zásob

**Pojmy:** analýza stáří zásob = *inventory ageing analysis*; pomaluobrátkové zásoby = *slow-moving inventory*; zásoby bez pohybu = *non-moving inventory*; zastaralé zásoby = *obsolete inventory*. Rozlišuj:

| Pohled | Otázka |
| --- | --- |
| Stáří zásoby | Kdy byly zbývající kusy nebo konkrétní šarže přijaty? |
| Doba od posledního výdeje | Kdy se z dané položky naposledy něco spotřebovalo? |

**Čerstvý výdej nevynuluje stáří** — Přijali jsme 1 000 kg materiálu před 18 měsíci. Minulý týden jsme z této dávky vydali 20 kg do výroby. **Zbývajících 980 kg je stále 18 měsíců stará zásoba.** Pokud položka obsahuje více různě starých dodávek, potřebujeme pro přesné hodnocení rozlišit zbývající šarže či dávky. Datum posledního výdeje celé položky jejich stáří nenahrazuje. **Co controller prověřuje** — U dlouho neobrátkové nebo staré zásoby ověř s odpovědnými kolegy:

- zda existují potvrzené nebo reálně očekávané zakázky, které ji využijí;
- jaké množství a kdy bude potřeba;
- fyzický stav, kvalitu a použitelnost;
- zda se nezměnily požadované specifikace;
- možnost využití pro jiné výrobky;
- možnost vrácení dodavateli nebo odprodeje;
- zda evidovaná hodnota odpovídá očekávanému využití či výnosu.

**Dlouhá doba bez výdeje sama o sobě neznamená nulovou hodnotu.** Současně nedávný malý výdej neznamená, že je celá zbývající zásoba přiměřená. Controller vyčísluje dopad a upozorňuje na riziko. Plánování, výroba, kvalita, nákup a sklad poskytují podklady; účetní oddělení řeší případné účetní snížení hodnoty.

### 7.8 Pracovní kapitál a dopad změny zásob na cash flow

**Pojmy:** čistý provozní pracovní kapitál = *operating working capital (OWC)*; pohledávky = *trade receivables (AR)*; dodavatelské závazky = *trade payables (AP)*; uvolnění kapitálu = *working capital release*. Pro naše rozhodování používáme:

`OWC = zásoby + obchodní pohledávky − dodavatelské závazky`.

| Položka | Dnes | Po snížení zásob |
| --- | ---: | ---: |
| Zásoby | 12 mil. Kč | 9 mil. Kč |
| Pohledávky | 8 mil. Kč | 8 mil. Kč |
| Závazky dodavatelům | 6 mil. Kč | 6 mil. Kč |
| **OWC** | **14 mil. Kč** | **11 mil. Kč** |

O 3 mil. Kč se sníží **potřeba financování pracovního kapitálu**. Při správně zvolené realizaci se cash flow může zlepšit, ale nejde automaticky o okamžitý přírůstek peněz na účtu. Pokud jen prodáme výrobky na fakturu, část zásob se změní na pohledávky. Pokud využijeme materiál na skladě místo nového nákupu a výroba/prodej pokračují beze změny, zisk se sám o sobě nezvýší, ale peněžní výdaje za nové nákupy mohou klesnout.

**Úspora skladu:** když po snížení zásob zrušíme pronájem za 80 000 Kč/měsíc, při nezměněných ostatních vlivech se EBIT může zlepšit o 80 000 Kč/měsíc. **Snížení zásob a úspora nájemného jsou dva různé efekty.** Prověř, zda snižujeme materiál, WIP nebo hotové výrobky, a dopad na dodací spolehlivost, výrobní tok a zásoby bezpečnostní.

## 8. Rozhodování a ekonomický přínos

### 8.1 Relevantní a utopené náklady

**Pojmy:** relevantní náklady = *relevant costs*; utopené náklady = *sunk costs*; náklad obětované příležitosti = *opportunity cost*; dodatečné náklady = *incremental costs*. **Relevantní náklady:** budoucí náklady, které se mezi posuzovanými variantami liší. **Utopené náklady:** již vzniklé náklady, které dnešním rozhodnutím nemůžeme změnit ani získat zpět. **Náklad obětované příležitosti:** přínos nejlepší dostupné alternativy, které se rozhodnutím vzdáváme.

`Změna zisku = dodatečné výnosy − dodatečné náklady`

Pokud rozhodnutí vytlačí jinou výhodnou činnost, musíme zohlednit také její ztracený přínos. Fixní náklady jsou relevantní tehdy, pokud je rozhodnutí skutečně změní. Pouhé přiřazení stávajících fixních nákladů dalším kusům není nový náklad firmy. **Celkový výsledek projektu versus rozhodnutí od této chvíle** — Firma již nevratně zaplatila 18 000 Kč za návrh výrobku. Nyní zvažuje objednávku na 100 kusů za 450 Kč/ks. Dodatečné výrobní náklady jsou 320 Kč/ks. Má volnou kapacitu, neomezí jiné zakázky a další náklady nevzniknou.

| Položka | Přijmout objednávku | Odmítnout objednávku |
| --- | ---: | ---: |
| Nové tržby | 45 000 Kč | 0 Kč |
| Nové výrobní náklady | −32 000 Kč | 0 Kč |
| Již vynaložený návrh | −18 000 Kč | −18 000 Kč |
| **Celkový výsledek projektu** | **−5 000 Kč** | **−18 000 Kč** |

Přijetí objednávky zlepší výsledek o **13 000 Kč**, přestože celý projekt zůstane ztrátový. Rozlišuj: **Jak dopadl celý projekt?** Zahrneme také původní náklady. **Co je výhodnější od této chvíle?** Porovnáme budoucí rozdíly mezi variantami. Objednávka již vzniklé náklady nesníží. Může ale přinést příspěvek, který zmenší dosavadní ztrátu. **Náklad obětované příležitosti** — Máme posledních 10 hodin stroje a můžeme uskutečnit pouze jednu ze dvou potvrzených objednávek.

| Objednávka | Čas | Přínos po odečtení všech dodatečných nákladů |
| --- | ---: | ---: |
| A | 10 hodin | 8 000 Kč |
| B | 10 hodin | 11 000 Kč |

Ostatní podmínky jsou stejné. Při volbě A obětujeme přínos B ve výši **11 000 Kč**. Při volbě B obětujeme přínos A ve výši **8 000 Kč**. B je proti A výhodnější o **3 000 Kč**. **Obětovaný přínos není totéž co rozdíl výhodnosti.** Nezapočítávej tentýž vliv dvakrát: buď přímo porovnej úplné přínosy obou variant, nebo zvolenou variantu vyhodnoť proti obětované alternativě.

### 8.2 Dodatečná objednávka

**Pojmy:** mimořádná objednávka = *special order*; krátkodobá minimální cena = *short-run minimum price*; přesčas = *overtime*; přesčasový příplatek = *overtime premium*. Zákazník nabízí objednávku 50 kusů za 460 Kč/ks. Variabilní výrobní náklady: 300 Kč/ks. Jednorázové seřízení: 2 000 Kč. Kapacita je volná. Jiné objednávky neomezíme. Stávající fixní náklady se nezmění.

`Dodatečné tržby = 50 × 460 = 23 000 Kč`; `Dodatečné náklady = 50 × 300 + 2 000 = 17 000 Kč`; `Zvýšení zisku = 23 000 − 17 000 = 6 000 Kč`

**Přepočet na kus**

| Položka | Kč/ks |
| --- | ---: |
| Prodejní cena | 460 |
| Variabilní výrobní náklady | −300 |
| **Příspěvek před jednorázovým seřízením** | **160** |
| Seřízení: 2 000 / 50 | −40 |
| **Částka zbývající po seřízení** | **120** |

Celkem: **50 × 120 = 6 000 Kč**. Příspěvek není další náklad. Je to rozdíl mezi tržbami a variabilními náklady. Nemusí platit, že původní výroba už pokryla všechny fixní náklady. Přínos objednávky může zvýšit zisk nebo snížit stávající ztrátu.

**Krátkodobá cenová hranice**

`Minimální cena pro tuto objednávku = variabilní náklad na kus + ostatní dodatečné náklady / počet kusů`; `300 + 2 000 / 50 = 340 Kč/ks`

Při ceně 340 Kč/ks se zisk firmy nezmění. Objednávka právě pokryje všechny dodatečné náklady. Tato hranice platí pouze za uvedených podmínek. Při omezené kapacitě, vytlačení jiných prodejů nebo dalších dopadech je musíme zahrnout. Dlouhodobě musí prodejní ceny pokrýt také fixní náklady a požadovaný výnos.

### 8.3 Porovnání dodavatelů

Nákupní cenu posuzujeme společně se spotřebou a dalšími dopady.

`Materiálový náklad na dobrý kus = cena za jednotku materiálu × spotřeba na dobrý kus`

| Dodavatel | Cena za kg | Spotřeba na dobrý kus | Náklad na dobrý kus |
| --- | ---: | ---: | ---: |
| A | 80 Kč | 2,5 kg | **200 Kč** |
| B | 75 Kč | 2,8 kg | **210 Kč** |

A je levnější o **10 Kč na dobrý kus**, přestože má vyšší cenu za kilogram. Při 5 000 dobrých kusech činí rozdíl **50 000 Kč**. Ověř srovnatelný výrobek, výrobní podmínky a příčinu rozdílné spotřeby. Zahrň případné dopady do prostojů, oprav, reklamací a kvality. Samotný rozdíl spotřeby ještě nedokazuje vinu dodavatele.

**Úloha controllera a nákupu**

| Útvar | Úloha |
| --- | --- |
| Nákup | Získání nabídek, dodací podmínky a vyjednávání |
| Výroba, technologie a kvalita | Ověření spotřeby a použitelnosti materiálu |
| Controller | Ekonomické porovnání a vyčíslení dopadu |

Controller nemusí zpracovávat každou nabídku ani vyjednávat. Může připravit podklad pro rozhodnutí nákupu; konkrétní rozdělení práce záleží na firmě.

### 8.4 Výroba předem na sklad

**Pojmy:** výroba na sklad = *make-to-stock — MTS*; výroba na objednávku = *make-to-order — MTO*; náklady držení zásob = *inventory carrying costs / holding costs*. Výroba předem může dávat smysl kvůli potvrzené sezonní poptávce nebo budoucímu nedostatku kapacity. Porovnej ji s výrobou později, přesčasy, externí výrobou nebo jinou reálnou variantou.

| Varianta | Dodatečné náklady |
| --- | ---: |
| Výroba předem: skladování a financování | 7 000 Kč |
| Výroba později: přesčasový provoz | 16 000 Kč |

Při jinak stejných nákladech a podmínkách je výroba předem levnější o **9 000 Kč**. Ověř: očekávaný odbyt, množství, cenu a termín; kapacitu strojů i pracovníků; dostupné peníze a skladovací prostor; riziko poškození, zastarání nebo neprodejnosti; možnost jiného využití výrobků. Standardní výrobek pro více odběratelů má zpravidla menší odbytové riziko než specifický výrobek pro jediného zákazníka. **Snížení fixních nákladů na kus samo o sobě není ekonomická úspora.** Výroba navíc může pouze rozdělit stejnou fixní částku mezi více kusů. Výroba bez odbytu může zlepšit ukazatel oddělení, ale zároveň zvýšit zásoby a riziko firmy. Při zahrnutí fixní výrobní režie do zásob může změnit i časové rozložení vykázaného zisku. Sama tím nevytváří peněžní přínos.

### 8.5 Dokončit ztrátovou zakázku?

Dosud nevratně vynaloženo: 60 000 Kč. Dokončení a prodej budou stát dalších 25 000 Kč. Potvrzená prodejní cena: 75 000 Kč. Bez dokončení nelze zakázku prodat ani jinak využít. Zastavení nemá další náklady a dokončení neomezí jinou výrobu.

| Varianta | Čistý budoucí přínos | Celkový výsledek zakázky |
| --- | ---: | ---: |
| Opustit | 0 Kč | −60 000 Kč |
| Dokončit a prodat | 75 000 − 25 000 = **50 000 Kč** | **−10 000 Kč** |

Dokončení zlepší výsledek proti opuštění o **50 000 Kč**, přestože celá zakázka zůstane ztrátová. Pokud by dokončení a prodej stály více než očekávaný příjem, pokračování by za těchto podmínek výsledek dál zhoršovalo. V praxi prověř také možnost prodeje rozpracované zakázky, smluvní závazky, náklady ukončení a alternativní využití kapacity. **Dosavadní nákladová hodnota není automaticky cenou, za kterou rozpracovanou zakázku prodáme.**

### 8.6 Množstevní sleva

**Pojmy:** množstevní sleva = *quantity discount / volume discount*; peníze vázané v zásobách = *cash tied up in inventory*. Firma potřebuje během několika měsíců 4 000 kg materiálu. Může nakupovat postupně, nebo vše najednou se slevou 4 Kč/kg.

`Úspora na ceně = 4 000 × 4 = 16 000 Kč`

Větší zásoba vyvolá dodatečné náklady skladování a financování 10 000 Kč.

`Čistý přínos = 16 000 − 10 000 = 6 000 Kč`

Předpokládáme, že materiál skutečně spotřebujeme, nehrozí znehodnocení a jiné rozdíly nejsou. Porovnáváme nákup **stejného celkového množství**, pouze s jiným načasováním a podmínkami. Nesrovnávej jen celkovou cenu různě velkých dodávek. Zohledni spotřebu, platby, dobu skladování, rizika a možnost postupného odběru.

### 8.7 Přínos opatření a skutečná úspora

**Pojmy:** čistý přínos = *net benefit*; úspora nákladů = *cost saving*; zabránění budoucím nákladům = *cost avoidance*; preventivní údržba = *preventive maintenance*. **Náklad spojený s problémem není automaticky nákladem, který jeho odstraněním ušetříme.** **Příklad preventivního opatření** — Opatření stojí 8 000 Kč. Podle podloženého odhadu zabrání dvěma poruchám během posuzovaného období. Každá porucha by znamenala: 7 000 Kč za opravu; 3 000 Kč mzdových nákladů za čekání. Mzdy firma zaplatí ve stejné výši i bez poruch. Získaný čas zatím nevyužije pro další výrobu ani omezení přesčasů.

| Položka | Přínos / náklad |
| --- | ---: |
| Dvě odvrácené opravy: 2 × 7 000 Kč | +14 000 Kč |
| Preventivní opatření | −8 000 Kč |
| **Čistý přínos z odstranitelných nákladů** | **6 000 Kč** |

Výpočet 2 × 10 000 − 8 000 = 12 000 Kč by nesprávně předpokládal také odstranění mzdových nákladů. **Získaná kapacita** — Omezení čekání přinese také využitelný čas. Jeho finanční přínos doložíme například: omezením přesčasů; omezením externí výroby; příspěvkem z další vyrobené a prodané produkce. Přínos z dodatečně prodané výroby nepočítej zároveň podruhé jako úsporu stejných hodin. Ověř pravděpodobnost a rozsah odvrácených poruch. Odhad přínosu není záruka; po realizaci opatření porovnej očekávání se skutečností.

> Při rozhodování sleduj, co se mezi variantami skutečně změní — ve výnosech, nákladech, rizicích a využití kapacity.

### 8.8 Make or Buy — vlastní výroba, nebo dodavatel?

**Pojmy:** vyrábět, nebo nakoupit = *make-or-buy decision*; ušetřitelné fixní náklady = *avoidable fixed costs*; externí kooperace = *outsourcing / subcontracting*. Porovnávej jen budoucí náklady, které rozhodnutí změní; společná fixní režie zůstávající v obou variantách není úsporou z outsourcingu.

**Příklad:** potřeba 10 000 ks/rok, variabilní vlastní výroba 220 Kč/ks, dodavatel 260 Kč/ks, při outsourcingu ušetříme 500 000 Kč ročně na fixních nákladech. Vlastní výroba: `10 000 × 220 + 500 000 = 2 700 000 Kč` relevantních nákladů; nákup: `10 000 × 260 = 2 600 000 Kč`. Dodavatel je o **100 000 Kč/rok** výhodnější (10 Kč/ks). Rozhodnutí je citlivé na skutečnou dosažitelnost fixní úspory, náklady dopravy, kvalitu a zaručený objem/cenu dodávek.

**Bod rovnosti Make or Buy:** vlastní variabilní náklad 150 Kč/ks, nákup 230 Kč/ks, ušetřitelné fixní náklady při nekonání vlastní výroby 1,2 mil. Kč/rok → `1 200 000 / (230 − 150) = 15 000 ks/rok`. Pod hranicí je při daných předpokladech výhodnější nákup, nad ní vlastní výroba. **Garance 8 000 ks versus obchodní očekávání 20 000 ks:** připrav scénáře a citlivost rozhodnutí; optimistický forecast nepovažuj za smluvní jistotu.

### 8.9 CAPEX, doba návratnosti a NPV

**Pojmy:** kapitálový výdaj = *capital expenditure (CAPEX)*; provozní výdaj/náklad podle kontextu = *operating expenditure (OPEX)*; jednoduchá návratnost = *simple payback period*; čistá současná hodnota = *net present value (NPV)*; diskontní sazba = *discount rate*; současná hodnota = *present value (PV)*.

`Čistý roční peněžní přínos = skutečně realizovatelné peněžní úspory + dodatečné inkasované přínosy − dodatečné peněžní náklady` (zjednodušeně, před daněmi, pokud je tak stanoveno); `Jednoduchá doba návratnosti = počáteční investice / stálý roční čistý peněžní přínos`.

**Příklad CNC:** stroj a instalace 8 mil. Kč; roční úspora práce 1,2 mil., materiálu 0,6 mil., energie 0,2 mil.; dodatečný servis 0,4 mil. → čistý peněžní přínos `1,2 + 0,6 + 0,2 − 0,4 = 1,6 mil. Kč/rok`; jednoduchá návratnost `8 / 1,6 = 5 let`. Úspora práce je **cash úspora** pouze pokud skutečně ubydou platby nebo vznikne jinak doložený využitelný přínos.

**NPV diskontuje budoucí peněžní toky:** `NPV = −I₀ + Σ [CFₜ / (1 + r)^t]`, kde `I₀` je počáteční investice, `CFₜ` peněžní tok na konci roku `t` a `r` požadovaný výnos. Model: investice 5 mil. Kč, čtyři roční přínosy 1,5 mil. Kč na konci let, diskont 10 %, bez zůstatkové hodnoty → PV přínosů přibližně **4,755 mil. Kč**, NPV asi **−245 tis. Kč**. Přestože nominální přínosy činí 6 mil. Kč, projekt nesplní požadovaný výnos 10 %. U reálných projektů posuď také životnost, zůstatkovou hodnotu, daně, pracovní kapitál a rizikové scénáře; nepleť si odpis s peněžním tokem.

### 8.10 Produktová a zákaznická profitabilita

**Pojmy:** ziskovost výrobku = *product profitability*; ziskovost zákazníka = *customer profitability*; specifické náklady zákazníka = *customer-specific costs*; příspěvek po specifických nákladech = *customer contribution after specific costs*.

**Příklad zákazníka:** tržby 6 mil. Kč, variabilní výrobní náklady prodaných dílů 4,2 mil. Kč → základní CM **1,8 mil. Kč**. Specifická logistika 300 tis., reklamace a třídění 200 tis., zákaznické technické změny 100 tis. Kč → příspěvek po specifických nákladech **1,2 mil. Kč**, tedy **20 % tržeb**. Není to automaticky čistý zisk; ještě je třeba pokrýt společné fixní náklady.

Při hodnocení zákazníka prověř frekvenci změn odvolávek, velikost dávek, mimořádné přepravy, kvalitu a seřizování. Zda je zákazník dlouhodobě výhodný, neposuzuj pouze podle tržeb nebo jednotkové CM marže; ani libovolně alokovaná společná režie sama nerozhoduje o ukončení zakázky.

## 9. Měsíční uzávěrka, reporting a prognóza

**Pojmy:** měsíční uzávěrka = *month-end close*; manažerský reporting = *management reporting*; prognóza = *forecast*. Měsíční controlling propojuje tři otázky:

1. Jsou údaje za měsíc správné a úplné?
2. Jak výsledek dopadl proti plánu a proč?
3. Co uděláme a co očekáváme v dalších měsících?

### 9.1 Úplnost a správné období

**Pojmy:** přiřazení do správného období = *cut-off / period allocation*; náklady příštích období = *prepaid expenses*; zachycení již vzniklých nevyfakturovaných nákladů = *accrual*. České a anglické účetní položky nemají vždy přesnou shodu jedna ku jedné. Nejprve ověř, zda report obsahuje všechny náklady patřící do měsíce a nezahrnuje náklady jiných období. **Doručení faktury ani zaplacení samy neurčují období nákladu.** Rozhoduje věcná a časová souvislost. **Příklad za listopad** — Předpokládáme běžné opravy a služby, nikoli pořízení nebo technické zhodnocení majetku.

| Situace | Listopadový náklad |
| --- | ---: |
| Oprava za 28 000 Kč provedená v listopadu, faktura přijde v prosinci | **28 000 Kč** |
| Faktura 45 000 Kč přijatá v listopadu za servis provedený až v prosinci | **0 Kč** |
| Pojištění 72 000 Kč na období listopad–říjen, rovnoměrné rozdělení mezi 12 měsíců | **6 000 Kč** |
| **Celkem z uvedených položek** | **34 000 Kč** |

U pojištění je listopadový peněžní výdaj **72 000 Kč**, ale listopadový náklad pouze **6 000 Kč**. Zbývajících 66 000 Kč se vztahuje k budoucím měsícům. **Oprava přesahující do dalšího měsíce** — Pokud oprava probíhá od konce listopadu do začátku prosince, potřebujeme podloženě určit rozsah prací provedených v jednotlivých měsících. Příklad: celková oprava stojí 28 000 Kč. Podklady potvrzují 60 % prací v listopadu a 40 % v prosinci.

| Období | Podíl | Náklad |
| --- | ---: | ---: |
| Listopad | 60 % | 16 800 Kč |
| Prosinec | 40 % | 11 200 Kč |
| **Celkem** | **100 %** | **28 000 Kč** |

Částku nerozdělujeme automaticky podle kalendářních dní. Podkladem může být servisní protokol, vykázané hodiny, použitý materiál nebo podložený odhad provedených prací. Účetní oddělení posoudí odpovídající zachycení podle charakteru plnění a dostupných podkladů.

**Spolupráce při uzávěrce** — Odpovědný útvar potvrdí, co bylo provedeno, kdy a za kolik. Controller ověří úplnost podkladů, období, středisko a návaznost reportu. Účetní oddělení zvolí a provede správné účetní zachycení. U již provedených nevyfakturovaných služeb může být potřeba zachytit odhad nákladu. Konkrétní účetní postup určí účetní oddělení. Po doručení faktury je nutné vypořádat původně zachycenou částku a případný rozdíl. **Stejný náklad nesmí zůstat započtený dvakrát.** Například oprava zachycená v listopadu za 28 000 Kč při přijetí faktury na stejnou částku znovu nezvýší prosincové náklady.

### 9.2 Rozpočet a prognóza

**Pojmy:** rozpočet = *budget*; skutečnost od začátku roku = *year to date actuals — YTD actuals*; celoroční prognóza = *full-year forecast*; alternativní scénář = *scenario*.

| Pojem | Otázka |
| --- | --- |
| Rozpočet | Co bylo schváleno jako plán? |
| Skutečnost | Co už nastalo? |
| Prognóza | Co podle dnešních informací očekáváme? |

`Celoroční prognóza = skutečnost uzavřených měsíců + odhad zbývajících měsíců`

**Příklad**

| Položka | Částka |
| --- | ---: |
| Schválený roční rozpočet údržby | 960 000 Kč |
| Skutečné náklady leden–září | 750 000 Kč |
| Odhad nákladů říjen–prosinec | 270 000 Kč |

`Celoroční prognóza = 750 000 + 270 000 = 1 020 000 Kč`; `Překročení rozpočtu = 1 020 000 − 960 000 = 60 000 Kč`; `Relativní překročení = 60 000 / 960 000 × 100 = 6,25 %`

Pokud nově zjistíme další očekávanou opravu za 20 000 Kč, která dosud nikde zahrnutá nebyla:

`Aktualizovaná prognóza = 1 020 000 + 20 000 = 1 040 000 Kč`

Původní schválený rozpočet zůstává **960 000 Kč**. Aktualizovaná prognóza jej překračuje o **80 000 Kč**.

**Pravidla aktualizace**

- Zachovej původní schválený rozpočet jako srovnávací základ.
- Případnou schválenou revizi rozpočtu eviduj odděleně.
- Prognózu aktualizuj podle nových informací.
- Ověř, zda nová položka už není zahrnutá ve skutečnosti nebo dosavadním odhadu.
- Nepotvrzené úspory nezahrnuj automaticky.
- Uveď předpoklady, míru jistoty a rizika.

Podle metodiky firmy lze nejistý přínos zahrnout do podloženého odhadu nebo uvést jako samostatný scénář či příležitost.

### 9.3 Podklady od nákupu do prognózy

Od nákupu potřebujeme: očekávanou cenu; datum její účinnosti; dobu platnosti; potvrzené množstevní a dodací podmínky; míru jistoty informace. Plánování doplní očekávanou spotřebu. Při čerpání dříve nakoupených zásob zohledni jejich ocenění a načasování. Vyšší cena nové dodávky se nemusí okamžitě projevit ve spotřebě celého měsíce. **Zjednodušený příklad zdražení** — Předpokládáme, že se nová cena plně projeví ve spotřebě: Plánovaná cena: 80 Kč/kg. Potvrzená nová cena: 88 Kč/kg. Očekávaná spotřeba: 1 500 kg měsíčně. Zbývající období: 2 měsíce.

`Měsíční dopad = (88 − 80) × 1 500 = 12 000 Kč`; `Dopad za oba měsíce = 12 000 × 2 = 24 000 Kč`

Pokud zdražení dosud nebylo zahrnuté, zvýší očekávané náklady o **24 000 Kč**.

**Které odchylky pokračují do budoucna?**

| Zjištění | Dopad do prognózy |
| --- | --- |
| Vyšší cena materiálu bude pokračovat | Zahrnout podle očekávané spotřeby a ocenění |
| Nadspotřeba byla prokazatelně odstraněna | Další nadspotřebu automaticky neopakovat |
| Oprava byla jednorázová a příčina odstraněna | Stejnou opravu automaticky neopakovat |
| Problém se může opakovat | Odhadnout další dopad a uvést předpoklady |
| Sleva se teprve vyjednává | Nezapočítávat ji automaticky jako jistou úsporu |

Dosavadní náklady zůstávají ve skutečnosti, i když byla jejich příčina odstraněna. **Celé měsíční překročení nepřenášíme mechanicky do dalších měsíců.** Posuzujeme jednotlivé příčiny a jejich očekávané pokračování.

### 9.4 Struktura měsíčního reportu

**Pojmy:** komentář k odchylce = *variance commentary*; plán opatření = *action plan*; odpovědná osoba = *action owner*; termín = *due date*; klíčový ukazatel výkonnosti = *key performance indicator — KPI*. Report má odpovědět na pět otázek:

1. **Výsledek:** jaká je skutečnost, plán a rozdíl v Kč a procentech?
2. **Provozní kontext:** jak se změnily objem, sortiment, zásoby a podmínky výroby?
3. **Příčiny:** co rozdíl vysvětluje a jaký je dopad jednotlivých vlivů?
4. **Opatření:** co uděláme, kdo odpovídá a do kdy?
5. **Prognóza:** co očekáváme dál, jaká jsou rizika a příležitosti?

Vždy uveď, zda porovnáváš skutečnost s původním plánem, nebo s rozpočtem přepočteným na skutečný objem a sortiment. Pro vedení je užitečné rozlišit nákladové položky a společné příčiny. Například jedna porucha může způsobit náklad opravy v režii i placené čekání ve mzdách.

**Jak popsat opatření**

| Údaj | Příklad |
| --- | --- |
| Co se udělá | Prověřit nastavení stroje a odstranit potvrzenou příčinu nadspotřeby |
| Kdo odpovídá | Vedoucí technologie |
| Do kdy | Konkrétní datum |
| Očekávaný přínos | Návrat spotřeby k normě při zachování kvality |
| Jak ověříme výsledek | Porovnání spotřeby na dobrý kus před opatřením a po něm při srovnatelných podmínkách |

Nestačí napsat „snížit spotřebu“. **Splnění úkolu není automaticky dosažení přínosu.** Informace „stroj byl seřízen“ ještě nedokazuje, že spotřeba skutečně klesla.

### 9.5 Příklad komentáře

Předpokládáme úplná data a následující ověřené výsledky:

| Položka | Částka |
| --- | ---: |
| Rozpočet pro skutečný objem a sortiment | 400 000 Kč |
| Skutečné výrobní náklady | 430 000 Kč |
| **Překročení** | **30 000 Kč, tedy 7,5 %** |

Rozklad překročení:

| Příčina | Dopad |
| --- | ---: |
| Vyšší cena materiálu | +18 000 Kč |
| Nadspotřeba materiálu | +7 000 Kč |
| Neplánovaná oprava stroje | +5 000 Kč |
| **Celkem** | **+30 000 Kč** |

**Výsledek a příčiny**

> Výrobní náklady dosáhly 430 000 Kč, což je o 30 000 Kč (+7,5 %) více než rozpočet přepočtený na skutečný objem a sortiment výroby. Překročení způsobila vyšší cena materiálu ve výši 18 000 Kč, nadspotřeba materiálu 7 000 Kč a neplánovaná oprava stroje 5 000 Kč. Největší dopad měla vyšší cena materiálu, která vysvětluje 60 % celkového překročení.

**Další kroky a výhled**

> Nákup ověří ceny dalších dodávek, technologie prověří příčinu nadspotřeby a údržba posoudí riziko opakování poruchy. U každého opatření doplníme odpovědnou osobu, termín a způsob ověření přínosu. Dopady do prognózy vyčíslíme podle zjištěných skutečností.

U finálního reportu nahraď obecné role konkrétními odpovědnými osobami a doplň termíny. Pokud už jsou dopady do prognózy ověřené, uveď také jejich částky a období. **Ověřený fakt, pracovní hypotézu a budoucí odhad označuj odlišně.** Neuváděj odhadovanou příčinu jako potvrzenou skutečnost.

### 9.6 Výrobní forecast, směnnost a report pro management

**Pojmy:** průběžně aktualizovaný výhled = *rolling forecast*; požadované strojní hodiny = *required machine hours*; směnnost = *shift pattern*; akční plán = *action plan*. Forecast zachycuje novou očekávanou realitu; původní budget zůstává srovnávacím základem.

**Kapacita:** poptávka 24 000 ks/měsíc, 5 min strojního času/ks → potřeba `24 000 × 5 / 60 = 2 000 strojních hodin`. Jedna směna má dostupnost 1 600 h, dvě směny 3 200 h. Zrušení druhé směny bez dalšího řešení vytváří **schodek 400 strojních hodin**, nikoli automaticky 400 člověkohodin. Prověř přesčasy, počet strojů, paralelní provoz, pracovní obsazení, přesun zakázek a skutečné dodatečné náklady.

**Měsíční report:** budget 100 000 prodaných kusů, tržby 50 mil. Kč, EBITDA 6 mil. Kč, OEE 80 %, zmetkovitost 2 %, zásoby 12 mil. Kč; actual 95 000 ks, tržby 47,5 mil. Kč, EBITDA 4,8 mil. Kč, OEE 74 %, zmetkovitost 3,5 %, zásoby 15 mil. Kč, materiálová odchylka +400 tis. Kč. EBITDA je **o 1,2 mil. Kč pod plánem**. Bez dalšího rozkladu nelze říct, kolik způsobil prodej, výkon zařízení nebo kvalita.

**Komentář vedení:** „EBITDA skončila o 1,2 mil. Kč pod plánem. Vedle nižšího prodeje evidujeme horší OEE, vyšší zmetkovitost a materiálovou odchylku 400 tis. Kč. Prověříme cenový a spotřební vliv materiálu, tři složky OEE a příčiny růstu zásob. Po odstranění překryvů vyčíslíme dopad do výsledku a předložíme opatření s vlastníky a termíny.“

**Pravidlo:** číselná korelace není prokázaná příčina. Horší OEE může omezit prodej, ale nižší prodej může také způsobit jiné využití kapacity. Managementu odděluj ověřený fakt, hypotézu, finanční dopad a navržený další krok.

## 10. Souhrnný měsíční příklad

### 10.1 Výchozí údaje a předpoklady

Firma vyrábí jediný výrobek.

- Plán výroby a prodeje: **1 200 kusů**.
- Skutečná výroba a prodej: **1 500 dobrých kusů**.
- Všechno vyrobené se prodalo; zásoby ani nedokončená výroba se nemění.
- Prodejní cena zůstává **500 Kč/ks**.
- Materiál a přímou práci považujeme v tomto modelu za variabilní.
- Výrobní režii považujeme za fixní v daném rozsahu kapacity.
- Data jsou úplná a přiřazená do správného období.
- Jiné náklady ani výnosy v modelu nejsou.

**Pojmy:** původní rozpočet = *original budget*; přepočtený rozpočet = *flexed budget*; skutečnost = *actuals*.

| Údaj | Plán / norma | Skutečnost |
| --- | ---: | ---: |
| Vyrobené a prodané množství | 1 200 ks | 1 500 ks |
| Prodejní cena | 500 Kč/ks | 500 Kč/ks |
| Materiál na kus | 2,5 kg | Vypočteme ze skutečné spotřeby |
| Cena materiálu | 80 Kč/kg | 84 Kč/kg |
| Spotřebovaný materiál celkem | Podle normy | 3 900 kg |
| Práce na kus | 0,4 člověkohodiny | Vypočteme ze skutečného času |
| Nákladová sazba práce | 250 Kč/hod. | 260 Kč/hod. |
| Pracovní čas celkem | Podle normy | 660 člověkohodin |
| Výrobní režie | 90 000 Kč | 99 000 Kč |

### 10.2 Původní a přepočtený rozpočet

Nejprve spočítáme původní plán pro 1 200 kusů. Potom stejné normy, ceny a sazby použijeme na skutečných 1 500 kusů. Fixní režii při přepočtu ponecháme stejnou.

| Náklad | Původní plán: 1 200 ks | Přepočtený plán: 1 500 ks | Vliv vyššího objemu |
| --- | ---: | ---: | ---: |
| Materiál | 240 000 Kč | 300 000 Kč | +60 000 Kč |
| Přímá práce | 120 000 Kč | 150 000 Kč | +30 000 Kč |
| Výrobní režie | 90 000 Kč | 90 000 Kč | 0 Kč |
| **Celkem** | **450 000 Kč** | **540 000 Kč** | **+90 000 Kč** |

Výpočty pro skutečnou výrobu:

`Normované množství materiálu = 1 500 × 2,5 = 3 750 kg`; `Normované materiálové náklady = 3 750 × 80 = 300 000 Kč`; `Normovaný pracovní čas = 1 500 × 0,4 = 600 člověkohodin`; `Normované náklady práce = 600 × 250 = 150 000 Kč`

**Rozdíl 90 000 Kč vysvětluje pouze větší výroba.** Nejde o nadspotřebu ani o vyšší pracnost. Přepočtených 540 000 Kč je stále plán, nikoli skutečnost.

### 10.3 Materiál: spotřeba a cena

Skutečná spotřeba činí 3 900 kg za 84 Kč/kg.

`Skutečné materiálové náklady = 3 900 × 84 = 327 600 Kč`

**Spotřební odchylka**

`Nadspotřeba = 3 900 − 3 750 = 150 kg`; `Spotřební odchylka = 150 × plánovaných 80 Kč = +12 000 Kč`

**Cenová odchylka**

`Rozdíl ceny = 84 − 80 = 4 Kč/kg`; `Cenová odchylka = skutečných 3 900 kg × 4 Kč = +15 600 Kč`

| Materiálová odchylka | Dopad |
| --- | ---: |
| Vyšší spotřeba | +12 000 Kč |
| Vyšší cena | +15 600 Kč |
| **Celkem proti přepočtenému plánu** | **+27 600 Kč** |

Kontrola:

`327 600 skutečnost − 300 000 přepočtený plán = 27 600 Kč`

Proti původnímu materiálovému plánu je rozdíl 87 600 Kč:

`60 000 vliv vyšší výroby + 12 000 nadspotřeba + 15 600 vyšší cena = 87 600 Kč`

Vyšší spotřebu prověříme s výrobou, technologií a kvalitou, podle příčiny také s údržbou nebo nákupem. Důvod vyšší ceny a podmínky dalších dodávek ověříme s nákupem.

### 10.4 Přímá práce: pracnost a sazba

Norma pro skutečnou výrobu je 600 hodin. Skutečnost činí 660 hodin při sazbě 260 Kč/hod.

`Skutečné náklady práce = 660 × 260 = 171 600 Kč`

**Odchylka pracnosti**

`Hodiny navíc = 660 − 600 = 60 hodin`; `Odchylka pracnosti = 60 × plánovaných 250 Kč = +15 000 Kč`

**Odchylka sazby**

`Rozdíl sazby = 260 − 250 = 10 Kč/hod.`; `Odchylka sazby = skutečných 660 hodin × 10 Kč = +6 600 Kč`

| Mzdová odchylka | Dopad |
| --- | ---: |
| Více hodin | +15 000 Kč |
| Vyšší hodinová sazba | +6 600 Kč |
| **Celkem proti přepočtenému plánu** | **+21 600 Kč** |

Kontrola:

`171 600 skutečnost − 150 000 přepočtený plán = 21 600 Kč`

Celých 21 600 Kč není odchylkou pracnosti. Pracnost vysvětluje 15 000 Kč, sazba dalších 6 600 Kč. Evidence v tomto modelovém příkladu potvrdila, že všech 60 hodin navíc tvořilo placené čekání při poruše stroje. Samotná práce odpovídala normě. **Časové překročení tedy vysvětluje prostoj, nikoli pomalejší práce zaměstnanců.** Důvod vyšší hodinové sazby ještě potřebujeme ověřit.

### 10.5 Výrobní režie a celkový rozklad nákladů

Skutečná výrobní režie je 99 000 Kč proti plánovaným 90 000 Kč.

`Odchylka režie = 99 000 − 90 000 = +9 000 Kč`

Podklady potvrzují, že celých 9 000 Kč představuje neplánovaná oprava stejného stroje, který způsobil placené čekání.

**Náklady podle položek**

| Náklad | Původní plán | Přepočtený plán | Skutečnost | Odchylka proti přepočtenému plánu |
| --- | ---: | ---: | ---: | ---: |
| Materiál | 240 000 Kč | 300 000 Kč | 327 600 Kč | +27 600 Kč |
| Přímá práce | 120 000 Kč | 150 000 Kč | 171 600 Kč | +21 600 Kč |
| Výrobní režie | 90 000 Kč | 90 000 Kč | 99 000 Kč | +9 000 Kč |
| **Celkem** | **450 000 Kč** | **540 000 Kč** | **598 200 Kč** | **+58 200 Kč** |

Celková odchylka proti původnímu plánu:

`598 200 − 450 000 = 148 200 Kč`

Její rozklad:

`90 000 vliv vyššího objemu + 58 200 překročení při skutečném objemu = 148 200 Kč`

**Původní a přepočtený plán odpovídají na jiné otázky:** Proti původnímu plánu jsou náklady vyšší o **148 200 Kč**. Po zohlednění větší výroby zbývá překročení **58 200 Kč**.

**Náklady podle společných příčin**

| Příčina | Dopad | Podíl na překročení 58 200 Kč |
| --- | ---: | ---: |
| Vyšší spotřeba materiálu | 12 000 Kč | 20,6 % |
| Vyšší cena materiálu | 15 600 Kč | 26,8 % |
| Porucha stroje: čekání 15 000 Kč + oprava 9 000 Kč | 24 000 Kč | 41,2 % |
| Vyšší hodinová sazba práce | 6 600 Kč | 11,3 % |
| **Celkem** | **58 200 Kč** | **100 % před zaokrouhlením** |

Poruchu můžeme hodnotit jako společnou příčinu dvou různých nákladů. Nejde o dvojí započtení: jednou sledujeme placené čekání, podruhé opravu. Podíl na celkové odchylce není totéž jako procentní nárůst samotné nákladové položky.

### 10.6 Plánovaný a skutečný zisk

Prodejní cena zůstala 500 Kč/ks a všechny vyrobené kusy se prodaly.

| Položka | Původní plán | Skutečnost | Rozdíl |
| --- | ---: | ---: | ---: |
| Prodané množství | 1 200 ks | 1 500 ks | +300 ks |
| Tržby | 600 000 Kč | 750 000 Kč | +150 000 Kč |
| Výrobní náklady | 450 000 Kč | 598 200 Kč | +148 200 Kč |
| **Provozní zisk v našem modelu** | **150 000 Kč** | **151 800 Kč** | **+1 800 Kč** |

`Plánovaný zisk = 1 200 × 500 − 450 000 = 150 000 Kč`; `Skutečný zisk = 1 500 × 500 − 598 200 = 151 800 Kč`

Tržby vzrostly o 150 000 Kč, ale náklady o 148 200 Kč. Zisk se proto zvýšil pouze o 1 800 Kč.

### 10.7 Rozklad změny zisku

Plánované variabilní náklady na kus:

`Materiál = 2,5 × 80 = 200 Kč/ks`; `Práce = 0,4 × 250 = 100 Kč/ks`; `Celkem = 300 Kč/ks`; `Plánovaný příspěvek = 500 − 300 = 200 Kč/ks`

Dalších 300 prodaných kusů mělo zvýšit zisk o:

`300 × 200 = 60 000 Kč`

Při skutečném prodeji a plánovaných nákladových podmínkách bychom tedy očekávali:

`150 000 + 60 000 = 210 000 Kč zisku`

**Přechod od plánu ke skutečnosti**

| Vliv | Dopad na zisk |
| --- | ---: |
| **Původní plánovaný zisk** | **150 000 Kč** |
| Vyšší prodej při plánovaném příspěvku | +60 000 Kč |
| Nadspotřeba materiálu | −12 000 Kč |
| Vyšší cena materiálu | −15 600 Kč |
| Prostoj při poruše | −15 000 Kč |
| Vyšší hodinová sazba práce | −6 600 Kč |
| Oprava stroje | −9 000 Kč |
| **Skutečný zisk** | **151 800 Kč** |

**Nákladové překročení má opačné znaménko v rozkladu zisku:** například +12 000 Kč nákladů znamená −12 000 Kč zisku.

**Dva různé srovnávací základy**

| Srovnání skutečného zisku | Rozdíl |
| --- | ---: |
| Proti původnímu plánu 150 000 Kč | **+1 800 Kč** |
| Proti očekávanému zisku při skutečném prodeji 210 000 Kč | **−58 200 Kč** |

Firma překonala původní plán zisku díky vyššímu prodeji. Při tomto prodeji ale za plánovaných nákladových podmínek mohla dosáhnout výrazně lepšího výsledku. Vliv objemu nezapočítáváme dvakrát. Pokud začínáme mezikrokem 210 000 Kč, odečteme už jen nákladové překročení 58 200 Kč.

### 10.8 Navazující kroky

| Problém | Podklad od odpovědného útvaru | Ekonomická úloha controllera |
| --- | --- | --- |
| Cena materiálu | Důvod zdražení, ceny dalších dodávek a možnosti změny | Vyčíslit pokračující dopad do prognózy |
| Nadspotřeba | Kvalita materiálu, odpad, nastavení stroje, norma a evidence | Ověřit příčinu a potenciál nápravy |
| Porucha | Technická příčina, opakování, odstranění problému a prevence | Porovnat cenu opatření se skutečně odstranitelnými dopady |
| Hodinová sazba | Složení pracovníků, příplatky a rozsah zahrnutých nákladů | Vysvětlit změnu sazby a odhadnout další vývoj |

U opatření uvedeme odpovědnou osobu, termín, očekávaný efekt a způsob ověření. Náklad čekání 15 000 Kč není automaticky peněžní úsporou, pokud zaměstnanci dostanou stejnou mzdu i bez poruchy. Přínosem může být využitelná kapacita, omezení přesčasů nebo další prodejná výroba. Do prognózy nepřenášíme celé překročení mechanicky. Ověříme, které příčiny budou pokračovat a které byly odstraněny.

### 10.9 Komentář pro vedení

> Výrobní náklady dosáhly 598 200 Kč, tedy o 148 200 Kč více než původní rozpočet. Z tohoto zvýšení vysvětluje 90 000 Kč vyšší objem výroby. Zbývajících 58 200 Kč představuje překročení rozpočtu přepočteného na skutečnou výrobu.  Největší společnou příčinou byla potvrzená porucha stroje s dopadem 24 000 Kč do placeného čekání a opravy. Dalšími vlivy byly vyšší cena materiálu 15 600 Kč, nadspotřeba 12 000 Kč a vyšší hodinová sazba práce 6 600 Kč. Jejich provozní důvody ještě prověříme s odpovědnými útvary.  Provozní zisk dosáhl 151 800 Kč, o 1 800 Kč více než původně plánovaných 150 000 Kč. Vyšší prodej měl zvýšit zisk o 60 000 Kč, ale tento přínos téměř celý vyčerpalo nákladové překročení 58 200 Kč.

### 10.10 Omezení příkladu

Výrobní náklady zde odpovídají nákladům prodaných výrobků pouze proto, že se všechna výroba prodala a zásoby se nemění. Pokud by část výroby zůstala na skladě, museli bychom zohlednit změnu zásob a jejich ocenění. Provozní zisk počítáme jen v rozsahu zadaného modelu. Ve skutečné firmě by bylo nutné zahrnout také další odpovídající provozní náklady a výnosy. Mzdové odchylky jsou nákladové rozdíly, nikoli automaticky peněžní úspory nebo dodatečné platby.

## 11. Přehled vzorců

Vzorce odpovídají zjednodušeným modelům z předchozích kapitol. Při použití vždy ověř rozsah nákladů, jednotky, období a srovnávací základ.

### 11.1 Tržby, příspěvek a zisk

**Pojmy:** příspěvek na úhradu = *contribution margin*; bod zvratu = *break-even point*.

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Tržby | Prodané množství × prodejní cena | Kč |
| Variabilní výrobní náklady celkem | Vyrobené množství × variabilní výrobní náklady na kus | Kč; při stejných jednotkových nákladech |
| Variabilní náklady prodaných kusů | Prodané množství × variabilní náklady na kus | Kč; ve zjednodušeném modelu |
| Příspěvek na kus | Cena − variabilní náklady na kus | Kč/ks |
| Příspěvek celkem | Prodané množství × příspěvek na kus | Kč |
| Příspěvek celkem — alternativně | Tržby − variabilní náklady prodaných kusů | Stejný výsledek |
| Zisk ve zjednodušeném modelu | Příspěvek celkem − fixní náklady | Kč; fixní náklady odečítáme celé za období |
| Bod zvratu | Fixní náklady / příspěvek na kus | Prodané kusy; příspěvek musí být kladný |
| Prodej pro požadovaný zisk | (Fixní náklady + požadovaný zisk) / příspěvek na kus | Prodané kusy |
| Fixní náklady na kus | Celkové fixní náklady / vyrobené množství | Kč/ks |

Pokud potřebný počet celých kusů vyjde desetinný, zaokrouhluj nahoru. Model předpokládá stabilní cenu, jednotkové variabilní náklady a fixní náklady v posuzovaném rozsahu. U více výrobků záleží také na prodejním mixu. **Příspěvek není další náklad.** Je to část tržeb zbývající po variabilních nákladech.

### 11.2 Kalkulace a rozdělení režie

**Pojmy:** výrobní náklady = *manufacturing costs*; úplná kalkulace = *full costing*; rozvrhová základna = *allocation base*.

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Vlastní náklady výroby na kus | Přímý materiál + přímá výrobní práce + přiřazená výrobní režie | Kč/ks; struktura našeho modelu |
| Úplné náklady na kus | Vlastní náklady výroby + přiřazené správní a prodejní náklady | Kč/ks |
| Kalkulovaný zisk na kus | Cena − úplné náklady na kus | Kč/ks |
| Režijní sazba | Rozdělovaná režie / celkový objem rozvrhové základny | Např. Kč/strojovou hodinu |
| Přiřazená režie výrobku či zakázky | Využití základny výrobkem či zakázkou × režijní sazba | Kč |
| Režie na kus | Přiřazená režie / vyrobené množství | Kč/ks |

Kontrola: součet přiřazené režie musí odpovídat rozdělované částce, pokud ji v daném příkladu rozdělujeme celou. Změna základny sama nemění celkovou režii. Mění její rozdělení mezi výrobky. Úplná kalkulace není automaticky oceněním zásoby ani dodatečným nákladem nové zakázky.

### 11.3 Základní odchylky a flexibilní rozpočet

**Pojmy:** odchylka = *variance*; přepočtený rozpočet = *flexed budget*.

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Absolutní nákladová odchylka | Skutečnost − srovnávací základ | Kč |
| Relativní odchylka | (Skutečnost − základ) / základ × 100 | %; při kladném, nenulovém základu |
| Podíl příčiny na celkové odchylce | Dopad příčiny / celková odchylka × 100 | %; celková odchylka nesmí být nula |
| Původní rozpočet | Plánovaná fixní část + plánovaná variabilní sazba × plánovaný rozsah | Kč |
| Flexibilní rozpočet | Plánovaná fixní část + plánovaná variabilní sazba × skutečný rozsah | Kč |
| Vliv změny rozsahu činnosti | Flexibilní rozpočet − původní rozpočet | Kč |
| Odchylka po zohlednění rozsahu | Skutečnost − flexibilní rozpočet | Kč |
| Celková odchylka proti původnímu plánu | Vliv změny rozsahu + odchylka po zohlednění rozsahu | Kč |

V této příručce znamená: **Kladná nákladová odchylka:** překročení — nepříznivý vliv. **Záporná nákladová odchylka:** náklady pod základem — příznivý vliv. Při vzájemném vyrušení příčin mohou být jejich procentní podíly záporné nebo vyšší než 100 %. Tehdy jsou důležitější jednotlivé korunové dopady. **Přepočtený rozpočet je stále plán, nikoli skutečnost.**

### 11.4 Materiál: objem, spotřeba a cena

**Pojmy:** spotřební odchylka = *material usage variance*; cenová odchylka = *material price variance*.

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Normované množství pro skutečnou výrobu | Skutečné dobré kusy × norma materiálu na kus | Např. kg; při nezměněné rozpracovanosti |
| Původní materiálový rozpočet | Plánované kusy × norma na kus × plánovaná cena | Kč |
| Materiálový rozpočet pro skutečnou výrobu | Normované množství pro skutečnou výrobu × plánovaná cena | Kč |
| Skutečné materiálové náklady | Skutečná spotřeba × skutečná jednotková cena | Kč |
| Vliv objemu výroby | Rozpočet pro skutečnou výrobu − původní rozpočet | Kč |
| Spotřební odchylka | (Skutečná spotřeba − normovaná spotřeba pro skutečnou výrobu) × plánovaná cena | Kč |
| Cenová odchylka | Skutečná spotřeba × (skutečná cena − plánovaná cena) | Kč |
| Materiálové překročení po zohlednění objemu | Spotřební odchylka + cenová odchylka | Kč |
| Celková odchylka proti původnímu plánu | Vliv objemu + spotřební odchylka + cenová odchylka | Kč |

Pomůcka: **Nejprve měníme spotřebu při plánované ceně. Potom cenu při skutečné spotřebě.** Tím se vlivy přesně sečtou a nepřekrývají. Vzorce v této podobě předpokládají jeden výrobek nebo výpočet po jednotlivých výrobcích a materiálech. U různých cen a norem počítej po odpovídajících skupinách a výsledky sečti.

### 11.5 Práce: pracnost, hodiny a sazba

**Pojmy:** pracnost = pracovní čas na jednotku výrobku; odchylka pracnosti = *labour efficiency variance*; odchylka sazby = *labour rate variance*.

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Skutečná pracnost na kus | Skutečné člověkohodiny / skutečné dobré kusy | Člověkohodiny/ks |
| Normované hodiny pro skutečnou výrobu | Skutečné dobré kusy × norma času na kus | Člověkohodiny |
| Původní plán hodin | Plánované kusy × norma času na kus | Člověkohodiny |
| Normované mzdové náklady skutečné výroby | Normované hodiny skutečné výroby × plánovaná sazba | Kč |
| Skutečná průměrná nákladová sazba | Skutečné zahrnuté mzdové náklady / odpovídající skutečné hodiny | Kč/člověkohodinu |
| Vliv objemu do mzdových nákladů | (Normované hodiny skutečné výroby − původně plánované hodiny) × plánovaná sazba | Kč |
| Odchylka pracnosti | (Skutečné hodiny − normované hodiny skutečné výroby) × plánovaná sazba | Kč |
| Odchylka hodinové sazby | Skutečné hodiny × (skutečná sazba − plánovaná sazba) | Kč |
| Mzdové překročení po zohlednění objemu | Odchylka pracnosti + odchylka sazby | Kč |

**Pracnost není sazba:** Pracnost: kolik hodin potřebujeme na kus. Sazba: kolik stojí jedna hodina. Celkové mzdové překročení může obsahovat oba vlivy. Neoznačuj celou částku automaticky jako odchylku pracnosti. Pokud hodiny zahrnují čekání, může vyšší vykázanou pracnost způsobit prostoj. Ověř obsah evidence a příčinu.

### 11.6 Rozklad změny zisku

**Anglicky:** rozklad změny zisku = *profit bridge*.

| Ukazatel | Vzorec | Poznámka |
| --- | --- | --- |
| Dopad změny prodeje do zisku | (Skutečně prodané kusy − plánované prodané kusy) × plánovaný příspěvek na kus | Při nezměněné ceně a ostatních podmínkách |
| Dopad nákladové odchylky do zisku | − nákladová odchylka | Překročení nákladů zisk snižuje |
| Skutečný zisk | Plánovaný zisk + všechny jednotlivé dopady do zisku | Vlivy nesmějí chybět ani být započtené dvakrát |

Rozlišuj dva základy:

1. **Původní plánovaný zisk.**
2. **Očekávaný zisk při skutečném prodeji a plánovaných nákladových podmínkách.**

Pokud začínáme druhou hodnotou, vliv objemu už znovu nepřičítáme ani neodečítáme. Tento jednoduchý rozklad předpokládá, že vyrobené kusy se prodaly, zásoby se nemění a další vlivy jsou buď nezměněné, nebo samostatně zahrnuté.

### 11.7 Produktivita, prostoje a zmetkovitost

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Člověkohodiny | Součet času všech zahrnutých pracovníků | Např. 3 lidé × 2 hodiny = 6 člověkohodin |
| Produktivita práce | Dobré kusy / člověkohodiny | Ks/člověkohodinu |
| Hodiny při cílové produktivitě | Dobré kusy / cílová produktivita | Člověkohodiny |
| Potenciál zkrácení času | Skutečné hodiny − hodiny při cílové produktivitě | Člověkohodiny; nikoli automatická úspora |
| Náklad placeného čekání | Člověkohodiny čekání × odpovídající nákladová sazba | Kč; ne automaticky odstranitelný náklad |
| Zmetkovitost | Vadné kusy / všechny vyrobené kusy × 100 | % |
| Dobré kusy | Celkem vyrobené kusy − vadné kusy | Pro vymezený okamžik hodnocení |
| Náklady vyřazených kusů | Vyřazené kusy × dosud vynaložený náklad na kus | Kč; zohledni případnou zbytkovou hodnotu |
| Náklady na dobrý kus | Celkové zahrnuté výrobní náklady / dobré kusy | Kč/dobrý kus |
| Náklady navíc kvůli zmetkům | Náklady získání požadovaných dobrých kusů − náklady stejného počtu dobrých kusů bez vad | Stejný výsledný objem |

Náklady vadných kusů a jejich náhrady lze sečíst. Celý součet ale není automaticky nákladem **navíc** — dobré kusy bychom museli vyrobit i bez vad. Pokud plán již obsahuje běžné ztráty, odchylku počítej proti tomuto plánu.

### 11.8 Kapacita a úzké místo

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Potřeba strojové kapacity | Kusy × normovaný strojový čas na kus | Strojové hodiny |
| Rozdíl kapacity | Potřebné hodiny − dostupné hodiny | Kladný = nedostatek; záporný = rezerva |
| Kusy potřebné k předvýrobě | Chybějící hodiny / čas stroje na kus | Ks; za uvedených předpokladů |
| Příspěvek na hodinu úzkého místa | Příspěvek na kus / čas úzkého místa na kus | Kč/hod. |
| Výroba ze zbývající kapacity | Zbývající hodiny / čas stroje na kus | Ks; také omezeno poptávkou |
| Přínos dodatečné kapacity | Příspěvek dodatečně prodaných kusů − náklady na dodatečnou kapacitu | Kč; bez dvojího odečtení nákladů |

Pořadí podle příspěvku na hodinu používáme při jednom omezeném zdroji a zohledňujeme poptávku i další podmínky.

### 11.9 OEE

**Anglicky:** *Overall Equipment Effectiveness*.

| Ukazatel | Vzorec | Poznámka |
| --- | --- | --- |
| Doba provozu | Plánovaný výrobní čas − prostoje v tomto čase | Hodiny |
| Dostupnost | Doba provozu / plánovaný výrobní čas | Poměr |
| Ideální výstup za dobu provozu | Doba provozu × ideální rychlost | Ks |
| Výkon | Skutečné celkové kusy / ideální výstup za dobu provozu | Poměr |
| Kvalita | Dobré kusy / všechny vyrobené kusy | Poměr |
| OEE | Dostupnost × výkon × kvalita | Součin poměrů; na procenta převedeme × 100 |
| Přímá kontrola OEE | Dobré kusy / (plánovaný výrobní čas × ideální rychlost) | Pro jeden výrobek se stejnou ideální rychlostí |
| Získaný provozní čas | Plánovaný výrobní čas × (nová dostupnost − původní dostupnost) | Dostupnosti jako desetinné poměry |
| Změna v procentních bodech | Nová procentní hodnota − původní procentní hodnota | Procentní body |

Při násobení používej nezaokrouhlené vstupy a zaokrouhli až výsledek. Například změna OEE z 63,75 % na 74,375 % je **10,625 procentního bodu**, nikoli 10,625% relativní růst. Souhrnné OEE nepočítej prostým průměrem směnových procent.

### 11.10 Zásoby a rozpracovanost

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Zbývající hotové kusy | Počáteční kusy + dokončené kusy − prodané kusy | Bez jiných pohybů a ztrát |
| Náklady prodaných výrobků | Prodané kusy × odpovídající jednotkové ocenění | Kč; při stejném ocenění kusů |
| Hodnota hotových výrobků | Zbývající kusy × odpovídající jednotkové ocenění | Kč |
| Rozpracovaný kus — náš příklad | Již spotřebovaný materiál + dosud provedená práce | Kč/ks; režii jsme v příkladu vynechali |
| Dosavadní práce na kus | Celkový normovaný náklad práce na kus × podíl dokončené práce | Jen při rovnoměrném vzniku práce |
| Hodnota nedokončené výroby | Počet rozpracovaných kusů × dosavadní hodnota kusu | Při stejné rozpracovanosti |
| Hodnota po dokončení | Dosavadní hodnota rozpracovanosti + nové dokončovací náklady | Kč |
| Čistá realizovatelná hodnota | Očekávaná prodejní cena − náklady na dokončení a prodej | Kč |
| Rozdíl signalizující znehodnocení | Evidovaná hodnota − nižší čistá realizovatelná hodnota | Kladný rozdíl k posouzení |

Dokončení není prodej. Převod mezi nedokončenou výrobou a hotovými výrobky sám nevytváří tržby ani další výrobní náklad. Ocenění a případné snížení účetní hodnoty musí odpovídat příslušné metodice.

### 11.11 Krytí, objednávání a obrátkovost

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Krytí zásob | Aktuální použitelná zásoba / očekávaná denní spotřeba | Dny |
| Pojistná zásoba podle dní | Požadované dny rezervy × denní spotřeba | Např. kg |
| Objednací bod | Spotřeba během dodací lhůty + pojistná zásoba | Např. kg |
| Očekávaný stav před dodáním | Stav při objednání − spotřeba do dodání | Zjednodušeně bez dalších pohybů |
| Objednací množství | Cílový stav po dodání − očekávaný stav před dodáním | Zjednodušený model doplnění |
| Průměrná zásoba | (Počáteční stav + konečný stav) / 2 | Jednoduchý odhad; lze použít častější stavy |
| Obrátkovost materiálu | Spotřeba za období / průměrná zásoba | Počet obrátek za období |
| Doba obratu | Počet dní období / obrátkovost | Dny |
| Změna prostředků v průměrné zásobě | Nová průměrná hodnota − původní průměrná hodnota | Kč; při srovnatelném ocenění |
| Stáří konkrétní dávky | Datum hodnocení − datum příjmu dávky | Dny; výdej zbývající zásobu „neomladí“ |

Dodací lhůtu a spotřebu vyjadřuj ve stejném kalendáři. Objednávání v praxi zohledňuje také otevřené dodávky, rezervace a další omezení. **Nižší obrátkovost znamená delší dobu obratu.**

### 11.12 Rozhodování a přínos opatření

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Přínos dodatečné objednávky | Dodatečné tržby − všechny dodatečné náklady | Kč |
| Krátkodobá cenová hranice | Variabilní náklad na kus + ostatní dodatečné náklady / počet kusů | Bez vytlačení jiných příležitostí |
| Materiálový náklad na dobrý kus | Cena materiálu × spotřeba na dobrý kus | Např. Kč/kg × kg/ks |
| Rozdíl nákladů dodavatelů | Rozdíl nákladu na dobrý kus × počet dobrých kusů | Kč |
| Přínos dokončení zakázky | Budoucí příjem − budoucí náklady dokončení a prodeje | Porovnej také alternativní využití |
| Celkový výsledek zakázky | Celkové výnosy − dosavadní i budoucí náklady | Jiná otázka než rozhodnutí od této chvíle |
| Úspora z množstevní slevy | Sleva na jednotku × množství, na které sleva platí | Porovnání stejného celkového množství |
| Čistý přínos větší objednávky | Úspora na ceně − dodatečné skladování, financování a další relevantní dopady | Kč |
| Čistý přínos prevence | Očekávané odstranitelné dopady poruch − náklady prevence | Stejné období |
| Přínos omezení přesčasů | Odstraněné přesčasové hodiny × skutečně ušetřitelný dodatečný náklad na hodinu | Kč |

**Náklad obětované příležitosti** je přínos nejlepší dostupné alternativy, které se vzdáváme. Není totožný s rozdílem výhodnosti obou možností. Již nevratně vynaložené náklady zahrnujeme do hodnocení celého projektu, ale nemění rozdíl mezi budoucími variantami. Náklad spojený s problémem není automaticky nákladem, který jeho odstraněním ušetříme.

### 11.13 Uzávěrka a prognóza

| Ukazatel | Vzorec | Jednotka / poznámka |
| --- | --- | --- |
| Rovnoměrný měsíční náklad služby | Celková částka / počet měsíců, ke kterým se vztahuje | Např. pojištění |
| Náklad části služby provedené v měsíci | Celkový náklad × podložený podíl plnění v měsíci | Ne automaticky podle kalendářních dní |
| Celoroční prognóza | Skutečnost uzavřených měsíců + odhad zbývajících měsíců | Kč |
| Očekávaná odchylka roku | Celoroční prognóza − schválený roční rozpočet | Kč |
| Dopad zdražení do prognózy | Změna jednotkové ceny × očekávané množství, na které se změna projeví | Kč |
| Dopad při stejné měsíční spotřebě | Změna ceny × měsíční spotřeba × počet měsíců | Pouze pokud se nová cena plně projeví ve spotřebě |

Před přidáním nové částky ověř, zda již není ve skutečnosti nebo v dosavadním odhadu. Původní rozpočet zachováváme. Prognózu aktualizujeme podle nových informací.

### 11.14 Kontrola před použitím vzorce

1. Co přesně chci vyhodnotit?
2. Pracuji s plánovanou, nebo skutečnou výrobou?
3. Jde o vyrobené, nebo prodané kusy?
4. Používám skutečnou, nebo plánovanou cenu či sazbu?
5. Jsou jednotky, období a rozsah nákladů srovnatelné?
6. Je dopad už zahrnutý v jiném kroku?
7. Co výsledek znamená a co z něj zatím nelze vyvodit?

### 11.15 Finanční management a rozhodování CNC závodu — doplňkové vzorce

| Účel | Vzorec |
| --- | --- |
| Rozvaha | `Aktiva = vlastní kapitál + závazky` |
| EBITDA (při odpovídající definici) | `EBIT + odpisy a amortizace` |
| EBIT marže | `EBIT / tržby × 100` |
| CM marže | `CM / tržby × 100` |
| ROA – zde provozní varianta | `EBIT / průměrná aktiva × 100` |
| ROE | `Čistý zisk / průměrný vlastní kapitál × 100` |
| Běžná likvidita | `Oběžná aktiva / krátkodobé závazky` |
| Provozní pracovní kapitál (OWC) | `Zásoby + obchodní pohledávky − dodavatelské závazky` |
| Strojní sazba – model | `Fixní náklady / plánované produktivní hodiny + variabilní Kč/h` |
| Seřízení na kus | `Čas seřízení × sazba seřízení / počet kusů v dávce` |
| CM na strojní hodinu | `CM/ks × 60 / minuty úzkého místa na ks` |
| Mimořádná zakázka | `Dodatečné tržby − dodatečné variabilní a ostatní relevantní náklady` |
| Bod rovnosti Make or Buy | `Ušetřitelné fixní náklady / (nákupní cena − variabilní vlastní náklad/ks)` |
| Jednoduchá návratnost | `Investice / stálý čistý roční peněžní přínos` |
| Současná hodnota za t let | `CFₜ / (1 + r)^t` |
| NPV | `−I₀ + Σ CFₜ / (1 + r)^t` |
| COPQ v % tržeb | `COPQ / tržby × 100` |
| Příspěvek zákazníka po specifických nákladech | `Tržby − variabilní náklady − specifické zákaznické náklady` |
| Změna EBITDA v bridge | `Součet nezávislých dopadů do zisku při jednotné metodice` |

**Kontrola příkladů:** cash úspora není automaticky účetní úspora; fixní režie na kus není skutečný přírůstkový náklad; EBIT a EBITDA nejsou totéž; příspěvek po specifických nákladech není čistý zisk zákazníka. Vždy uváděj jednotky, období, předpoklady a rozsah nákladů.

## 12. Časté chyby a pracovní postup

### 12.1 Co si neplést

| Chybná zkratka | Správná úvaha |
| --- | --- |
| Fixní náklad je režie | Jde o dvě nezávislá členění: chování vůči objemu a způsob přiřazení |
| Přímá výrobní mzda je vždy variabilní | Přímé přiřazení neříká, zda se celková mzda změní s objemem výroby |
| Příspěvek je další náklad na fixy | Je to část tržeb zbývající po variabilních nákladech; pokrývá fixní náklady a potom tvoří zisk |
| Dodatečná zakázka musí znovu uhradit stejný příděl fixů | Rozhodují náklady a přínosy, které se přijetím zakázky skutečně změní |
| Nižší náklady na kus znamenají úsporu | Mohou vzniknout pouze rozpočítáním stejných fixních nákladů mezi více kusů |
| Největší procentní růst je největší problém | Pro dopad na výsledek sleduj korunovou částku i relativní změnu |
| Skutečné náklady stačí porovnat s původním plánem | Pro hodnocení hospodárnosti odděl změnu objemu a sortimentu |
| Přepočtený rozpočet je skutečnost | Stále jde o očekávané náklady podle plánovaných norem a sazeb pro skutečný rozsah činnosti |
| Příznivá odchylka automaticky znamená úsporu | Ověř úplnost nákladů, odložení činnosti a skutečnou příčinu |
| Nulová celková odchylka znamená, že není problém | Nepříznivý a příznivý vliv se mohly vyrušit |
| Více hodin znamená pomalé lidi | Ověř prostoje, normu a podmínky výroby |
| Celé mzdové překročení je odchylka pracnosti | Odděl vliv hodin a vliv hodinové sazby |
| Lepší OEE automaticky znamená vyšší zisk | Ověř odbyt, využití získané kapacity a odstranitelné náklady |
| Všechny výrobní náklady ihned odečtu od tržeb | Příslušná hodnota neprodané výroby může zůstat v zásobách |
| Zásoby jsou jen vstupní materiál | Patří sem také rozpracovaná výroba a hotové výrobky |
| Zaplacení znamená vznik nákladu | Peněžní výdaj a spotřeba zdrojů mohou nastat v různých obdobích |
| Faktura určuje měsíc nákladu | Rozhoduje věcná a časová souvislost, nikoli samotné doručení faktury |
| Úplná kalkulace je automaticky oceněním zásoby | Rozsah nákladů zahrnovaných do zásob se řídí příslušnou metodikou |
| Starý materiál je automaticky bezcenný | Ověř jeho využití, stav a ekonomickou hodnotu |
| Nedávný výdej znamená, že zásoba není stará | Výdej nevynuluje stáří zbývajících kusů nebo šarží |
| Výhodnější nákup má nejnižší cenu za kilogram | Sleduj náklad na dobrý kus a další dopady |
| Už jsme utratili hodně, musíme zakázku dokončit | Porovnej budoucí varianty; nevratné minulé náklady jejich rozdíl nemění |
| Odstraněním problému ušetříme všechny náklady, které s ním souvisejí | Ověř, které náklady skutečně zmizí a co představuje pouze získanou kapacitu |
| Provedené opatření znamená dosažený přínos | Účinek ověř následnými výsledky při srovnatelných podmínkách |
| Rozpočet přepíšu podle aktuálního očekávání | Aktualizuj prognózu a zachovej schválený srovnávací základ |

### 12.2 Postup při analýze

**1. Vyjasni otázku a rozhodnutí** — Zjisti: Co přesně máme vyhodnotit? Za jaké období, středisko, výrobek nebo zakázku? Proti čemu porovnáváme: rozpočtu, minulému měsíci, nebo minulému roku? Jaké rozhodnutí má analýza podpořit? Například zadání „materiálové náklady vzrostly o 12 %“ není samo o sobě dostatečně určité. **2. Ověř data** — Prověř:

- správné období a jednotky;
- úplnost nákladů a uzávěrkových úprav;
- duplicity a chybějící hodnoty;
- správné přiřazení k zakázce, výrobku a středisku;
- použité filtry;
- návaznost součtů na zdrojová data.

Nejdřív ověř, zda je vykázaný rozdíl skutečný. Chybná data mohou vytvořit zdánlivou odchylku. **3. Zajisti srovnatelnost** — Zohledni: plánovaný a skutečný objem dobré výroby; sortiment a náročnost výrobků; změnu rozpracovanosti; změny výrobních postupů; shodnou metodiku výpočtu. Vyšší celkové náklady mohou odpovídat většímu rozsahu výroby. Pro posouzení hospodárnosti použij také plán přepočtený na skutečnou výrobu. **4. Vyčísli hlavní odchylky** — Uveď: rozdíl v Kč; relativní změnu v %; podíl hlavních příčin na celkové odchylce; srovnávací základ. Odděl například objem, spotřebu, cenu, pracnost a hodinovou sazbu. Kontrola: jednotlivé vlivy musí navazovat na celkový rozdíl.

**5. Získej provozní vysvětlení** — Výpočet ukazuje velikost vlivu, nikoli automaticky jeho příčinu. S nákupem, výrobou, technologií, kvalitou, údržbou nebo dalšími odpovědnými útvary ověř, co se skutečně stalo. Rozlišuj: potvrzený fakt; podložený odhad; zatím neověřenou hypotézu. Samotné překročení normy neopravňuje k závěru „výroba plýtvá“. **6. Porovnej varianty** — Posuzuj: dodatečné výnosy a náklady; dostupnou kapacitu; přínos nevyužité alternativy; proveditelnost, rizika a smluvní závazky. Rozlišuj výsledek celého projektu a přínos rozhodnutí od této chvíle.

**7. Doporuč opatření** — Uveď: co se má udělat; kdo odpovídá; do kdy; jaký přínos očekáváme; podle čeho ho ověříme. Například „snížit spotřebu“ není dostatečně konkrétní úkol. Controller připravuje ekonomické podklady a doporučení. Provozní opatření provádí odpovědný útvar a rozhodnutí přijímá osoba s příslušnou pravomocí. **8. Aktualizuj prognózu** — Zohledni, které příčiny budou pokračovat a které byly odstraněny. Dosavadní náklady zůstávají ve skutečnosti. Jednorázové nebo odstraněné problémy automaticky neopakuj. Pokračující změny cen a další očekávané dopady zahrň. Ověř, že stejná položka už není započtená. Zachovej dohledatelné předpoklady a verzi prognózy. Původní schválený rozpočet ponech jako srovnávací základ.

**9. Ověř výsledek opatření** — Zkontroluj nejen splnění úkolu, ale také skutečný účinek. Například: „stroj byl seřízen“ potvrzuje provedení; „spotřeba na dobrý kus se vrátila k normě při zachování kvality“ dokládá účinek. Rozlišuj peněžní úsporu, zabránění budoucím nákladům a získanou kapacitu.

### 12.3 Praktické využití datových nástrojů

| Nástroj | Typické použití |
| --- | --- |
| **Excel** | Kalkulace, tabulky odchylek, kontingenční tabulky, rozhodovací scénáře a prognózy |
| **Power Query** | Opakovatelné načtení, čištění a sjednocení účetních a výrobních exportů |
| **SQL** | Kontroly, spojování a agregace dat při zachování správné úrovně detailu |
| **Power BI** | Datový model, míry DAX, trendy a dohledání odchylky podle střediska, stroje, zakázky či výrobku |
| **Python** | Příprava a analýza dat v `pandas`, automatizace kontrol a opakovaných výpočtů, porovnávání scénářů a optimalizace výrobního mixu při kapacitních omezeních pomocí `scipy.optimize` |

**Pojmy:** úroveň detailu = *grain / granularity*; agregace = *aggregation*; faktová tabulka = *fact table*; dimenze neboli číselník = *dimension*. Úroveň detailu říká, co představuje jeden řádek: například jeden materiálový výdej, časový záznam nebo měsíční souhrn zakázky. **Riziko násobení částek při spojování** — Jedna zakázka má: 2 materiálové výdeje: 100 Kč a 200 Kč; 3 časové záznamy: 1, 2 a 3 hodiny. Správné součty jsou: materiál: **300 Kč**; práce: **6 hodin**. Pokud obě detailní tabulky spojíme pouze přes číslo zakázky, každý výdej se spojí se všemi třemi časovými záznamy. Vznikne **2 × 3 = 6 řádků**.

| Údaj | Správně | Prostý součet po chybném spojení |
| --- | ---: | ---: |
| Materiál | 300 Kč | 900 Kč |
| Čas | 6 hodin | 12 hodin |

Nejde nutně o původní duplicity. Násobení vzniklo způsobem spojení tabulek.

**Řešení pro přehled na úrovni zakázky**

1. Samostatně agreguj materiál na jednu zakázku.
2. Samostatně agreguj práci na jednu zakázku.
3. Teprve potom výsledky spoj.

| Zakázka | Materiál | Práce |
| --- | ---: | ---: |
| Z | 300 Kč | 6 hodin |

Pokud potřebujeme zachovat detail, můžeme pracovat s oddělenými faktovými tabulkami a společnými číselníky ve správně navrženém datovém modelu. Vhodný postup závisí na požadované úrovni analýzy. **Kontroluj počty řádků i součty před spojením a po něm. Správný vzorec nezachrání nesprávně propojená data.**

### 12.4 Věta, kterou má umět controller doložit

> Co se změnilo, proč se to změnilo, jaký to má dopad na firmu a co s tím doporučujeme udělat?

Odpověď musí stát na ověřených údajích, srovnatelném základu a doložených předpokladech. Samotné číslo nebo graf bez vysvětlení k rozhodnutí nestačí.

## 13. Česko-anglický slovníček a zkratky

Anglické názvy se mohou mezi firmami lišit. Použité významy odpovídají našemu školení. Slovníček upřesňuje již probrané pojmy; nepřidává další témata. U českých účetních položek může být anglický název jen popisným překladem. Zkratky používej až po vysvětlení a u interních reportů ověř firemní definici. V britské angličtině se píše *labour, favourable, utilisation, ageing, realisable*; americké varianty jsou *labor, favorable, utilization, aging, realizable*.

| Český pojem | Anglický název / zkratka | Význam v praxi |
| --- | --- | --- |
| Výrobní controller | Manufacturing controller / plant controller | Ekonomická analýza výroby a podklady pro řízení závodu. |
| Nákladové středisko | Cost centre | Organizační jednotka, ke které sledujeme náklady. |
| Tržby | Sales revenue | Výnosy z prodeje; nejsou totožné s inkasem peněz. |
| Provozní zisk | Operating profit | Provozní výnosy minus odpovídající provozní náklady. |
| Výrobní náklad | Manufacturing cost | Hodnota zdrojů spotřebovaných při výrobě. Příslušná část může zůstat v zásobách; nemusí celá ihned snížit zisk. |
| Náklad ve výsledku období | Expense | Náklad promítnutý do výsledku období; odlišuj jej od nákladové hodnoty uložené v zásobě. |
| Peněžní výdaj | Cash outflow / cash payment | Úbytek peněz. Platba sama neurčuje vznik výrobního nákladu ani období nákladu. |
| Fixní náklady | Fixed costs | Celkově přibližně stejné v daném období a rozsahu kapacity. Na kus se s objemem mění. |
| Variabilní náklady | Variable costs | Mění se s rozsahem činnosti. |
| Přímé náklady | Direct costs | Přímo přiřaditelné vymezenému výrobku či zakázce. Nemusejí být variabilní. |
| Nepřímé náklady; režie | Indirect costs; overhead | Společné náklady přiřazované nepřímo podle základny. Mohou být fixní i variabilní. |
| Příspěvek na úhradu | Contribution / contribution margin | Tržby minus odpovídající variabilní náklady prodaných kusů. Kryje fixní náklady a poté tvoří zisk; není dalším nákladem. |
| Příspěvek na kus | Unit contribution margin | Cena minus variabilní náklad na kus. |
| Bod zvratu | Break-even point (BEP) | Objem prodeje, při kterém příspěvek právě pokryje fixní náklady a zisk je nulový. |
| Kalkulace výrobku | Product costing | Stanovení nákladů výrobku. |
| Úplná kalkulace | Full costing | V našem modelu zahrnuje výrobní, správní i prodejní náklady. |
| Kalkulace s absorpcí výrobní režie | Absorption costing | Zahrnuje do výrobních nákladů i přiřazenou fixní výrobní režii; rozsah neztotožňuj automaticky s úplnou kalkulací všech nákladů firmy. |
| Kalkulace variabilních nákladů | Variable costing / marginal costing | Fixní náklady sleduje odděleně od variabilních nákladů výrobků. |
| Kalkulace standardních nákladů | Standard costing | Práce s předem stanovenými náklady a jejich odchylkami. |
| Přímý materiál | Direct materials | Materiál přiřazený konkrétním výrobkům. |
| Přímé výrobní mzdy | Direct labour | Pracovní náklady přímo přiřazené výrobku nebo zakázce. Přímé přiřazení samo neznamená variabilitu. |
| Výrobní režie | Manufacturing overhead / factory overhead | Nepřímé náklady výroby. |
| Správní režie | Administrative overhead | Náklady na celkové řízení a administrativu. Obecnou správu v našem modelu nezahrnujeme do zásob. |
| Prodejní režie | Selling overhead / selling expenses | Náklady na získávání a obsluhu prodeje. V našem modelu jsou nákladem příslušného období, nikoli hodnotou zásoby. |
| Rozvrhová základna | Allocation base / absorption base | Veličina pro rozdělení režie, například strojové hodiny nebo plocha. Její použití neurčuje fixní či variabilní charakter nákladu. |
| Režijní sazba | Overhead rate / overhead absorption rate | Režie připadající na jednotku základny. |
| Plán; skutečnost | Plan; actuals | Srovnávací základ a dosažené hodnoty. |
| Norma | Standard | Předem stanovená spotřeba, čas či sazba. |
| Analýza odchylek | Variance analysis | Rozklad rozdílu a vysvětlení jeho příčin. |
| Příznivá odchylka | Favourable variance (F) | Příznivý dopad; znaménko záleží na metodice. |
| Nepříznivá odchylka | Adverse / unfavourable variance (A / U) | Nepříznivý dopad; znaménko záleží na metodice. |
| Flexibilní rozpočet | Flexible budget / flexed budget | Flexible budget vyjadřuje rozpočet podle rozsahu činnosti; flexed budget je přepočet na skutečný rozsah při plánovaných normách a sazbách. Stále jde o plán. |
| Cenová odchylka materiálu | Material price variance | V našem rozkladu: skutečná spotřeba × rozdíl skutečné a plánované ceny. Samostatná nákupní analýza může pracovat s nakoupeným množstvím. |
| Spotřební odchylka materiálu | Material usage variance / material quantity variance | Rozdíl skutečné spotřeby a normy pro skutečnou výrobu, oceněný plánovanou cenou. |
| Odchylka pracnosti | Labour efficiency variance | Rozdíl skutečných a normovaných hodin pro skutečnou výrobu, oceněný plánovanou sazbou. Může zahrnovat vliv prostojů. |
| Odchylka mzdové sazby | Labour rate variance | Skutečné hodiny × rozdíl skutečné a plánované nákladové sazby. Odděluj od vlivu počtu hodin. |
| Rozklad změny zisku | Profit bridge / profit variance analysis | Přechod od plánovaného ke skutečnému zisku podle příčin. Vliv objemu a nákladové odchylky započítáme každý právě jednou. |
| Výrobkový mix | Product mix | Skladba jednotlivých výrobků. |
| Produktivita práce | Labour productivity | Výstup na jednotku práce, například dobré kusy na člověkohodinu. Více kusů samo neznamená vyšší produktivitu. |
| Člověkohodiny | Labour hours / person-hours | Součet času pracovníků. Tři lidé čekající dvě hodiny představují šest člověkohodin. |
| Strojové hodiny | Machine hours | Čas stroje; nelze zaměnit s člověkohodinami. |
| Normohodiny | Standard hours | Normovaný čas odpovídající danému výkonu. |
| Prostoj; porucha | Downtime; breakdown | Prostoj je přerušení provozu; porucha je jedna z jeho příčin. Čas stroje odlišuj od čekání pracovníků. |
| Čas čekání pracovníků | Idle time | Čas bez produktivní činnosti, například kvůli poruše. |
| Přestavba; seřízení | Changeover; setup | Příprava či změna výroby. |
| Zmetkovitost | Defect rate / reject rate | Podíl vadných kusů podle vymezené metodiky. |
| Vyřazené kusy; odpad | Scrap | Kusy či materiál vyřazené ze zamýšleného použití. Scrap rate nemusí zahrnovat všechny opravitelné vady. |
| Přepracování | Rework | Dodatečné zpracování pro dosažení požadované kvality. |
| Dobré kusy | Good units | Kusy splňující požadavky. |
| Kapacitní plánování | Capacity planning | Porovnání potřebné a dostupné kapacity. |
| Využití kapacity | Capacity utilisation | Využitá část vymezené kapacity; metodiku je nutné určit. |
| Úzké místo | Bottleneck | Zdroj omezující průtok výroby. |
| Omezující faktor | Limiting factor / constraint | Například strojový čas, materiál nebo pracovníci. |
| Příspěvek na hodinu úzkého místa | Contribution per bottleneck hour | Příspěvek dělený spotřebou omezeného času. |
| Celková efektivnost zařízení | Overall Equipment Effectiveness (OEE) | Součin dostupnosti, výkonu a kvality. Vyšší OEE samo nedokazuje finanční přínos. |
| Dostupnost v OEE | Availability | Doba provozu dělená plánovaným výrobním časem. |
| Výkon v OEE | Performance | Skutečný celkový výstup vůči ideálnímu výstupu za dobu, kdy stroj běžel. Prostoje už zachycuje dostupnost. |
| Kvalita v OEE | Quality | Podíl dobrých kusů na celkovém výstupu. |
| Zásoby | Inventory / stock | Materiál, rozpracovaná výroba, výrobky a další vymezené kategorie. |
| Materiál | Raw materials (RM) | Vstupy před spotřebou. |
| Nedokončená výroba | Work in progress / work in process (WIP) | Rozpracované výrobky. |
| Hotové výrobky | Finished goods (FG) | Dokončené výrobky připravené k prodeji. |
| Zboží | Merchandise | Nakoupené předměty určené k dalšímu prodeji. |
| Náklady prodaných výrobků | Cost of goods sold (COGS) | Hodnota prodaných výrobků promítnutá ze zásob do výsledku; nejde automaticky o náklady celé aktuální výroby. |
| Ocenění zásob | Inventory valuation | Stanovení peněžní hodnoty zásob. |
| Účetní hodnota | Carrying amount / book value | Hodnota vedená v účetnictví. |
| Stupeň dokončení | Degree of completion | Podíl dokončených operací; může být různý pro materiál a práci. Dokončení práce z 25 % neznamená 25 % všech nákladů. |
| Výrobní zakázka | Production order / manufacturing order | Jednotka evidence konkrétní výroby. |
| Čistá realizovatelná hodnota | Net realisable value (NRV) | Očekávaná prodejní cena minus náklady nutné k dokončení a prodeji. |
| Snížení hodnoty zásoby | Inventory write-down | Úprava účetní hodnoty směrem dolů. |
| Úplný odpis zásoby | Inventory write-off | Odstranění účetní hodnoty podle okolností a metodiky. |
| Doba krytí zásob | Days of supply / inventory coverage | Na kolik dní očekávané spotřeby vystačí aktuální použitelná zásoba. |
| Objednací bod | Reorder point (ROP) | Úroveň pro zahájení doplnění zásoby. Operativně ji sleduje nákup či plánování; controller hodnotí ekonomické dopady. |
| Pojistná zásoba | Safety stock | Rezerva pro nejistotu spotřeby a dodávek. |
| Dodací lhůta | Lead time | Čas od zahájení objednání do dostupnosti dodávky. |
| Objednací množství | Order quantity | Velikost objednávky. |
| Obrátkovost zásob | Inventory turnover | Počet obrátek za období. |
| Doba obratu zásob | Days inventory outstanding (DIO) / inventory holding period | Kolika dnům spotřeby odpovídá průměrná zásoba za uplynulé období. Odlišuj od krytí aktuální zásoby. |
| Průměrná zásoba | Average inventory | Průměrný stav za období. |
| Analýza stáří zásob | Inventory ageing analysis | Hodnocení stáří zbývajících kusů či šarží podle příjmu. Nedávný výdej stáří zbývající zásoby nevynuluje. |
| Pomaluobrátkové zásoby | Slow-moving inventory | Zásoby s nízkou spotřebou nebo výdeji. |
| Zásoby bez pohybu | Non-moving inventory | Zásoby bez pohybu ve vymezeném období. |
| Zastaralé zásoby | Obsolete inventory | Zásoby, které již neodpovídají potřebám či požadavkům. |
| Výroba na sklad | Make-to-stock (MTS) | Výroba před konkrétním odběrem ze zásoby. |
| Výroba na objednávku | Make-to-order (MTO) | Výroba vyvolaná konkrétní objednávkou. |
| Náklady držení zásob | Inventory carrying costs / holding costs | Například skladování, financování a související rizika. |
| Peníze vázané v zásobách | Cash tied up in inventory | Prostředky vložené do zatím nespotřebovaných či neprodaných zásob. |
| Relevantní náklady | Relevant costs | Budoucí náklady, které se mezi posuzovanými variantami liší. |
| Utopené náklady | Sunk costs | Již vzniklé nevratné náklady. Patří do výsledku celého projektu, ale nemění rozdíl mezi budoucími variantami. |
| Náklad obětované příležitosti | Opportunity cost | Přínos nejlepší dostupné alternativy, které se vzdáme. Není totožný s rozdílem výhodnosti dvou variant. |
| Dodatečné náklady | Incremental costs | Náklady vznikající v důsledku rozhodnutí. |
| Mimořádná objednávka | Special order | Dodatečná objednávka posuzovaná podle konkrétních podmínek. |
| Přesčas; přesčasový příplatek | Overtime; overtime premium | Čas navíc a příplatek nad základní odměnu. |
| Množstevní sleva | Quantity discount / volume discount | Sleva podmíněná objemem odběru. |
| Čistý přínos | Net benefit | Přínosy po odečtení souvisejících dodatečných nákladů. |
| Úspora nákladů | Cost saving | Doložené snížení nákladů proti srovnatelné variantě. Příznivá odchylka nebo získaný čas úsporu ještě nedokazují. |
| Zabránění budoucím nákladům | Cost avoidance | Předejití nákladům, které by jinak vznikly. |
| Preventivní údržba | Preventive maintenance | Opatření snižující riziko poruch. |
| Měsíční uzávěrka | Month-end close | Uzavření a ověření údajů měsíce. |
| Správné přiřazení do období | Cut-off / period allocation | Zachycení operací v odpovídajícím období. |
| Zachycení vzniklých nevyfakturovaných nákladů | Accrual | Zachycení již vzniklého nákladu do správného období před fakturací. Není automaticky přesným synonymem české dohadné položky. |
| Náklady příštích období | Prepaid expenses / prepayments | Částky vztahující se k budoucí spotřebě služby. |
| Rozpočet | Budget | Schválený plán, zde zejména nákladů. |
| Prognóza | Forecast | Aktualizovaný odhad očekávaného vývoje. |
| Skutečnost od začátku roku | Year to date actuals (YTD actuals) | Kumulovaná skutečnost od začátku roku. |
| Celoroční prognóza | Full-year forecast | Skutečnost dosavadních měsíců a odhad zbývajících. |
| Manažerský reporting | Management reporting | Podklady pro řízení a rozhodování. |
| Komentář k odchylce | Variance commentary | Vyčísluje rozdíl, uvádí srovnávací základ, ověřené příčiny, opatření a dopad do výhledu. |
| Plán opatření | Action plan | Co se provede, kdo odpovídá, do kdy, jaký efekt očekáváme a jak jej ověříme. |
| Odpovědná osoba; termín | Action owner; due date | Vlastník úkolu a datum splnění. |
| Klíčový ukazatel výkonnosti | Key performance indicator (KPI) | Ukazatel používaný pro hodnocení cíle. |
| Základní příčina | Root cause | Příčina, jejímž odstraněním předcházíme opakování problému. |
| Předpoklad; scénář | Assumption; scenario | Vstup odhadu a konkrétní varianta budoucího vývoje. |
| Procentní bod | Percentage point (pp) | Rozdíl procentních hodnot. Z 75 % na 80 % je +5 procentních bodů, relativně přibližně +6,67 %. |
| Normované množství pro skutečnou výrobu | Standard quantity allowed for actual output | Skutečná dobrá výroba × norma materiálu na kus; v našich příkladech bez změny rozpracovanosti. |
| Normované hodiny pro skutečnou výrobu | Standard hours allowed for actual output | Skutečná výroba × norma času na kus. Odlišuj od hodin původního plánu. |
| Pracnost na kus | Labour time per unit / labour content per unit | Pracovní čas potřebný na jednotku výrobku, například 0,3 člověkohodiny/ks. Odlišuj od korunové odchylky pracnosti. |
| Hodinová nákladová sazba práce | Hourly labour cost rate | Náklad na jednu člověkohodinu v dohodnutém rozsahu; nemusí jít jen o hodinovou mzdu. |
| Vliv objemu výroby | Production volume effect / variance | Změna nákladů vysvětlená změnou výroby při plánovaných normách a sazbách. Konkrétní definici ověř ve firemním reportu. |
| Dopad změny objemu prodeje do zisku | Sales volume effect on profit | Při stejných ostatních podmínkách rozdíl prodaných kusů × plánovaný příspěvek na kus. |
| Náklady na dobrý kus | Cost per good unit | Zahrnuté výrobní náklady dělené počtem dobrých kusů. Zachycují i dopad vyřazených kusů v daném modelu. |
| Získaná kapacita | Freed-up capacity / additional available capacity | Čas uvolněný zlepšením. Finanční přínos záleží na využití nebo odstranění jiných nákladů. |
| Krátkodobá minimální cena | Short-run minimum price | Cena pokrývající relevantní náklady konkrétní objednávky; zohledni vytlačení jiných příležitostí. |
| Dohadná položka pasivní | Accrued liability based on an estimate | Zachycení závazku s odhadovanou částkou. Překlad je popisný; účetní systémy nemají vždy přesnou shodu položek. |
| Odpis výrobního stroje | Depreciation | Postupné zachycení spotřeby hodnoty stroje. Neznamená současný peněžní výdaj. |
| Úroveň detailu | Grain / granularity | Co představuje jeden řádek, například výdej, časový záznam nebo souhrn zakázky. |
| Agregace | Aggregation | Seskupení a souhrn dat na zvolenou úroveň detailu. |
| Faktová tabulka | Fact table | Události nebo stavy s měřenými hodnotami na jasné úrovni detailu. |
| Dimenze; číselník | Dimension | Popisné údaje a klíče pro filtrování a členění výsledků, například výrobky, střediska nebo datum. |

| Rozvaha; výsledovka; peněžní tok | Balance sheet; P&L / income statement; cash flow | Stav majetku a financování; výnosy a náklady; pohyb peněz. |
| Aktiva; vlastní kapitál; závazky | Assets; equity; liabilities | Platí aktiva = vlastní kapitál + závazky. |
| Akruální princip | Accrual accounting | Výnosy a náklady patří do věcně a časově souvisejícího období. |
| EBITDA; EBIT; EBT | Earnings before interest, taxes, depreciation and amortisation; earnings before interest and taxes; earnings before taxes | Úrovně výsledku před vybranými položkami. |
| Čistý zisk; EBIT marže; příspěvková marže | Net profit; EBIT margin; contribution margin ratio | Zisk po dani; EBIT/tržby; CM/tržby. |
| Rentabilita aktiv; rentabilita vlastního kapitálu | Return on assets (ROA); return on equity (ROE) | V zdejší metodice EBIT/průměrná aktiva a čistý zisk/průměrný vlastní kapitál. |
| Likvidita; běžná likvidita; zadluženost | Liquidity; current ratio; leverage / indebtedness | Schopnost hradit závazky; oběžná aktiva/krátkodobé závazky; využití dluhu. |
| Provozní páka | Operating leverage | Citlivost zisku na objem při přítomnosti fixních nákladů. |
| Strojní hodinová sazba; produktivní strojní hodina | Machine-hour rate; productive machine hour | Náklady přiřazené na hodinu využité výrobní kapacity. |
| Seřízení; velikost výrobní dávky | Setup / changeover; batch size / lot size | Příprava na výrobu a počet kusů rozdělujících náklady seřízení. |
| Absorpce režie; nepokrytá fixní režie | Overhead absorption; under-absorbed fixed overhead | Rozvržení režie výkonům; nepokrytí plánovanou rozvrhovou základnou. |
| Můstek EBITDA; finanční dopad | EBITDA bridge / waterfall; profit impact | Rozklad rozdílu výsledku na ověřené nezávislé vlivy. |
| Ovlivnitelnost nákladů | Controllability | Možnost odpovědného manažera daný náklad nebo výsledek ovlivnit. |
| Náklady na nekvalitu; náklady kvality | Cost of Poor Quality (COPQ); Cost of Quality (COQ) | COPQ zahrnuje ztráty z nekvality, COQ i prevenci a kontrolu. |
| Reklamace; mimořádné třídění | Customer claims / warranty; containment / sorting | Externí dopady vad a mimořádná kontrola dílů. |
| Vyrábět, nebo nakoupit; outsourcing | Make or buy; outsourcing | Rozhodnutí mezi vlastní výrobou a externí dodávkou. |
| Ušetřitelné fixní náklady | Avoidable fixed costs | Fixní náklady, které skutečně zaniknou při změně varianty. |
| Kapitálový výdaj; provozní výdaj | Capital expenditure (CAPEX); operating expenditure (OPEX) | Investiční výdaj versus provozní výdaj / náklad dle kontextu. |
| Jednoduchá doba návratnosti; NPV | Simple payback period; net present value | Rychlost návratu peněz; hodnota budoucích toků po diskontování. |
| Současná hodnota; diskontní sazba | Present value (PV); discount rate | Hodnota budoucího toku dnes a míra jeho diskontování. |
| Zákaznická profitabilita; zákaznické specifické náklady | Customer profitability; customer-specific costs | Ekonomika zákazníka včetně nákladů vyvolaných jeho obsluhou. |
| Provozní pracovní kapitál; uvolnění pracovního kapitálu | Operating working capital (OWC); working capital release | Zásoby + pohledávky − dodavatelské závazky; snížení potřeby financování. |
| Pohledávky; dodavatelské závazky | Accounts receivable (AR); accounts payable (AP) | Odběratelé dluží nám; my dlužíme dodavatelům. |
| Rolling forecast; směnnost | Rolling forecast; shift pattern | Průběžně aktualizovaný výhled; organizace směn. |

### 13.1 Anglické zkratky v reportu

| Zkratka | Rozvinutí | Český význam |
| --- | --- | --- |
| ACT | Actual / actuals | Skutečnost |
| BUD | Budget | Rozpočet |
| FCST | Forecast | Prognóza |
| FY | Full year | Celý rok |
| YTD | Year to date | Od začátku roku do vykazovaného data |
| MTD | Month to date | Od začátku měsíce do vykazovaného data |
| F / U / A | Favourable / unfavourable / adverse | Příznivá / nepříznivá odchylka; ověř značení, A může jinde znamenat actual |
| COGS | Cost of goods sold | Náklady prodaných výrobků |
| RM | Raw materials | Materiál |
| WIP | Work in progress / process | Nedokončená výroba |
| FG | Finished goods | Hotové výrobky |
| OEE | Overall Equipment Effectiveness | Celková efektivnost zařízení |
| KPI | Key performance indicator | Klíčový ukazatel výkonnosti |
| NRV | Net realisable value | Čistá realizovatelná hodnota |
| ROP | Reorder point | Objednací bod |
| DIO | Days inventory outstanding | Doba obratu zásob |
| BEP | Break-even point | Bod zvratu |
| MTS / MTO | Make-to-stock / make-to-order | Výroba na sklad / na objednávku |
| pp | Percentage points | Procentní body |

| P&L | Profit and loss | Výsledovka |
| EBITDA | Earnings before interest, taxes, depreciation and amortisation | Provozní výsledek před odpisy, úroky a daněmi (dle definice firmy) |
| EBIT | Earnings before interest and taxes | Provozní zisk před úroky a daněmi |
| EBT | Earnings before taxes | Zisk před zdaněním |
| CM | Contribution margin | Příspěvek na úhradu |
| ROA / ROE | Return on assets / return on equity | Rentabilita aktiv / vlastního kapitálu |
| CAPEX / OPEX | Capital / operating expenditure | Investiční / provozní výdaj |
| NPV / PV | Net present value / present value | Čistá současná / současná hodnota |
| COPQ / COQ | Cost of Poor Quality / Cost of Quality | Náklady na nekvalitu / náklady kvality |
| OWC | Operating working capital | Provozní pracovní kapitál |
| AR / AP | Accounts receivable / accounts payable | Obchodní pohledávky / závazky |

### 13.2 Tři užitečné věty při čtení reportu

| Anglická formulace | Český význam |
| --- | --- |
| Actual manufacturing costs exceeded the flexed budget by CZK 30,000 (7.5%). | Skutečné výrobní náklady překročily rozpočet přepočtený na skutečný rozsah výroby o 30 000 Kč (7,5 %). |
| Higher material prices accounted for CZK 18,000, or 60% of the total cost overrun. | Vyšší ceny materiálu vysvětlují 18 000 Kč, tedy 60 % celkového překročení nákladů. |
| The full-year forecast has been updated; the original budget remains unchanged. | Celoroční prognóza byla aktualizována; původní rozpočet zůstává beze změny. |

Příklady vět navazují na kapitolu 9. **Flexed budget je stále plán pro skutečný rozsah činnosti, nikoli skutečnost.** Které vlivy přejdou do prognózy, posuzujeme podle jejich očekávaného pokračování.