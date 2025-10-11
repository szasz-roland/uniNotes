using System;

class Program
{
    static void Main(string[] args)
    {

        int n = int.Parse(Console.ReadLine());
        int counter = 0;

        for (int i = 0; i < n; i++)
        {
            if (int.Parse(Console.ReadLine()) > 0)
            {
                counter++;
            }
        }

        Console.WriteLine(counter);
    }
}
