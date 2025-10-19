# C# változótípusok
| **C# típus** | **Mit tárol**                  | **Méret**             | **Tartomány**                  | **Matematikai jelölés** | **Megjegyzés**                             |
| ------------ | ------------------------------ | --------------------- | ------------------------------ | ----------------------- | ------------------------------------------ |
| `byte`       | Egész szám (pozitív)           | 8 bit                 | 0 … 255                        | ℕ (nemnegatív egészek)  | Kis egész, gyakran bináris adatokhoz       |
| `sbyte`      | Egész szám (poz. + neg.)       | 8 bit                 | -128 … 127                     | ℤ                       | Ritkán használatos                         |
| `short`      | Kis egész szám                 | 16 bit                | -32,768 … 32,767               | ℤ                       | Ha kevés memória elég                      |
| `ushort`     | Kis pozitív egész szám         | 16 bit                | 0 … 65,535                     | ℕ                       | Ritkán használt                            |
| `int`        | **Alapértelmezett egész szám** | 32 bit                | -2,147,483,648 … 2,147,483,647 | ℤ                       | A leggyakrabban használt egész típus       |
| `uint`       | Pozitív egész szám             | 32 bit                | 0 … 4,294,967,295              | ℕ                       | Csak nemnegatív számokhoz                  |
| `long`       | Nagy egész szám                | 64 bit                | -9e18 … 9e18                   | ℤ                       | Ha az `int` túl kicsi                      |
| `ulong`      | Nagy pozitív egész szám        | 64 bit                | 0 … 1.8e19                     | ℕ                       | Nagy tárolási címekhez                     |
| `float`      | Lebegőpontos valós szám        | 32 bit                | \~±1.5e−45 … ±3.4e38           | ℝ (kb. 7 jegy)          | Grafika, játék, memóriaérzékeny számítás   |
| `double`     | **Alapértelmezett valós szám** | 64 bit                | \~±5e−324 … ±1.7e308           | ℝ (kb. 15–16 jegy)      | Fizika, matematika, mérés, általános       |
| `decimal`    | Nagy pontosságú valós szám     | 128 bit               | \~±1e−28 … ±7.9e28             | ℝ (28–29 jegy)          | Pénz, pénzügy, kerekítési hibák elkerülése |
| `char`       | Egy karakter (Unicode)         | 16 bit                | `'\u0000' … '\uffff'`          | –                       | Pl. `'a'`, `'9'`, `'#'`                    |
| `string`     | Szöveg (karakterlánc)          | változó               | –                              | –                       | Pl. `"Hello"`; több `char` együtt          |
| `bool`       | Logikai érték                  | 1 bit (techn. 1 byte) | `true` vagy `false`            | {0,1} vagy {igaz,hamis} | Feltételekhez                              |


# Stuki logikai műveletek

| **Struktogram jel** | **Jelentés**         | **C# megfelelő** |
| ------------------- | -------------------- | ---------------- |
| `:=`                | értékadás            | `=`              |
| `=`                 | logikai egyenlőség   | `==`             |
| `≠`                 | nem egyenlő          | `!=`             |
| `<`                 | kisebb mint          | `<`              |
| `≤`                 | kisebb vagy egyenlő  | `<=`             |
| `>`                 | nagyobb mint         | `>`              |
| `≥`                 | nagyobb vagy egyenlő | `>=`             |
| `∧`                 | logikai ÉS           | `&&`             |
| `∨`                 | logikai VAGY         | `\|\|`           |
| `¬`                 | logikai NEM          | `!`              |



# Struktogram
┌──────────────────────────────────────────────────────────────────────────┐
│ Gyorsul(m, f, s : Egész, vk : Valós) : (Valós, Valós)                    │
├──────────────────────────────────────────────────────────────────────────┤
│ t := (-vk * m + sqrt(vk * vk * m * m + 2 * f * m * s)) / f               │
├──────────────────────────────────────────────────────────────────────────┤
│ vt := f * t / m + vk                                                     │
├──────────────────────────────────────────────────────────────────────────┤
│ Gyorsul := (t, vt)                                                       │
└──────────────────────────────────────────────────────────────────────────┘

