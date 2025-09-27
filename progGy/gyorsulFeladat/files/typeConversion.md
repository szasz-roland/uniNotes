# 🇭🇺 C# Adattípus Konverziós Referencia Táblázat

## 🔄 STRING-ből EGYÉB TÍPUSOKBA Konvertálás

```
┌─────────────────┬──────────────────────────┬──────────────────────────┬────────────────────────────────────┐
│ Cél Típus       │ 1. módszer: Convert.To   │ 2. módszer: Type.Parse   │ 3. módszer: TryParse (BIZTONSÁGOS) │
├─────────────────┼──────────────────────────┼──────────────────────────┼────────────────────────────────────┤
│ int             │ Convert.ToInt32(str)     │ int.Parse(str)           │ int.TryParse(str, out int result)  │
│ double          │ Convert.ToDouble(str)    │ double.Parse(str)        │ double.TryParse(str, out double r) │
│ float           │ Convert.ToSingle(str)    │ float.Parse(str)         │ float.TryParse(str, out float r)   │
│ decimal         │ Convert.ToDecimal(str)   │ decimal.Parse(str)       │ decimal.TryParse(str, out dec r)   │
│ long            │ Convert.ToInt64(str)     │ long.Parse(str)          │ long.TryParse(str, out long r)     │
│ short           │ Convert.ToInt16(str)     │ short.Parse(str)         │ short.TryParse(str, out short r)   │
│ byte            │ Convert.ToByte(str)      │ byte.Parse(str)          │ byte.TryParse(str, out byte r)     │
│ bool            │ Convert.ToBoolean(str)   │ bool.Parse(str)          │ bool.TryParse(str, out bool r)     │
│ char            │ Convert.ToChar(str)      │ char.Parse(str)          │ char.TryParse(str, out char r)     │
│ DateTime        │ Convert.ToDateTime(str)  │ DateTime.Parse(str)      │ DateTime.TryParse(str, out date r) │
└─────────────────┴──────────────────────────┴──────────────────────────┴────────────────────────────────────┘
```

## 🔄 EGYÉB TÍPUSOKBÓL STRING-BE Konvertálás

```
┌─────────────────┬─────────────────────────┬─────────────────────────────────────────────────────────┐
│ Forrás Típus    │ Módszer                 │ Példa                                                   │
├─────────────────┼─────────────────────────┼─────────────────────────────────────────────────────────┤
│ int             │ .ToString()             │ int szam = 123; string szoveg = szam.ToString();        │
│ double          │ .ToString("F2")         │ double szam = 123.45; string sz = szam.ToString("F2");  │
│ bool            │ .ToString()             │ bool flag = true; string szoveg = flag.ToString();      │
│ DateTime        │ .ToString("yyyy-MM-dd") │ DateTime most = DateTime.Now; string sz = most.ToString │
│ Bármilyen típus │ Convert.ToString()      │ string szoveg = Convert.ToString(barmilyenValtozo);     │
└─────────────────┴─────────────────────────┴─────────────────────────────────────────────────────────┘
```

## ⚖️ Összehasonlítás: Convert vs Parse vs TryParse

```
╔══════════════════╤═══════════════════════════════════╤═══════════════════════════════════╤═══════════════════════════╗
║ Módszer          │ Előnyök ✅                        │ Hátrányok ❌                      │ Mikor használjuk          ║
╠══════════════════╪═══════════════════════════════════╪═══════════════════════════════════╪═══════════════════════════╣
║ Convert.To...()  │ • null-t jól kezeli               │ • Kicsit lassabb                  │ Általános célú konverzió  ║
║                  │ • Különböző input típusokkal      │ • Hibás inputnál kivételt dob     │                           ║
╠══════════════════╪═══════════════════════════════════╪═══════════════════════════════════╪═══════════════════════════╣
║ Type.Parse()     │ • Gyors                           │ • Hibás inputnál kivételt dob     │ Biztos input esetén       ║
║                  │ • Közvetlen konverzió             │ • null-t nem kezeli jól           │                           ║
╠══════════════════╪═══════════════════════════════════╪═══════════════════════════════════╪═══════════════════════════╣
║ Type.TryParse()  │ • LEGBIZTONSÁGOSABB               │ • Kicsit több kód kell            │ AJÁNLOTT felhasználói     ║
║                  │ • Nem dob kivételt                │                                   │ input esetén              ║
║                  │ • true/false sikert jelez         │                                   │                           ║
║                  │ • Gyors                           │                                   │                           ║
╚══════════════════╧═══════════════════════════════════╧═══════════════════════════════════╧═══════════════════════════╝
```

