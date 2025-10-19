/*
Author: Szász Roland
Neptun: UW0FDO
*/
using System;

class Program {
  static void Main(string[] args) {
    string s = Console.ReadLine();
    int db = 0;

    for (int i = 0; i < s.Length; i++) {
      if (s[i] == ' ') {
        db++;
      }
    }

    int[] poz = new int[db];

    int index = 0;
    for (int j = 0; j < s.Length; j++) {
      if (s[j] == ' ') {
        poz[index] = j + 1;
        index++;
      }
    }

    for (int z = 0; z < poz.Length; z++) {
      Console.WriteLine($"Szóköz van ezen a helyiértéken {poz[z]}");
    }
  }
}
