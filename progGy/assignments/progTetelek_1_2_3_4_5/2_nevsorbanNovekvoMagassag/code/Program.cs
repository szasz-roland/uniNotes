// Név: Szász Roland
// Neptun kód: UW0FDO
// Inf-es e-mail: UW0FDO@inf.elte.hu

using System;

class Program {

    public struct Diak {
        public string nev;
        public int magassag;
    }

    static void Main(string[] args) {
        #region Deklaráció

        int t;
        Diak[] diakok;
        bool van;
        string valasz;
        int i;

        #endregion

        #region Beolvasás

        t = int.Parse(Console.ReadLine());
        diakok = new Diak[t];

        for (i = 0; i<t; ++i) {
            string[] sor = Console.ReadLine().Split(); // Kérdés hogy ez + változó-e amit az NSD-be is be kell írni
            diakok[i].nev = sor[0];
            diakok[i].magassag = int.Parse(sor[1]);
        }

        #endregion

        #region Feldolgozás

        van = false;
        i = 0;

        while (i < t-1 && !(van)) {
            if (diakok[i].magassag > diakok[i+1].magassag) {
                van = true;
            }
            i++;
        }

        if (van) {
            valasz = "NEM";
        } else {
            valasz = "IGEN";
        }

        #endregion

        #region Kiírás
        Console.WriteLine($"{valasz}");
        #endregion
    }
}