## 🎯 Gyakori Console.ReadLine() Minták

```csharp
// ✅ ALAPVETŐ - Gyors és egyszerű (rossz inputnál összeomlhat)
double szam = Convert.ToDouble(Console.ReadLine());

// ✅ BIZTONSÁGOS - Ajánlott éles kódhoz
Console.Write("Adj meg egy számot: ");
if (double.TryParse(Console.ReadLine(), out double szam))
{
    Console.WriteLine($"A megadott szám: {szam}");
}
else
{
    Console.WriteLine("Érvénytelen szám!");
}

// ✅ ÚJRAPRÓBÁLKOZÁSSAL - Addig kérdez, amíg érvényes nem lesz
double ErvenyesDoubleBeker(string uzenet)
{
    while (true)
    {
        Console.Write(uzenet);
        if (double.TryParse(Console.ReadLine(), out double eredmeny))
        {
            return eredmeny;
        }
        Console.WriteLine("Érvénytelen bevitel! Kérlek adj meg egy érvényes számot.");
    }
}
```

## 🚨 Mi Okoz Konverziós Hibákat?

```
┌───────────────────┬─────────────┬─────────────┬─────────────────────────────────────────────────┐
│ Bemenet           │ Cél Típus   │ Eredmény    │ Indoklás                                        │
├───────────────────┼─────────────┼─────────────┼─────────────────────────────────────────────────┤
│ ""   (üres)       │ int         │ ❌ Hiba     │ Üres sztring                                    │
│ "szia"            │ double      │ ❌ Hiba     │ Nem szám                                        │
│ "123abc"          │ int         │ ❌ Hiba     │ Betűket tartalmaz                               │
│ "12.34"           │ int         │ ❌ Hiba     │ Tizedes szám egész számban                      │
│ "999999999999999" │ int         │ ❌ Hiba     │ Túl nagy int-hez                                │
│ null              │ int         │ ❌ Hiba     │ Null referencia                                 │
│ "true"            │ bool        │ ✅ true     │ Érvényes logikai érték                          │
│ "IGAZ"            │ bool        │ ❌ Hiba     │ Csak "true"/"false" angolul                     │
│ "1"               │ bool        │ ❌ Hiba     │ Számok nem logikai értékek                      │
└───────────────────┴─────────────┴─────────────┴─────────────────────────────────────────────────┘
```

## 🔢 Numerikus Típusok Tartományai

```
╔══════════════╤═════════════╤══════════════════════════════════╤═══════════════════════════════════════════════╗
║ Típus        │ Méret       │ Tartomány                        │ Példa                                         ║
╠══════════════╪═════════════╪══════════════════════════════════╪═══════════════════════════════════════════════╣
║ byte         │ 8-bit       │ 0 - 255                          │ byte kor = 25;                                ║
║ short        │ 16-bit      │ -32,768 - 32,767                 │ short ev = 2024;                              ║
║ int          │ 32-bit      │ -2.1 milliárd - 2.1 milliárd     │ int lakossag = 1000000;                       ║
║ long         │ 64-bit      │ -9.2×10¹⁸ - 9.2×10¹⁸             │ long tavolsag = 123456789012345L;             ║
║ float        │ 32-bit      │ ±3.4×10³⁸ (7 számjegy)           │ float pi = 3.14159f;                          ║
║ double       │ 64-bit      │ ±1.7×10³⁰⁸ (15-17 számjegy)      │ double pontos = 3.141592653589793;            ║
║ decimal      │ 128-bit     │ ±7.9×10²⁸ (28-29 számjegy)       │ decimal penz = 123.45m;                       ║
╚══════════════╧═════════════╧══════════════════════════════════╧═══════════════════════════════════════════════╝
```

