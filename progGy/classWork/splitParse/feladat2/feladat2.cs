/*
Author: Szász Roland
Neptun: UW0FDO
*/
using System;

class Program
{
    static void Main(string[] args)
    {
        string s = Console.ReadLine() ?? "";
        bool van = false;
        int i = 0;

        while (i < s.Length && !(s[i] == '+' || s[i] == '-'))
        {
            i++;
        }
        van = i < s.Length;
        Console.WriteLine($"Megoldás: {van}");
    }
}