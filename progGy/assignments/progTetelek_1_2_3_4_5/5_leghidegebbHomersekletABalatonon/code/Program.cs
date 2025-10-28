// Név: Szász Roland
// Neptun kód: UW0FDO
// Inf-es e-mail: UW0FDO@inf.elte.hu

using System;

class Program {
    static void Main(string[] args) {
        #region Deklaráció
        
        int n;
        int[] h;
        int min;
        int i;

        #endregion

        #region Beolvasás

        n = int.Parse(Console.ReadLine());
        h = new int[n];
        
        for (i = 0; i < n; ++i) {
            h[i] = int.Parse(Console.ReadLine());
        }

        #endregion

        #region Feldolgozás

        min = h[0];
        for (i = 1; i < n; ++i) {
            if (h[i] < min) {
                min = h[i];
            }
        }

        #endregion

        #region Kiírás

        Console.WriteLine($"{min}");

        #endregion
    }
}