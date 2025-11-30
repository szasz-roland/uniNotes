// Név: Szász Roland
// Neptun kód: UW0FDO
// Inf-es e-mail: UW0FDO@inf.elte.hu

using System;

class Program
{
    static int n, m, k;
    static int[,] h;

    static void Main(string[] args)
    {
        #region Deklaráció
        int i;
        #endregion

        #region Beolvasás
        string[] elsoSor = Console.ReadLine().Split(' ');
        n = int.Parse(elsoSor[0]);
        m = int.Parse(elsoSor[1]);
        k = int.Parse(elsoSor[2]);

        h = new int[n, m];

        for (int sorIndex = 0; sorIndex < n; sorIndex++)
        {
            string[] sor = Console.ReadLine().Split(' ');
            for (int napIndex = 0; napIndex < m; napIndex++)
            {
                h[sorIndex, napIndex] = int.Parse(sor[napIndex]);
            }
        }
        #endregion

        #region Feldolgozás
        i = 0;
        while (i < n && !Melegebb(i))
        {
            i++;
        }
        #endregion

        #region Kiírás
        if (i < n)
        {
            Console.WriteLine(i + 1);
        }
        else
        {
            Console.WriteLine("-1");
        }
        #endregion
    }

    #region Függvények
    static bool Hidegebb(int i, int j)
    {
        int k = 0;
        while (k < m && h[j, k] < h[i, k])
        {
            k++;
        }
        return k == m;
    }

    static bool Melegebb(int i)
    {
        int j = 0;
        while (j < n && !(j != i && Hidegebb(i, j)))
        {
            j++;
        }
        return j < n;
    }
    #endregion
}