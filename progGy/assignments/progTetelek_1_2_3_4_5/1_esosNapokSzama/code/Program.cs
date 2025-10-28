// Név: Szász Roland
// Neptun kód: UW0FDO
// Inf-es e-mail: UW0FDO@inf.elte.hu


/*
Esős napok száma

N napon át minden nap megmértük, hogy hány milliméter eső esett.
Készíts programot, amely megadja, hogy hány esős nap volt!

Bemenet
A standard bemenet első sorában a vizsgált napok száma van (0≤N≤100), a következő N
sorban pedig soronként a napi mérések eredményei vannak (0≤Mi≤1000).

Kimenet
A standard kimenet egyetlen sorába azon napok számát kell kiírni, amelyeken esett az eső!

Példa

Bemenet     Kimenet
5           3
0
15
20
0
10
*/

using System;

class Program {
    static void Main(string[] args) {
        #region Deklaráció

        int n;
        int res;
        int i;
        int[] mm;

        #endregion

        #region Beolvasás

        n = int.Parse(Console.ReadLine());
        mm = new int[n];
        for (i = 0; i < n; ++i) {
            mm[i] = int.Parse(Console.ReadLine());
        }

        #endregion

        #region Feldolgozás

        res = 0;
        for (i = 0; i < n; i++) {
            if (mm[i] > 0) {
                res++;
            }
        }

        #endregion

        #region Kiírás
        Console.WriteLine($"{res}");
        #endregion
    }
}