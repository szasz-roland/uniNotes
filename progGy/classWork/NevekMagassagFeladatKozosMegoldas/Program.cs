// Név: Szász Roland
// Neptun kód: UW0FDO
// Inf-es e-mail: UW0FDO@inf.elte.hu

using System;
namespace NevekMagassagFeladat {

    public struct Tanulo {
        public string nev;
        public int magassag;
    }

    class Program {
        static void Main(string[] args) {
            #region Deklaráció
    
            int letszam;
            int darab;
            Tanulo[] tanulok;
    
            #endregion

            #region Beolvasás

            letszam = int.Parse(Console.ReadLine());
            tanulok = new Tanulo[letszam];
            for (int i = 0; i < letszam; i++) {
                tanulok[i].nev = Console.ReadLine();
                tanulok[i].magassag = int.Parse(Console.ReadLine());
            }

            #endregion

            #region Feldolgozás
            darab = Megszamolas(letszam, tanulok);

            static int Megszamolas(int osztalyLetszam, Tanulo[] tanulokListaja) {

                int db = 0;
                for (int i = 0; i < osztalyLetszam; i++) {
                    if (tanulokListaja[i].nev.Length > 5) {
                        db++;
                    }
                }

                return db;
            }

            #endregion

            #region Kiírás
            Console.WriteLine($"{darab}");
            #endregion
        }
    }
}