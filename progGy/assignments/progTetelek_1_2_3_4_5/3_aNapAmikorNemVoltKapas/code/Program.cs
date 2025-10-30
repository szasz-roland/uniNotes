// Név: Szász Roland
// Neptun kód: UW0FDO
// Inf-es e-mail: UW0FDO@inf.elte.hu

using System;

class Program {
    static void Main(string[] args) {
        #region Deklaráció

        int n;
        int ind;
        int[] kapasok;
        bool van;
        int i;

        #endregion

        #region Beolvasás

        n = int.Parse(Console.ReadLine());
        kapasok = new int[n];

        for (i = 0; i < kapasok.Length; ++i) {
            kapasok[i] = int.Parse(Console.ReadLine());
        }

        #endregion

        #region Feldolgozás

        van = false;
        i = 0;
        ind = 0;

        while (!(van) && i < kapasok.Length) {
            van = kapasok[i] == 0;
            ind = i+1;
            ++i;
        }

        if (!(van)) {
            ind = -1;
        }

        #endregion

        #region Kiírás
        Console.WriteLine($"{ind}");
        #endregion
    }
}