## 💡 Profi Tippek

```
┌─── 📌 ÁLTALÁNOS SZABÁLYOK ──────────────────────────────────────────────────────────────────┐
│                                                                                             │
│  1. 🛡️  Felhasználói inputhoz: MINDIG TryParse()-t használj - ez a legbiztonságosabb        │
│  2. 🧮  Fizika számításokhoz: double-t használj (mint a projektedben)                       │
│  3. 💰  Pénzügyekhez: decimal-t használj a pontos precizitásért                             │
│  4. 🔢  Egész számokhoz: int-et használj, kivéve ha nagyobb számok kellenek                 │
│  5. ✅  Igaz/hamis értékekhez: bool.TryParse() és fogadd el a "true"/"false" értékeket      │
│                                                                                             │
└─────────────────────────────────────────────────────────────────────────────────────────────┘
```

## 🎯 A Te Fizika Projekted Példája

```csharp
// ════════════════════════════════════════════════════════════════════════════════════════════
// 🔧 Jelenlegi módszer (javított):
// ════════════════════════════════════════════════════════════════════════════════════════════
Console.Write("Add meg a tömeget (kg): ");
double m = Convert.ToDouble(Console.ReadLine());

// ════════════════════════════════════════════════════════════════════════════════════════════
// 🛡️  Még jobb (biztonságosabb):
// ════════════════════════════════════════════════════════════════════════════════════════════
static double DoubleBeker(string uzenet)
{
    while (true)
    {
        Console.Write(uzenet);
        if (double.TryParse(Console.ReadLine(), out double eredmeny) && eredmeny > 0)
        {
            return eredmeny;
        }
        Console.WriteLine("❌ Kérlek adj meg egy érvényes pozitív számot!");
    }
}

// ════════════════════════════════════════════════════════════════════════════════════════════
// 🎯 Használat a projektedben:
// ════════════════════════════════════════════════════════════════════════════════════════════
double m = DoubleBeker("Add meg a tömeget (kg): ");
double f = DoubleBeker("Add meg a gyorsulási erőt (N): ");
double s = DoubleBeker("Add meg a megtett utat (m): ");
double vk = DoubleBeker("Add meg a kezdősebességet (m/s): ");

Console.WriteLine($"✅ Sikeresen beolvasva: m={m}, f={f}, s={s}, vk={vk}");
```

---

## 🌟 Gyors Referencia Kártya

```
╔═══════════════════════════════════════════════════════════════════════════════════════════╗
║                           🇭🇺 C# KONVERZIÓ GYORSTALPALÓ                                    ║
╠═══════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                           ║
║   📥 STRING → SZÁM:     double.TryParse(input, out double szam)                           ║
║   📤 SZÁM → STRING:     szam.ToString() vagy szam.ToString("F2")                          ║
║   🛡️  BIZTONSÁGOS:      Mindig TryParse()-t használj felhasználói inputhoz                ║
║   ⚡ GYORS:             Convert.ToDouble() ha biztos vagy a formátumban                   ║
║   🎯 FIZIKÁHOZ:         double típus a legjobb választás                                  ║
║                                                                                           ║
║   Példa: double tomeg = Convert.ToDouble(Console.ReadLine());                             ║
║                                                                                           ║
╚═══════════════════════════════════════════════════════════════════════════════════════════╝
```