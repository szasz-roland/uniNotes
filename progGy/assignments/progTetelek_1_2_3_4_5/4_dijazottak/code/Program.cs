// Név: Szász Roland
// Neptun kód: UW0FDO
// Inf-es e-mail: UW0FDO@inf.elte.hu

using System;

class Program
{
    public struct Versenyzo
    {
        public string nev;
        public int pont;
    }

    static void Main(string[] args)
    {
        #region Deklaráció
        int n;
        int p;
        Versenyzo[] r;
        
        int db1 = 0; string[] y1;
        int db2 = 0; string[] y2;
        int db3 = 0; string[] y3;
        int db4 = 0; string[] y4;
        #endregion

        #region Beolvasás
        string[] elsoSor = Console.ReadLine().Split(' ');
        n = int.Parse(elsoSor[0]);
        p = int.Parse(elsoSor[1]);

        r = new Versenyzo[n];
        y1 = new string[n];
        y2 = new string[n];
        y3 = new string[n];
        y4 = new string[n];

        for (int i = 0; i < n; i++)
        {
            string sor = Console.ReadLine();
            string[] adatok = sor.Split(';');
            r[i].nev = adatok[0];
            r[i].pont = int.Parse(adatok[1]);
        }
        #endregion

        #region Feldolgozás
        
        // 1. I. Kategória (>= 90%)
        for (int i = 0; i < n; i++)
        {
            if (r[i].pont >= (p * 0.90))
            {
                y1[db1] = r[i].nev;
                db1++;
            }
        }

        // 2. II. Kategória (80% - 90%)
        for (int i = 0; i < n; i++)
        {
            if (r[i].pont < (p * 0.90) && r[i].pont >= (p * 0.80))
            {
                y2[db2] = r[i].nev;
                db2++;
            }
        }

        // 3. III. Kategória (70% - 80%)
        for (int i = 0; i < n; i++)
        {
            if (r[i].pont < (p * 0.80) && r[i].pont >= (p * 0.70))
            {
                y3[db3] = r[i].nev;
                db3++;
            }
        }

        // 4. IV. Kategória (< 70%)
        for (int i = 0; i < n; i++)
        {
            if (r[i].pont < (p * 0.70))
            {
                y4[db4] = r[i].nev;
                db4++;
            }
        }
        #endregion

        #region Kiírás
        KiirKategoria(db1, y1);
        KiirKategoria(db2, y2);
        KiirKategoria(db3, y3);
        KiirKategoria(db4, y4);
        #endregion
    }

    static void KiirKategoria(int db, string[] nevek)
    {
        Console.Write(db);
        for (int i = 0; i < db; i++)
        {
            Console.Write($";{nevek[i]}");
        }
        Console.WriteLine(";");
    }
}