using System;

class Program
{
  static void Main(string[] args)
  {
    int n = int.Parse(Console.ReadLine());
    // pl 5

    int[] bin = new int[8];
    for (int i = 0; i < 8; i++)
    {
      if (n % 2 == 0)
      {
        bin[i] = 0;
      }
      else
      {
        bin[i] = 1;
      }

      n = n / 2;

      Console.WriteLine($"Num: {n}\n");
    }
    for (int i = 0; i < bin.Length; i++)
    {
      Console.Write($"{bin[i]}\n");
    }
  }
}
