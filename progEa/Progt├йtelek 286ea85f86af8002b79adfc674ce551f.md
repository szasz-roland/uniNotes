# Progtételek

# Programozási Minták - Részletes Jegyzetek

## Tartalomjegyzék

1. [Általános Összegzés](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)
2. [Megszámolás](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)
3. [Maximumkiválasztás](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)
4. [Minimumkiválasztás](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)
5. [Feltételes Maximumkeresés](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)
6. [Keresés](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)
7. [Eldöntés](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)
8. [Mind Eldöntés](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)
9. [Kiválasztás](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)
10. [Másolás](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)
11. [Kiválogatás](https://www.notion.so/Progt-telek-286ea85f86af8002b79adfc674ce551f?pvs=21)

---

## 1. Általános Összegzés

### Leírás

Az általános összegzés sablon egy univerzális minta, amely különböző műveletek végrehajtására használható egy intervallumon. A kulcs, hogy egy asszociatív művelettel dolgozunk, amely rendelkezik baloldali nullelemmel.

### Specifikáció

**Bemenet:**

- `e ∈ Z` - intervallum kezdete (egész szám)
- `u ∈ Z` - intervallum vége (egész szám)

**Kimenet:**

- `s ∈ H` - az összegzés eredménye

**Előfeltétel:**

- Nincs (üres intervallum esetén a nullelemet adjuk vissza)

**Utófeltétel:**

- `s = SZUMMA(i=e..u, f(i), 0, +)`
- Ha `e > u`, akkor `s` a nullelem értékét veszi fel

### Műveletek és Nullelemeik

| Művelet neve | Operátor | Nullelem |
| --- | --- | --- |
| Összeadás | + | 0 |
| Szorzás | * | 1 |
| Szövegösszefűzés | + | "" |
| Únió | ∪ | ∅ |
| Logikai ÉS | és | igaz |
| Logikai VAGY | vagy | hamis |

### NSD (Nassi-Shneiderman Diagram)

```
┌─────────────────────────────────────────────┐
│ s := nullelem                               │
├─────────────────────────────────────────────┤
│ ┌─ CIKLUS i := e .. u ───────────────────┐  │
│ │                                        │  │
│ │  s := s művelet f(i)                   │  │
│ │                                        │  │
│ └────────────────────────────────────────┘  │
└─────────────────────────────────────────────┘

```

### C# Implementáció

```csharp
// Példa 1: Számok összegzése egy intervallumon
// Feladat: Adjuk össze az [e..u] intervallum összes számát
int OsszegzesEgyszer(int e, int u)
{
    // s - az összeg tárolására szolgáló változó
    // Kezdőérték: 0 (az összeadás nulleleme)
    int s = 0;

    // Ciklus az e-től u-ig terjedő intervallumon
    // i végigmegy minden számon e-től u-ig (bezárólag)
    for (int i = e; i <= u; i++)
    {
        // Hozzáadjuk az aktuális számot az összeghez
        s = s + i;
    }

    // Visszaadjuk az eredményt
    return s;
}

// Példa 2: Számok szorzása egy intervallumon
// Feladat: Számítsuk ki az [e..u] intervallum számainak szorzatát
int Szorzas(int e, int u)
{
    // s - a szorzat tárolására szolgáló változó
    // Kezdőérték: 1 (a szorzás nulleleme)
    int s = 1;

    // Ciklus az e-től u-ig terjedő intervallumon
    for (int i = e; i <= u; i++)
    {
        // Megszorozzuk a jelenlegi szorzatot az aktuális számmal
        s = s * i;
    }

    return s;
}

// Példa 3: Páros számok összegzése
// Feladat: Adjuk össze az [e..u] intervallum páros számait
int ParosSzamokOsszege(int e, int u)
{
    // Összeg változó inicializálása
    int s = 0;

    // Végigmegyünk az intervallumon
    for (int i = e; i <= u; i++)
    {
        // Csak akkor adjuk hozzá, ha páros (osztható 2-vel)
        if (i % 2 == 0)
        {
            s = s + i;
        }
    }

    return s;
}

// Példa 4: Számok négyzeteinek összege
// Feladat: Számítsuk ki az [e..u] intervallum számainak négyzetösszegét
int NegyzetosszegSzamitas(int e, int u)
{
    int s = 0;

    for (int i = e; i <= u; i++)
    {
        // Hozzáadjuk i négyzetét az összeghez
        s = s + (i * i);
    }

    return s;
}

```

### Időbeli és Memória Komplexitás

- **Időkomplexitás:** O(n), ahol n = u - e + 1 (az intervallum hossza)
- **Memóriakomplexitás:** O(1) - csak az eredmény változót tároljuk

---

## 2. Megszámolás

### Leírás

A megszámolás sablon meghatározza, hogy egy adott feltétel hányszor teljesül egy intervallumon. Ez az általános összegzés speciális esete, ahol minden feltételt teljesítő elemhez 1-et adunk.

### Specifikáció

**Bemenet:**

- `e ∈ Z` - intervallum kezdete
- `u ∈ Z` - intervallum vége

**Kimenet:**

- `db ∈ N` - a feltételt teljesítő elemek száma (természetes szám)

**Előfeltétel:**

- Nincs

**Utófeltétel:**

- `db = DARAB(i=e..u, T(i))`

### Működési Logika

```
i      T(i)      hozzáadás
─────────────────────────────
e      IGAZ      +1
e+1    HAMIS     +0
e+2    HAMIS     +0
...    ...       ...
u      IGAZ      +1
─────────────────────────────
              db = 2

```

### NSD (Nassi-Shneiderman Diagram)

```
┌─────────────────────────────────────────────┐
│ db := 0                                     │
├─────────────────────────────────────────────┤
│ ┌─ CIKLUS i := e .. u ───────────────────┐  │
│ │                                        │  │
│ │  ┌─ HA T(i) ─────────────────────────┐ │  │
│ │  │                                   │ │  │
│ │  │  db := db + 1                     │ │  │
│ │  │                                   │ │  │
│ │  └───────────────────────────────────┘ │  │
│ │                                        │  │
│ └────────────────────────────────────────┘  │
└─────────────────────────────────────────────┘

```

### C# Implementáció

```csharp
// Példa 1: Páros számok megszámlálása
// Feladat: Számoljuk meg, hány páros szám van az [e..u] intervallumban
int ParosSzamokDarabszama(int e, int u)
{
    // db - darabszám változó (counter)
    // Kezdőérték: 0 (még semmit sem számoltunk)
    int db = 0;

    // Végigmegyünk az [e..u] intervallumon
    for (int i = e; i <= u; i++)
    {
        // Feltétel: páros szám (maradék nélkül osztható 2-vel)
        if (i % 2 == 0)
        {
            // Ha teljesül a feltétel, növeljük a számlálót
            db = db + 1;
            // Vagy rövidebben: db++;
        }
    }

    // Visszaadjuk a megszámolt elemek számát
    return db;
}

// Példa 2: Pozitív számok megszámlálása egy tömbben
// Feladat: Számoljuk meg, hány pozitív szám van a tömbben
int PozitivSzamokSzama(int[] tomb)
{
    int db = 0;

    // Végigmegyünk a tömb minden elemén
    // tomb.Length a tömb hossza
    for (int i = 0; i < tomb.Length; i++)
    {
        // Feltétel: az elem nagyobb mint 0
        if (tomb[i] > 0)
        {
            db++;
        }
    }

    return db;
}

// Példa 3: Adott értéknél nagyobb elemek számlálása
// Feladat: Számoljuk meg, hány elem nagyobb egy adott határ értéknél
int NagyobbElemekSzama(int[] tomb, int hatar)
{
    int db = 0;

    for (int i = 0; i < tomb.Length; i++)
    {
        // Feltétel: az elem nagyobb mint a határ
        if (tomb[i] > hatar)
        {
            db++;
        }
    }

    return db;
}

// Példa 4: Prímszámok megszámlálása egy intervallumban
// Feladat: Számoljuk meg, hány prímszám van az [e..u] intervallumban
int PrimszamokSzama(int e, int u)
{
    int db = 0;

    // Végigmegyünk az intervallumon
    for (int i = e; i <= u; i++)
    {
        // Ellenőrizzük, hogy i prímszám-e
        if (Prim(i))
        {
            db++;
        }
    }

    return db;
}

// Segédfüggvény: Eldönti, hogy egy szám prím-e
bool Prim(int n)
{
    // 1-nél kisebb vagy egyenlő számok nem prímek
    if (n <= 1)
    {
        return false;
    }

    // 2 és 3 prímek
    if (n <= 3)
    {
        return true;
    }

    // Páros számok (2-n kívül) nem prímek
    if (n % 2 == 0)
    {
        return false;
    }

    // Ellenőrizzük a páratlan osztókat gyök(n)-ig
    for (int i = 3; i * i <= n; i = i + 2)
    {
        if (n % i == 0)
        {
            return false;
        }
    }

    return true;
}

```

### Időbeli és Memória Komplexitás

- **Időkomplexitás:** O(n), ahol n az intervallum hossza
- **Memóriakomplexitás:** O(1) - csak a számláló változót tároljuk

---

## 3. Maximumkiválasztás

### Leírás

A maximumkiválasztás sablon meghatározza egy függvény maximális értékét és annak helyét egy nem üres intervallumon. Ez egy alapvető programozási minta, amit gyakran használunk.

### Specifikáció

**Bemenet:**

- `e ∈ Z` - intervallum kezdete
- `u ∈ Z` - intervallum vége

**Kimenet:**

- `maxind ∈ Z` - a maximum helye (index)
- `maxert ∈ H` - a maximum értéke

**Előfeltétel:**

- `e <= u` (az intervallum nem üres!)

**Utófeltétel:**

- `maxind ∈ [e..u]` (a maximum indexe az intervallumon belül van)
- `∀i ∈ [e..u]: f(maxind) >= f(i)` (a maximum nagyobb vagy egyenlő minden elemnél)
- `maxert = f(maxind)` (a maximum érték egyenlő a függvény értékével a maximum indexnél)

### NSD (Nassi-Shneiderman Diagram)

```
┌─────────────────────────────────────────────┐
│ maxind := e                                 │
│ maxert := f(e)                              │
├─────────────────────────────────────────────┤
│ ┌─ CIKLUS i := e+1 .. u ─────────────────┐  │
│ │                                        │  │
│ │  ┌─ HA f(i) > maxert ─────────────────┐│  │
│ │  │                                    ││  │
│ │  │  maxind := i                       ││  │
│ │  │  maxert := f(i)                    ││  │
│ │  │                                    ││  │
│ │  └────────────────────────────────────┘│  │
│ │                                        │  │
│ └────────────────────────────────────────┘  │
└─────────────────────────────────────────────┘

```

### C# Implementáció

```csharp
// Példa 1: Maximum keresése egy tömbben
// Feladat: Keressük meg a tömb legnagyobb elemét és annak indexét
void MaximumKivalasztas(int[] tomb, out int maxind, out int maxert)
{
    // FONTOS: Feltételezzük, hogy a tömb nem üres (Length >= 1)

    // Kezdőérték: az első elem lesz a kezdeti maximum
    maxind = 0;           // Az első elem indexe
    maxert = tomb[0];     // Az első elem értéke

    // Végigmegyünk a többi elemen (1-től kezdve)
    for (int i = 1; i < tomb.Length; i++)
    {
        // Ha az aktuális elem nagyobb a jelenlegi maximumnál
        if (tomb[i] > maxert)
        {
            // Akkor ez lesz az új maximum
            maxind = i;
            maxert = tomb[i];
        }
    }

    // A függvény végén maxind tartalmazza a legnagyobb elem indexét
    // maxert pedig a legnagyobb elem értékét
}

// Példa 2: Maximum keresése egy intervallumon
// Feladat: Keressük meg az [e..u] intervallum legnagyobb elemét
void MaximumIntervallum(int e, int u, out int maxind, out int maxert)
{
    // FONTOS: Feltételezzük, hogy e <= u (az intervallum nem üres)

    // Kezdőérték: az első elem (e)
    maxind = e;
    maxert = e;

    // Végigmegyünk e+1-től u-ig
    for (int i = e + 1; i <= u; i++)
    {
        // Ha i nagyobb a jelenlegi maximumnál
        if (i > maxert)
        {
            maxind = i;
            maxert = i;
        }
    }
}

// Példa 3: Maximum keresése függvény értékek alapján
// Feladat: Keressük meg, hogy az [e..u] intervallumon a négyzet függvény
//          hol veszi fel a legnagyobb értéket
void MaximumNegyzet(int e, int u, out int maxind, out int maxert)
{
    // Kezdőérték
    maxind = e;
    maxert = e * e;  // f(e) = e^2

    // Végigmegyünk az intervallumon
    for (int i = e + 1; i <= u; i++)
    {
        int ertek = i * i;  // f(i) = i^2

        // Összehasonlítjuk a függvényértékeket
        if (ertek > maxert)
        {
            maxind = i;
            maxert = ertek;
        }
    }
}

// Példa 4: Leghosszabb szó keresése
// Feladat: Keressük meg a leghosszabb szót egy tömbben
void LeghosszabbSzo(string[] szavak, out int maxind, out int maxert)
{
    // Kezdőérték: az első szó
    maxind = 0;
    maxert = szavak[0].Length;  // f(i) = szavak[i].Length

    // Végigmegyünk a többi szón
    for (int i = 1; i < szavak.Length; i++)
    {
        int hossz = szavak[i].Length;

        if (hossz > maxert)
        {
            maxind = i;
            maxert = hossz;
        }
    }
}

// Példa használat:
void PeldaHasznalat()
{
    int[] szamok = {5, 2, 9, 1, 7, 3};
    int ind, ert;

    MaximumKivalasztas(szamok, out ind, out ert);

    // Eredmény: ind = 2, ert = 9
    // (a 9-es a legnagyobb, és a 2-es indexen van)
}

```

### Időbeli és Memória Komplexitás

- **Időkomplexitás:** O(n), ahol n az intervallum hossza (egyszer végigmegyünk az elemeken)
- **Memóriakomplexitás:** O(1) - csak két változót tárolunk (maxind, maxert)

---

## 4. Minimumkiválasztás

### Leírás

A minimumkiválasztás sablon meghatározza egy függvény minimális értékét és annak helyét egy nem üres intervallumon. Ez a maximumkiválasztás "párja", csak a feltétel iránya fordított.

### Specifikáció

**Bemenet:**

- `e ∈ Z` - intervallum kezdete
- `u ∈ Z` - intervallum vége

**Kimenet:**

- `minind ∈ Z` - a minimum helye (index)
- `minert ∈ H` - a minimum értéke

**Előfeltétel:**

- `e <= u` (az intervallum nem üres!)

**Utófeltétel:**

- `minind ∈ [e..u]`
- `∀i ∈ [e..u]: f(minind) <= f(i)` (a minimum kisebb vagy egyenlő minden elemnél)
- `minert = f(minind)`

### NSD (Nassi-Shneiderman Diagram)

```
┌─────────────────────────────────────────────┐
│ minind := e                                 │
│ minert := f(e)                              │
├─────────────────────────────────────────────┤
│ ┌─ CIKLUS i := e+1 .. u ─────────────────┐  │
│ │                                        │  │
│ │  ┌─ HA f(i) < minert ─────────────────┐│  │
│ │  │                                    ││  │
│ │  │  minind := i                       ││  │
│ │  │  minert := f(i)                    ││  │
│ │  │                                    ││  │
│ │  └────────────────────────────────────┘│  │
│ │                                        │  │
│ └────────────────────────────────────────┘  │
└─────────────────────────────────────────────┘

```

### C# Implementáció

```csharp
// Példa 1: Minimum keresése egy tömbben
// Feladat: Keressük meg a tömb legkisebb elemét és annak indexét
void MinimumKivalasztas(int[] tomb, out int minind, out int minert)
{
    // FONTOS: Feltételezzük, hogy a tömb nem üres

    // Kezdőérték: az első elem
    minind = 0;
    minert = tomb[0];

    // Végigmegyünk a többi elemen
    for (int i = 1; i < tomb.Length; i++)
    {
        // Ha az aktuális elem KISEBB a jelenlegi minimumnál
        if (tomb[i] < minert)
        {
            // Akkor ez lesz az új minimum
            minind = i;
            minert = tomb[i];
        }
    }
}

// Példa 2: Legrövidebb szó keresése
// Feladat: Keressük meg a legrövidebb szót egy tömbben
void LegrvidebbSzo(string[] szavak, out int minind, out int minert)
{
    // Kezdőérték
    minind = 0;
    minert = szavak[0].Length;

    // Végigmegyünk a szavakon
    for (int i = 1; i < szavak.Length; i++)
    {
        int hossz = szavak[i].Length;

        // Ha rövidebb, mint a jelenlegi minimum
        if (hossz < minert)
        {
            minind = i;
            minert = hossz;
        }
    }
}

// Példa 3: Legközelebbi szám keresése egy célértékhez
// Feladat: Keressük meg, melyik szám van legközelebb egy adott célértékhez
void LegkozelibbiSzam(int[] tomb, int cel, out int minind, out int minert)
{
    // Kezdőérték
    minind = 0;
    minert = Math.Abs(tomb[0] - cel);  // távolság = |tomb[0] - cel|

    // Végigmegyünk a tömbön
    for (int i = 1; i < tomb.Length; i++)
    {
        int tavolsag = Math.Abs(tomb[i] - cel);

        // Ha közelebb van, mint az eddigi legközelebbi
        if (tavolsag < minert)
        {
            minind = i;
            minert = tavolsag;
        }
    }
}

// Példa használat:
void PeldaHasznalat()
{
    int[] szamok = {5, 2, 9, 1, 7, 3};
    int ind, ert;

    MinimumKivalasztas(szamok, out ind, out ert);

    // Eredmény: ind = 3, ert = 1
    // (az 1-es a legkisebb, és a 3-as indexen van)
}

```

### Időbeli és Memória Komplexitás

- **Időkomplexitás:** O(n)
- **Memóriakomplexitás:** O(1)

---

## 5. Feltételes Maximumkeresés

### Leírás

A feltételes maximumkeresés sablon meghatározza egy függvény maximális értékét azok között az elemek között, amelyek teljesítenek egy adott feltételt. Itt előfordulhat, hogy nincs megoldás (ha egyik elem sem teljesíti a feltételt).

### Specifikáció

**Bemenet:**

- `e ∈ Z` - intervallum kezdete
- `u ∈ Z` - intervallum vége

**Kimenet:**

- `van ∈ L` - logikai érték, igaz ha van feltételt teljesítő elem
- `maxind ∈ Z` - a feltételes maximum helye (ha van)
- `maxert ∈ H` - a feltételes maximum értéke (ha van)

**Előfeltétel:**

- Nincs

**Utófeltétel:**

- `van = ∃i ∈ [e..u]: T(i)` (van-e olyan elem, ami teljesíti T-t)
- Ha `van = igaz`, akkor:
    - `maxind ∈ [e..u]` és `T(maxind)` igaz
    - `maxert = f(maxind)`
    - `∀i ∈ [e..u]: T(i) -> maxert >= f(i)` (minden feltételt teljesítő elemnél nagyobb vagy egyenlő)

### NSD (Nassi-Shneiderman Diagram)

```
┌─────────────────────────────────────────────┐
│ van := HAMIS                                │
├─────────────────────────────────────────────┤
│ ┌─ CIKLUS i := e .. u ───────────────────┐  │
│ │                                        │  │
│ │  ┌─ HA T(i) ──────────────────────────┐│  │
│ │  │                                    ││  │
│ │  │  ┌─ HA NEM van ──────────────────┐ ││  │
│ │  │  │                               │ ││  │
│ │  │  │  van := IGAZ                  │ ││  │
│ │  │  │  maxind := i                  │ ││  │
│ │  │  │  maxert := f(i)               │ ││  │
│ │  │  │                               │ ││  │
│ │  │  ├─ KÜLÖNBEN ────────────────────┤ ││  │
│ │  │  │                               │ ││  │
│ │  │  │  ┌─ HA f(i) > maxert ────────┐│ ││  │
│ │  │  │  │                           ││ ││  │
│ │  │  │  │  maxind := i              ││ ││  │
│ │  │  │  │  maxert := f(i)           ││ ││  │
│ │  │  │  │                           ││ ││  │
│ │  │  │  └───────────────────────────┘│ ││  │
│ │  │  │                               │ ││  │
│ │  │  └───────────────────────────────┘ ││  │
│ │  │                                    ││  │
│ │  └────────────────────────────────────┘│  │
│ │                                        │  │
│ └────────────────────────────────────────┘  │
└─────────────────────────────────────────────┘

```

### C# Implementáció

```csharp
// Példa 1: Legnagyobb páros szám keresése
// Feladat: Keressük meg a legnagyobb páros számot egy tömbben
void LegnagyobbParos(int[] tomb, out bool van, out int maxind, out int maxert)
{
    // Kezdetben nincs még találat
    van = false;
    maxind = -1;      // érvénytelen index kezdetben
    maxert = 0;       // ez még nem releváns

    // Végigmegyünk a tömbön
    for (int i = 0; i < tomb.Length; i++)
    {
        // Feltétel: páros szám
        if (tomb[i] % 2 == 0)
        {
            // Ha ez az első páros szám amit találunk
            if (van == false)
            {
                // Beállítjuk a kezdő értékeket
                van = true;
                maxind = i;
                maxert = tomb[i];
            }
            else
            {
                // Ha már találtunk páros számot korábban,
                // akkor összehasonlítjuk
                if (tomb[i] > maxert)
                {
                    maxind = i;
                    maxert = tomb[i];
                }
            }
        }
    }

    // Ha van == false, akkor nincs páros szám a tömbben
    // Ha van == true, akkor maxind és maxert tartalmazza az eredményt
}

// Példa 2: Legnagyobb pozitív szám keresése
// Feladat: Keressük meg a legnagyobb pozitív számot
void LegnagyobbPozitiv(int[] tomb, out bool van, out int maxind, out int maxert)
{
    van = false;
    maxind = -1;
    maxert = 0;

    for (int i = 0; i < tomb.Length; i++)
    {
        // Feltétel: pozitív szám (nagyobb mint 0)
        if (tomb[i] > 0)
        {
            if (!van)  // ugyanaz mint: van == false
            {
                van = true;
                maxind = i;
                maxert = tomb[i];
            }
            else
            {
                if (tomb[i] > maxert)
                {
                    maxind = i;
                    maxert = tomb[i];
                }
            }
        }
    }
}

// Példa 3: Leghosszabb rövid szó keresése
// Feladat: Keressük meg a leghosszabb olyan szót, ami legfeljebb 5 karakter
void LeghosszabbRovidSzo(string[] szavak, out bool van, out int maxind, out int maxert)
{
    van = false;
    maxind = -1;
    maxert = 0;

    for (int i = 0; i < szavak.Length; i++)
    {
        int hossz = szavak[i].Length;

        // Feltétel: legfeljebb 5 karakter hosszú
        if (hossz <= 5)
        {
            if (!van)
            {
                van = true;
                maxind = i;
                maxert = hossz;
            }
            else
            {
                if (hossz > maxert)
                {
                    maxind = i;
                    maxert = hossz;
                }
            }
        }
    }
}

// Példa használat:
void PeldaHasznalat()
{
    int[] szamok = {1, 3, 8, 5, 2, 7};
    bool van;
    int ind, ert;
    
    LegnagyobbParos(szamok, out van, out ind, out ert);
    
    if (van)
    {
        // Van páros szám: ind = 2, ert = 8
        Console.WriteLine("A legnagyobb páros: " + ert);
    }
    else
    {
        Console.WriteLine("Nincs páros szám a tömbben");
    }
}
```

### Időbeli és Memória Komplexitás

- **Időkomplexitás:** O(n)
- **Memóriakomplexitás:** O(1)

---

## 6. Keresés

### Leírás

A keresés sablon meghatározza egy feltételt teljesítő első elemet egy intervallumon (balról jobbra haladva). Ha nincs ilyen elem, akkor jelzi, hogy nem sikerült a keresés.

### Specifikáció

**Bemenet:**

- `e ∈ Z` - intervallum kezdete
- `u ∈ Z` - intervallum vége

**Kimenet:**

- `van ∈ L` - logikai érték, igaz ha van feltételt teljesítő elem
- `ind ∈ Z` - a megtalált elem indexe (ha van)

**Előfeltétel:**

- Nincs

**Utófeltétel:**

- `van = ∃i ∈ [e..u]: T(i)` (van-e olyan elem, ami teljesíti T-t)
- Ha `van = igaz`, akkor:
    - `ind ∈ [e..u]` és `T(ind)` igaz
    - `∀i ∈ [e..ind-1]: nem T(i)` (minden korábbi elem NEM teljesíti a feltételt)

### NSD (Nassi-Shneiderman Diagram)

```
┌─────────────────────────────────────────────┐
│ i := e                                      │
├─────────────────────────────────────────────┤
│ ┌─ CIKLUS AMÍG i <= u ÉS NEM T(i) ───────┐  │
│ │                                        │  │
│ │  i := i + 1                            │  │
│ │                                        │  │
│ └────────────────────────────────────────┘  │
├─────────────────────────────────────────────┤
│ van := (i <= u)                             │
│ ind := i                                    │
└─────────────────────────────────────────────┘

```

### C# Implementáció

```csharp
// Példa 1: Páros szám keresése
// Feladat: Keressük meg az első páros számot a tömbben (balról)
void ParosSzamKeresese(int[] tomb, out bool van, out int ind)
{
    // Kezdünk a tömb elejétől
    int i = 0;

    // Addig megyünk, amíg van elem ÉS még nem találtuk meg a feltételt
    // A ciklus leáll, ha:
    // 1. Elértük a tömb végét (i >= tomb.Length)
    // 2. VAGY megtaláltuk az első páros számot
    while (i < tomb.Length && tomb[i] % 2 != 0)
    {
        i = i + 1;
    }

    // A ciklus után i mutat az első páros számra,
    // vagy a tömb végén túlra (ha nincs páros)

    // Ellenőrizzük, hogy találtunk-e
    van = (i < tomb.Length);
    ind = i;

    // Ha van == true, akkor ind az első páros szám indexe
    // Ha van == false, akkor nincs páros szám a tömbben
}

// Példa 2: Negatív szám keresése
// Feladat: Keressük meg az első negatív számot
void NegativSzamKeresese(int[] tomb, out bool van, out int ind)
{
    int i = 0;

    // Addig megyünk, amíg nem találunk negatív számot
    while (i < tomb.Length && tomb[i] >= 0)
    {
        i++;
    }

    van = (i < tomb.Length);
    ind = i;
}

// Példa 3: Adott értékű elem keresése
// Feladat: Keressük meg az első előfordulását egy adott értéknek
void ErtekKeresese(int[] tomb, int keresettErtek, out bool van, out int ind)
{
    int i = 0;

    // Addig megyünk, amíg nem találjuk meg a keresett értéket
    while (i < tomb.Length && tomb[i] != keresettErtek)
    {
        i++;
    }

    van = (i < tomb.Length);
    ind = i;
}

// Példa 4: Hosszú szó keresése
// Feladat: Keressük meg az első olyan szót, ami legalább 7 karakter
void HosszuSzoKeresese(string[] szavak, out bool van, out int ind)
{
    int i = 0;

    // Addig megyünk, amíg nem találunk 7+ karakteres szót
    while (i < szavak.Length && szavak[i].Length < 7)
    {
        i++;
    }

    van = (i < szavak.Length);
    ind = i;
}

// Példa 5: Prímszám keresése egy intervallumon
// Feladat: Keressük meg az első prímszámot az [e..u] intervallumban
void PrimSzamKeresese(int e, int u, out bool van, out int ind)
{
    int i = e;

    // Addig megyünk, amíg nem találunk prímszámot
    while (i <= u && !Prim(i))
    {
        i++;
    }

    van = (i <= u);
    ind = i;
}

// Segédfüggvény (az előzőekben definiáltuk)
bool Prim(int n)
{
    if (n <= 1) return false;
    if (n <= 3) return true;
    if (n % 2 == 0) return false;

    for (int i = 3; i * i <= n; i += 2)
    {
        if (n % i == 0) return false;
    }
    return true;
}

// Példa használat:
void PeldaHasznalat()
{
    int[] szamok = {1, 3, 5, 8, 9, 10};
    bool van;
    int ind;

    ParosSzamKeresese(szamok, out van, out ind);

    if (van)
    {
        // Találtunk: ind = 3, szamok[3] = 8
        Console.WriteLine("Első páros szám: " + szamok[ind]);
    }
    else
    {
        Console.WriteLine("Nincs páros szám");
    }
}

```

### Időbeli és Memória Komplexitás

- **Időkomplexitás:**
    - **Legjobb eset:** O(1) - ha az első elem teljesíti a feltételt
    - **Legrosszabb eset:** O(n) - ha nincs ilyen elem vagy az utolsó elem
    - **Átlagos eset:** O(n/2) ≈ O(n)
- **Memóriakomplexitás:** O(1)

---

## 7. Eldöntés

### Leírás

Az eldöntés sablon meghatározza, hogy van-e legalább egy olyan elem egy intervallumon, amely teljesít egy adott feltételt. Ez a keresés egyszerűsített változata, ahol csak azt kell tudnunk, hogy VAN-e ilyen elem, de nem kell megmondani, hogy MELYIK.

### Specifikáció

**Bemenet:**

- `e ∈ Z` - intervallum kezdete
- `u ∈ Z` - intervallum vége

**Kimenet:**

- `van ∈ L` - logikai érték (igaz/hamis)

**Előfeltétel:**

- Nincs

**Utófeltétel:**

- `van = ∃i ∈ [e..u]: T(i)` (létezik-e olyan elem, ami teljesíti T-t)

### NSD (Nassi-Shneiderman Diagram)

```
┌─────────────────────────────────────────────┐
│ i := e                                      │
├─────────────────────────────────────────────┤
│ ┌─ CIKLUS AMÍG i <= u ÉS NEM T(i) ───────┐  │
│ │                                        │  │
│ │  i := i + 1                            │  │
│ │                                        │  │
│ └────────────────────────────────────────┘  │
├─────────────────────────────────────────────┤
│ van := (i <= u)                             │
└─────────────────────────────────────────────┘

```

### C# Implementáció

```csharp
// Példa 1: Van-e páros szám a tömbben?
// Feladat: Döntse el, van-e páros szám a tömbben
bool VanParosSzam(int[] tomb)
{
    int i = 0;

    // Keressük az első páros számot
    // Ha van, megállunk
    while (i < tomb.Length && tomb[i] % 2 != 0)
    {
        i++;
    }

    // Ha i < tomb.Length, akkor találtunk páros számot
    // Ha i >= tomb.Length, akkor nincs páros szám
    return (i < tomb.Length);
}

// Példa 2: Van-e negatív szám?
// Feladat: Döntse el, van-e negatív szám a tömbben
bool VanNegativSzam(int[] tomb)
{
    int i = 0;

    // Keressük az első negatív számot
    while (i < tomb.Length && tomb[i] >= 0)
    {
        i++;
    }

    return (i < tomb.Length);
}

// Példa 3: Van-e adott értékű elem?
// Feladat: Döntse el, van-e a tömbben egy adott érték
bool VanErtek(int[] tomb, int keresettErtek)
{
    int i = 0;

    // Keressük a keresett értéket
    while (i < tomb.Length && tomb[i] != keresettErtek)
    {
        i++;
    }

    return (i < tomb.Length);
}

// Példa 4: Van-e nagy szám? (nagyobb mint 100)
// Feladat: Döntse el, van-e 100-nál nagyobb szám
bool VanNagySzam(int[] tomb)
{
    int i = 0;

    while (i < tomb.Length && tomb[i] <= 100)
    {
        i++;
    }

    return (i < tomb.Length);
}

// Példa 5: Alternatív implementáció FOR ciklussal
// Ez egyszerűbb, de végigmegy az egész tömbön még akkor is,
// ha már találtunk elemet
bool VanParosSzamFor(int[] tomb)
{
    // Végigmegyünk minden elemen
    for (int i = 0; i < tomb.Length; i++)
    {
        // Ha találunk páros számot, azonnal visszatérünk
        if (tomb[i] % 2 == 0)
        {
            return true;
        }
    }

    // Ha ide értünk, nem találtunk páros számot
    return false;
}

// Példa 6: Van-e rendezett szomszédos pár?
// Feladat: Döntse el, van-e két olyan szomszédos elem,
//          ahol az első kisebb mint a második
bool VanRendezettPar(int[] tomb)
{
    // FONTOS: tomb.Length - 1, mert párokat nézünk
    int i = 0;

    while (i < tomb.Length - 1 && tomb[i] >= tomb[i + 1])
    {
        i++;
    }

    return (i < tomb.Length - 1);
}

// Példa használat:
void PeldaHasznalat()
{
    int[] szamok1 = {1, 3, 5, 7, 9};     // Csak páratlanok
    int[] szamok2 = {1, 3, 8, 5, 7};     // Van páros (8)

    bool van1 = VanParosSzam(szamok1);   // false
    bool van2 = VanParosSzam(szamok2);   // true

    if (van2)
    {
        Console.WriteLine("Van páros szám a második tömbben");
    }
}

```

### Időbeli és Memória Komplexitás

- **Időkomplexitás:**
    - **Legjobb eset:** O(1) - ha az első elem teljesíti a feltételt
    - **Legrosszabb eset:** O(n) - ha nincs ilyen elem
- **Memóriakomplexitás:** O(1)

---

## 8. Mind Eldöntés (Optimista Eldöntés)

### Leírás

A mind eldöntés sablon meghatározza, hogy egy intervallumon MINDEN elem teljesít-e egy adott feltételt. Ez az "optimista" változat, mert addig feltételezzük, hogy minden elem jó, amíg ellenpéldát nem találunk.

### Specifikáció

**Bemenet:**

- `e ∈ Z` - intervallum kezdete
- `u ∈ Z` - intervallum vége

**Kimenet:**

- `mind ∈ L` - logikai érték (igaz ha minden elem teljesíti a feltételt)

**Előfeltétel:**

- Nincs

**Utófeltétel:**

- `mind = ∀i ∈ [e..u]: T(i)` (minden elem teljesíti-e T-t)

### NSD (Nassi-Shneiderman Diagram)

```
┌─────────────────────────────────────────────┐
│ i := e                                      │
├─────────────────────────────────────────────┤
│ ┌─ CIKLUS AMÍG i <= u ÉS T(i) ───────────┐  │
│ │                                        │  │
│ │  i := i + 1                            │  │
│ │                                        │  │
│ └────────────────────────────────────────┘  │
├─────────────────────────────────────────────┤
│ mind := (i > u)                             │
└─────────────────────────────────────────────┘

```

### C# Implementáció

```csharp
// Példa 1: Minden szám páros?
// Feladat: Döntse el, hogy minden szám páros-e a tömbben
bool MindenParos(int[] tomb)
{
    int i = 0;

    // Addig megyünk, amíg páros számokat találunk
    // Megállunk, ha páratlan számot találunk VAGY elértük a végét
    while (i < tomb.Length && tomb[i] % 2 == 0)
    {
        i++;
    }

    // Ha i >= tomb.Length, akkor végigmentünk = minden elem páros
    // Ha i < tomb.Length, akkor találtunk páratlan számot = nem minden páros
    return (i >= tomb.Length);
}

// Példa 2: Minden szám pozitív?
// Feladat: Döntse el, hogy minden szám pozitív-e
bool MindenPozitiv(int[] tomb)
{
    int i = 0;

    // Addig megyünk, amíg pozitív számokat találunk
    while (i < tomb.Length && tomb[i] > 0)
    {
        i++;
    }

    return (i >= tomb.Length);
}

// Példa 3: Minden szám nagyobb mint egy határ?
// Feladat: Döntse el, hogy minden szám nagyobb-e egy adott értéknél
bool MindenNagyobbMint(int[] tomb, int hatar)
{
    int i = 0;

    // Addig megyünk, amíg a határnál nagyobb számokat találunk
    while (i < tomb.Length && tomb[i] > hatar)
    {
        i++;
    }

    return (i >= tomb.Length);
}

// Példa 4: Minden szó hosszú? (legalább 5 karakter)
// Feladat: Döntse el, hogy minden szó legalább 5 karakter hosszú-e
bool MindenSzoHosszu(string[] szavak)
{
    int i = 0;

    // Addig megyünk, amíg hosszú szavakat találunk
    while (i < szavak.Length && szavak[i].Length >= 5)
    {
        i++;
    }

    return (i >= szavak.Length);
}

// Példa 5: Rendezett-e a tömb? (növekvő sorrendben)
// Feladat: Döntse el, hogy a tömb rendezett-e
bool Rendezett(int[] tomb)
{
    // Üres vagy egyelemű tömb mindig rendezett
    if (tomb.Length <= 1)
    {
        return true;
    }

    int i = 0;

    // Addig megyünk, amíg minden szomszédos pár rendezett
    // tomb[i] <= tomb[i+1] kell hogy legyen
    while (i < tomb.Length - 1 && tomb[i] <= tomb[i + 1])
    {
        i++;
    }

    return (i >= tomb.Length - 1);
}

// Példa 6: Alternatív implementáció FOR ciklussal
bool MindenParosFor(int[] tomb)
{
    // Végigmegyünk minden elemen
    for (int i = 0; i < tomb.Length; i++)
    {
        // Ha találunk páratlan számot, azonnal visszatérünk
        if (tomb[i] % 2 != 0)
        {
            return false;  // NEM minden páros
        }
    }

    // Ha ide értünk, minden szám páros volt
    return true;
}

// Példa 7: Minden prím?
// Feladat: Döntse el, hogy minden szám prím-e
bool MindenPrim(int[] tomb)
{
    int i = 0;

    while (i < tomb.Length && Prim(tomb[i]))
    {
        i++;
    }

    return (i >= tomb.Length);
}

// Példa használat:
void PeldaHasznalat()
{
    int[] parosak = {2, 4, 6, 8};        // Minden páros
    int[] vegyes = {2, 3, 6, 8};         // Van páratlan (3)

    bool mind1 = MindenParos(parosak);   // true
    bool mind2 = MindenParos(vegyes);    // false

    if (mind1)
    {
        Console.WriteLine("Az első tömbben minden szám páros");
    }

    if (!mind2)
    {
        Console.WriteLine("A második tömbben nem minden szám páros");
    }
}

```

### Kapcsolat az Eldöntéssel

**Fontos matematikai összefüggés:**

- `MIND(i=e..u, T(i))` = `NEM VAN(i=e..u, NEM T(i))`
- Magyarul: "Minden elem teljesíti T-t" = "Nincs olyan elem, ami NEM teljesíti T-t"

```csharp
// Példa: Mind eldöntés megvalósítása Van eldöntéssel
bool MindenParosVannal(int[] tomb)
{
    // Keressük meg, hogy van-e páratlan szám
    bool vanParatlan = VanParatlanSzam(tomb);

    // Ha nincs páratlan, akkor minden páros
    return !vanParatlan;
}

bool VanParatlanSzam(int[] tomb)
{
    int i = 0;
    while (i < tomb.Length && tomb[i] % 2 == 0)
    {
        i++;
    }
    return (i < tomb.Length);
}

```

### Időbeli és Memória Komplexitás

- **Időkomplexitás:**
    - **Legjobb eset:** O(1) - ha az első elem nem teljesíti a feltételt
    - **Legrosszabb eset:** O(n) - ha minden elem teljesíti a feltételt
- **Memóriakomplexitás:** O(1)

---

## 9. Kiválasztás

### Leírás

A kiválasztás sablon meghatározza egy feltételt teljesítő első elemet, amikor TUDJUK, hogy biztosan létezik ilyen elem. Ez a keresés egyszerűsített változata - nincs szükség a "van" változóra, mert garantáltan találunk elemet.

### Specifikáció

**Bemenet:**

- `e ∈ Z` - keresés kezdőpontja

**Kimenet:**

- `ind ∈ Z` - a megtalált elem indexe

**Előfeltétel:**

- `∃i ∈ [e..∞]: T(i)` - LÉTEZIK olyan elem, ami teljesíti a feltételt

**Utófeltétel:**

- `ind >= e` és `T(ind)` igaz
- `∀i ∈ [e..ind-1]: nem T(i)` (minden korábbi elem NEM teljesíti a feltételt)

### NSD (Nassi-Shneiderman Diagram)

```
┌─────────────────────────────────────────────┐
│ ind := e                                    │
├─────────────────────────────────────────────┤
│ ┌─ CIKLUS AMÍG NEM T(ind) ───────────────┐  │
│ │                                        │  │
│ │  ind := ind + 1                        │  │
│ │                                        │  │
│ └────────────────────────────────────────┘  │
└─────────────────────────────────────────────┘

```

### C# Implementáció

```csharp
// Példa 1: Első páros szám kiválasztása
// Feladat: Keressük meg az első páros számot (biztosan van ilyen!)
// FONTOS: Csak akkor használjuk, ha BIZTOSAN van páros szám!
int ElsoParosSzam(int[] tomb)
{
    int ind = 0;

    // Addig lépünk, amíg NEM találunk páros számot
    // A ciklus BIZTOSAN megáll, mert van páros szám
    while (tomb[ind] % 2 != 0)
    {
        ind++;
    }

    // Itt ind az első páros szám indexe
    return ind;
}

// Példa 2: Első pozitív szám kiválasztása
// Feladat: Keressük meg az első pozitív számot (biztosan van!)
int ElsoPozitivSzam(int[] tomb)
{
    int ind = 0;

    while (tomb[ind] <= 0)
    {
        ind++;
    }

    return ind;
}

// Példa 3: Első nagy szám kiválasztása (> 100)
// Feladat: Keressük meg az első 100-nál nagyobb számot
int ElsoNagySzam(int[] tomb)
{
    int ind = 0;

    while (tomb[ind] <= 100)
    {
        ind++;
    }

    return ind;
}

// Példa 4: Első 'a' betűvel kezdődő szó
// Feladat: Keressük meg az első 'a' vagy 'A' betűvel kezdődő szót
int ElsoASzó(string[] szavak)
{
    int ind = 0;

    while (szavak[ind][0] != 'a' && szavak[ind][0] != 'A')
    {
        ind++;
    }

    return ind;
}

// Példa 5: Első prímszám kiválasztása egy számtól kezdve
// Feladat: Keressük meg az első prímszámot n-től kezdve
int KovetkezoPrim(int n)
{
    int ind = n;

    // Addig lépünk, amíg nem találunk prímszámot
    while (!Prim(ind))
    {
        ind++;
    }

    return ind;
}

// Példa 6: Első nem nulla elem kiválasztása
// Feladat: Keressük meg az első nem nulla elemet
int ElsoNemNulla(int[] tomb)
{
    int ind = 0;

    while (tomb[ind] == 0)
    {
        ind++;
    }

    return ind;
}

// Példa 7: Első rendezett pár kiválasztása
// Feladat: Keressük meg az első olyan helyet,
//          ahol tomb[i] < tomb[i+1]
int ElsoRendezettPar(int[] tomb)
{
    int ind = 0;

    while (tomb[ind] >= tomb[ind + 1])
    {
        ind++;
    }

    return ind;
}

// Példa használat:
void PeldaHasznalat()
{
    // FONTOS: Csak akkor hívjuk meg, ha TUDJUK hogy van páros szám!
    int[] szamok = {1, 3, 5, 8, 9, 10};  // Van páros: 8, 10

    int ind = ElsoParosSzam(szamok);

    // Eredmény: ind = 3, szamok[3] = 8
    Console.WriteLine("Az első páros szám indexe: " + ind);
    Console.WriteLine("Az első páros szám értéke: " + szamok[ind]);
}

// VESZÉLYES használat - elkerülendő!
void VeszelyesPelda()
{
    int[] szamok = {1, 3, 5, 7, 9};  // NINCS páros szám!

    // Ez IndexOutOfRangeException hibát fog dobni!
    // A ciklus soha nem áll meg, és kilép a tömb határain!
    // int ind = ElsoParosSzam(szamok);  // HIBA!

    // Helyette használjuk a Keresés mintát:
    bool van;
    int ind2;
    ParosSzamKeresese(szamok, out van, out ind2);

    if (van)
    {
        Console.WriteLine("Találtunk: " + szamok[ind2]);
    }
    else
    {
        Console.WriteLine("Nincs páros szám");
    }
}

```

### Mikor használjuk?

**Kiválasztás vs. Keresés:**

| Kiválasztás | Keresés |
| --- | --- |
| TUDJUK hogy van megoldás | NEM tudjuk biztosan |
| Nincs "van" változó | Van "van" változó |
| Egyszerűbb kód | Biztonságosabb kód |
| Gyorsabb | Ellenőrzi a létezést |

```csharp
// Példa: Mikor biztos, hogy van megoldás?

// 1. Matematikai tulajdonság miatt
int KovetkezoPrim(int n)
{
    // Bertrand-posztulátum: n és 2n között mindig van prímszám
    // Ha n >= 2, akkor 2n-ig biztosan találunk prímet
    int ind = n;
    while (!Prim(ind))
    {
        ind++;
    }
    return ind;
}

// 2. Előzetes ellenőrzés után
void BiztonsagosKivalasztas(int[] tomb)
{
    // Először ellenőrizzük
    if (VanParosSzam(tomb))
    {
        // Most már TUDJUK hogy van, használhatjuk a kiválasztást
        int ind = ElsoParosSzam(tomb);
        Console.WriteLine("Első páros: " + tomb[ind]);
    }
    else
    {
        Console.WriteLine("Nincs páros szám");
    }
}

```

### Időbeli és Memória Komplexitás

- **Időkomplexitás:** O(k), ahol k a megtalált elem indexe
- **Memóriakomplexitás:** O(1)

---
