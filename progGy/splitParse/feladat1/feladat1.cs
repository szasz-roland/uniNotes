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

    Console.WriteLine($"Szóközök száma: {db}");
  }
}
