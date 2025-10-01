/*
Author: Szász Roland
Neptun: UW0FDO
*/
using System;

class Program
{
    static void Main(string[] args)
    {
        (double x1, double x2, bool van) megoldas = QuadraticSolver(1, -3, 2);
        Console.WriteLine($"Van megoldás: {megoldas.van}\nEgyik megoldás: {megoldas.x1}\nMásik megoldás: {megoldas.x2}");

        Console.WriteLine("\n------------------------------------------------\n");

        (double x1, double x2, bool van) megoldas2 = QuadraticSolver(0, 0, 0);
        Console.WriteLine($"Van megoldás: {megoldas2.van}\nEgyik megoldás: {megoldas2.x1}\nMásik megoldás: {megoldas2.x2}");
    }
    public static (double x1, double x2, bool van) QuadraticSolver(double a, double b, double c)
    {
        double diszk = (b * b) - (4 * a * c);
        double x1;
        double x2;
        bool van;

        if (a == 0 && b == 0 && c == 0)
        {
            van = true; // Végtelen megoldás
            x1 = 0;
            x2 = 0;
        }
        else if (a == 0 && b == 0 && c != 0)
        {
            van = false; // Ellentmondás
            x1 = 0;
            x2 = 0;
        }
        else if (a == 0 && b != 0)
        {
            van = true; // 1 Megoldás
            x1 = -c / b;
            x2 = x1;
        }
        else // Nem lehet else if (a != 0) mert a compiler valamiért nem kezeli jól
        {
            if (diszk > 0)
            {
                van = true;
                x1 = (-b + Math.Sqrt(diszk)) / (2 * a);
                x2 = (-b - Math.Sqrt(diszk)) / (2 * a);
            }
            else if (diszk == 0)
            {
                van = true;
                x1 = -b / (2 * a);
                x2 = x1;
            }
            else
            {
                van = false;
                x1 = 0;
                x2 = 0;
            }
        }

        return (x1, x2, van);
    }
}
