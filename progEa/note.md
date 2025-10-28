2025. october 8


# 05-Gyakori programozási minta változatok
## Visszavezetési tábla
maxind,maxért ~ minind,-minért
f(i)          ~ -f(i)

e..u ellentetje -u..-e

## Legmelegebb vasárap feladat
    - IUgazábol egy for ciklus ami 7 esével lépked csak while -al (tesztelős)

# 06-mintamegoldás

## Gyoesabb vonat az előzőnél
```yaml
Be: n eleme N, menet eleme N[1..n] 
Ki: index eleme Z
Ef: 1<=n<=100 és minden i eleme [1...n]: (1<=menet[i]<=1000)
Uf: (van, index)=Keres(2..n, menet[i] > menet[i-1]) és ((nem van) -> int=-1)
```
(van, index)=Keres(e..u, T(i))

### Visszavezetési Tábla
van     ~   van
ind     ~   index
e..u    ~   2..n
T(i)    ~   menet[i] > menet[i-1]

### Tesztesetek
n: 3
menet: [1,2,3]
index: 2
van: true
---
n: 3
menet: [3,2,1]
index: 0 // ilyenkor elhanyagolható
van: false
---
n: 1
menet: [2]
index: -1
van: false

## _Beolvasás és feldolgozás külön van_ 
Struct helyett többD tömb magasságos feladat

# 2025 october 15

# 09-es dia
## Dinamikus tömb, mátrix (általában sepciben és stukiban maradhatunk a statikus tömböknél)
- Algoritmus syntax: y:Tömb[1.. :Egész]
- Kód syntax: List<int> y = new List<int>(); // List<string>, List<double>
    - y.Add(1);
    - Console.WriteLine(y[0]);      //1 -> item on said index
    - Console.WriteLine(y.Count);   // 2 -> length
- Speci: sorozat
- Stuki: tömb
- kód: dinakikus tömb
- _why is int.Tryparse usedi instead of parse? bc of error handling?_
## Mátrixok
- NEM TÖMB A TÖMBBEN
- spepcifikacio: x eleme Z[1..n,1..m]
- algoritmus: x:Tömb[1..n,1..m:Egész]
- kód: int[,] x = new int[n,m] // a vessző fontos
- <dia 24-25-26> trükköket :D

# 08-as dia
## Függvények
- Specifikáció: 
    - Be: x eleme R
    - Ki y elem R
    - Fv: negyzet:R->R, negyzet(n)=n*n // bemeneti értéket formális paraméternek hívjuk || több bemenetnét-> ZxZ "x el választom el
    - Uf: y=negyezet(x) 
- kód:
    - MAINEN KÍVÜL -> statik
```cs
static double negyzet(double n) {
    return n * n;
}
```
    - _szép programohoz hozzátesz ha csak 1 return van_
    - Lehet használni LAMBDA függvényt is -> return a >= b ? a : b
    - növelésnél speicben: n' <- aposztróf??
    - speci:
        - Fv: möverl: Z x Z -> Z, növel( _Vált_ szám,mivel)=szám+mivel
        - Uf: n' = növel(n,d)
    - kódban:
        - static void novel( _ref_ int szam, int mivel ) ...
    
    - Váltózók értékeinek megcserélése -> ki a1=b és b' = a
    - _Csere függvény dia 25_
    - _ha ott van a valt | ref szó akkor változót IS? vagy CSAK változót fogad be_
    - void típus --> nincs visszatérési érték --> no return
    - Kódban használjuk a _Deklarálás | Beolvasás | Feldolgozás | Kiírás_ -> csinálhatunk belőlük függvényeket is :D
    - ref -> ha már volt előtte értéke
    - out -> ha még nem volt előtte értéke és MUSZÁLY változzon
    - _FOGALMA: DIA 37 - 40_
    - C# hogyan kezeli  alistás > SKALÁR?

# ??-as dia
## Visszavezetési esetek


_ZH időpontok: Canvas kezdőlap követelmények_ : _https://canvas.elte.hu/courses/56239/assignments/436869_


# 10-es dia
## Több minta feladat
- minden UF-re ami egy minta - programotási tétel - formályát követi, kell visszavezetési táblátat tehát ha 2 UF-em van akkor 2 visszavezetési táblázat kell -> Programtranszformáció??
- amely függvénynek nincs kimenete csalk értéket számol azok Porcedőrák
## Több programozási minta együttes használata -> egymásbaágazással

- _extra tételek_ mind eldöntés, 

- Általában a függvényes megoldások az elvártak
    - alap feladatokat is like beolvas(), kiszámolorshit(), kiir()
- matrix length:
    ```cs
    int[,] = jegyezK;
    jegyek.GetLength(0); 
    ```
- 71-es dia. osszeg(i) helyett o nem? vt-ben,
- 71-es dia mi lenne ha az összeg fv-nek f() lennea neve akkor a vt-ben irhatom f(i) -- f(i) mert ha ugyanaz akkor nem írjuk bene akkor ezt ki lehet játszani nem?
-
-




