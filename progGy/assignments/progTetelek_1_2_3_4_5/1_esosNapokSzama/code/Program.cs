// Név: Szász Roland
// Neptun kód: UW0FDO
// Inf-es e-mail: UW0FDO@inf.elte.hu

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