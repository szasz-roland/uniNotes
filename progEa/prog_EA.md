Email: pluharzs@inf.elte.hu
minden gyakorlat elején "röpdog" -> min 50%
3 beadandó lesz -> könnyű -> mid -> összetett
    2 fázisban kell majd beadni őket
    tercezésorientált a képzés -> dokumentációt is kell majd badni
ZH:
    11 héten
    tervezés zh:
        nem használhatsz semmit
    kód zh:
        sepcific, algoritmus alapján kell kódolni 

canvas.elte.hu

C#



Programozás folyamata:
    1: Specifikálás (Miből?, mit?)
    2. tervezés (Mivel?,hogyan?)
    3. kódolás (a gép hogyan?)
    4. Tesztelés (hibás-e?)
    5. Hibakeresés (hol a hiba?)
    6. Hiibajavítás (hogyan jó?)
    7. Minőségvizsgálat, hatékonyság (jobbíthaE?)
    8. Dokumentálás (hogyan működik?)
    9. Használat, karbantartás (még mindíg jó?)
Specifikáció:
    Bementet->Kimenet->előfeltétel->utófelvétel
    Be: sER, tER
    Ki: vER
    Ef: 0s>=0 és t > 0
    ??

    Összetevői:
        1. Bemenő ada
        2. Ismeretek a bementerő
        3. eredmények
        4. eredmények
        4. utófeltétel
        5. Használt fogalmak defincíciói
        6. Megoldással szembeni követelmények
        7. korlátozó tényezők
    Tulajd:
        tömör
        egyértelmű
        érthető
        szemléletes
    Eszközök
        1. szöveges
        2. matematikai lejrás
Az algoritmugy
"hogyan oldom meg a feladatot?"
    "probléma elemi lépésben történő egyértelmű és teljes megadása"
    elemi tevékenysége:
        értékadás, beolvasás, kíríás
    algoritmusok összeálítása módjai:
        1. szekvencia
        2. elágazás
        3. Ciklus
        4. Alprogram
    "nem táncosok vagunk nem breakelünk" :D
    
    pszeudokód -> leírónyelv

    flowcahrt -> folyamatábra

    !!Struktogram (ezt fogjuk használni)

    # Elöltesztelős és hátultesztelős ciklusok!!

    
    https://progalap.elte.hu/stuki -> sruktogramkészítő

    Specifikáció készítő:
    https://progalap.elte.hu/specifilacio

    Specufujáció megvalüsítás
        A feladat specifikációja a valós vikégbeli objektumokhoz rendel valamilyen valós világbeni eredményt.
        Lehetnek olyan váltpzók amelyek a specifikációban nem jelennek meg
    
    := -> értékadás
KÓD:
    Deklaráció
    BEolvasás
    feldolgozás
    Kiírás
    
    a Console.ReadLine() -> Stringként olvas be nem kell konvertálni
    
C# -> documentaion


Példa:

Be: Brutto -> Természetes(N), AFA -> Valós(R)  
Ki: Netto -> Valós(R)
Ef: 0 > AFA > 1  afa Eleme [0..1]
Uf: Netto =Brutto / ( 1 + AFA / 100)


Netto: 100
AFA: 27
Brutto: 127

Structrogram:
Be: br, afa [ ef leírása ]
Netto := Brutto / ( 1 + AFA / 100)
Ki, ne


Adatokkal kapcsolatos fogalmak: (49 dia)
    1. Konstans
    2. Változó
    
    3. Érdtékadás (:=)
    4. Típus(absztrakt )
        - struktúrálatlan (skalár, elemi)
        - struktőrált (összetett)

    5. Azonosító
    6. Kezdőérték

    slidee 54 -> elemi típusok
Fejlesztői környezet beállítása:
    1. visualstudio 2022
    2. azure (free az infes emaillel):w
    [using system // kell a bírónak]
    slide 69 kérdések listája


## Tömb = Sorozat(órán)
### 
- Sok azonos típuső adatot tárol
- Indexelt helyoértékek
- jelölés: name {eleme} [1..3] 
- lekérdezés indexel: name[0] -> első tag -> algoritmus(struktogram) készítésnél az indexelés 1 től indul
### Specifikációban
- tömb[1..5:szöveg]
### c\# -ban
- statikus - ismert méret
    - string[]
    - char[]
- statikus max.méret
    - int n;
    - const int MAXN = 100;
- statikus - igény szerinti méret (user input)
    - int n;
    - int.TryParse(Console.ReadLine(), out n);
    - string[] vendegek = new string[n];
### Algoritmusból kódba -> index eltoódás:
- 3 mód elfogadott (dia 30-32$)
### Konstans tömb
- pl.: színek sínek eleme [1..2] = ["piros", "zöld"] (dia 34)
## Mátrixok
- 2 dimenziós tömb eg. matrix[x,y]


## Analóg Programozás
- programok újrafelhasználása -
    - sok hasonló feladatok kell megoldani akkor csinálunk séga functionokat
- **DEF: a konkrét feladatot egy korábbi feladat megoldása alapján állítjuk elő**
- **Dia 17: mtárixból vektorok skaláris szorzata**


# Okt 1

## Feltételes maximum
- Uf: (van,maxind,maxért)=FELTMAX(i=e..u,f(i),T(i))

