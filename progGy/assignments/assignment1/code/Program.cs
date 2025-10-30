// Név: Szász Roland
// Neptun kód: UW0FDO
// Inf-es e-mail: UW0FDO@inf.elte.hu


/*Feladatleírás: ------------------------

Szélcsendes napok száma

A vitorlás versenyek rendezői megmérték N napon keresztül Balatonfüreden a szélsebességet.
Vitorlás versenyt szélcsendben nem lehet rendezni, de nagyobb viharban sem célszerű.
A versenyen naponta egy fordulót rendeznek, s legalább K fordulóra van szükség.
Írj programot, amely kiszámolja, hogy hány napon volt szélcsend!

Bemenet
A standard bemenet első sorában a napok száma (1≤N≤1000) és a versenynapok száma (1≤K≤10) szerepel.
A következő N sorban az egyes napokon mért szélsebességek szerepelnek (0≤S≤200).

Kimenet
A standard kimenet egyetlen sorába a szélcsendes napok számát kell kiírni!

Példa
Bemenet       Kimenet
10 3          2
50
40
0
5
0
80
70
90
100
120


Korlátok
Időlimit: 0.1 mp
Memórialimit: 32 MB
Pontozás: A tesztek 40%-ában a bemenet hossza≤20.
---------------------------------------*/




using System;

class Program {
    static void Main(string[] args) {
        #region Deklaráció

        int napok;
        int fordulo;
        int snapok;
        int[] sebessegek;
        int i;

        #endregion

        #region Beolvasás

        // Beolvasás és tördelés szóközöknél --------------
        string elsoSor = Console.ReadLine();
        string[] szavak = elsoSor.Split(' ');
        napok = int.Parse(szavak[0]);
        fordulo = int.Parse(szavak[1]);
        // ------------------------------------------------

        sebessegek = new int[napok];
        for (i = 0; i < sebessegek.Length; ++i) {
          sebessegek[i] = int.Parse(Console.ReadLine());
        }

        #endregion

        #region Feldolgozás

        snapok = 0;

        for (i = 0; i < sebessegek.Length; ++i) {
          if (sebessegek[i] == 0) {
            ++snapok;
          }
        }

        #endregion

        #region Kiírás
        Console.WriteLine($"{snapok}");
        #endregion
    }
}