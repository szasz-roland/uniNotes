// Név: Szász Roland
// Neptun kód: UW0FDO
// Inf-es e-mail: UW0FDO@inf.elte.hu

using System;

class Program
{
    public struct Nevezes
    {
        public string helyNev;
        public int lelekSzam;
        public int resztvevok;
    }

    static int n;
    static Nevezes[] nevezok;

    static void Main(string[] args)
    {
        #region Deklaráció
        int[] megoldas = new int[7];
        #endregion

        #region Beolvasás
        string sor = Console.ReadLine();
        if (sor != null)
        {
            n = int.Parse(sor);
            nevezok = new Nevezes[n];

            for (int i = 0; i < n; i++)
            {
                nevezok[i].helyNev = Console.ReadLine();
                nevezok[i].lelekSzam = int.Parse(Console.ReadLine());
                nevezok[i].resztvevok = int.Parse(Console.ReadLine());
            }
        }
        #endregion

        #region Feldolgozás
        
        for (int i = 0; i < 7; i++)
        {
            megoldas[i] = osszegkat(i + 1); 
        }

        #endregion

        #region Kiírás
        for (int i = 0; i < megoldas.Length; i++)
        {
            Console.Write($"{megoldas[i]} ");
        }
        #endregion
    }

    #region Függvények

    public static int kategoria(int lelek)
    {
        int kat;

        if (lelek < 700)
        {
            kat = 1;
        }
        else if (lelek < 1500)
        {
            kat = 2;
        }
        else if (lelek < 3000)
        {
            kat = 3;
        }
        else if (lelek < 8000)
        {
            kat = 4;
        }
        else if (lelek < 25000)
        {
            kat = 5;
        }
        else if (lelek < 70000)
        {
            kat = 6;
        }
        else
        {
            kat = 7;
        }

        return kat;
    }

    public static int osszegkat(int kat)
    {
        int s = 0;
        for (int i = 0; i < n; i++)
        {
            if (kategoria(nevezok[i].lelekSzam) == kat)
            {
                s += nevezok[i].resztvevok;
            }
        }
        return s;
    }
    #endregion
}