/*
Author: Szász Roland
Neptun: UW0FDO
NET8.0 Project
*/
using System;

class Program
{
    static void Main(string[] args)
    {
        (double, double) gyorsulas = Gyorsul(1000, 2000, 6, 5);
        Console.WriteLine(gyorsulas);

        (double, double) gyorsulas2 = Gyorsul(2000, 2000, 6, 5);
        Console.WriteLine(gyorsulas2);
    }

    // Nyers megoldás
    // static (double, double) Gyorsul(double m, double f, double s, double vk)
    // {
    //     if (m <= 0 || f <= 0 || s <= 0 || vk < 0)
    //     {
    //         Console.WriteLine("Valamenyik adat hibás!");
    //         Environment.Exit(1); // Kilépés 1-es hibakóddal mert hiábs adatot kapott a program
    //     }

    //     double t = (-vk * m + Math.Sqrt(Math.Pow(vk, 2) * Math.Pow(m, 2) + 2 * f * m * s)) / f;
    //     double vt = f * t / m + vk;

    //     return (t, vt);
    // }

    // Finomított megodás
    static (double, double) Gyorsul(double m, double f, double s, double vk)
    {
        if (m <= 0 || f <= 0 || s <= 0 || vk < 0)
        {
            Console.WriteLine("Valamenyik adat hibás!");
            Environment.Exit(1); // Kilépés 1-es hibakóddal mert hiábs adatot kapott a program
        }

        // (a/2 * t^2) + (vk * t) - s = 0
        double A = (f / m) / 2;
        double B = vk;
        double C = -s;

        double diszkriminans = B * B - 4 * A * C; // B*B is faster than Math.Pow(B,2) 

        double t = (-B + Math.Sqrt(diszkriminans)) / (2 * A);

        //double t = (-vk * m + Math.Sqrt(Math.Pow(vk, 2) * Math.Pow(m, 2) + 2 * f * m * s)) / f;
        double vt = f * t / m + vk;

        return (t, vt);
    }
}
