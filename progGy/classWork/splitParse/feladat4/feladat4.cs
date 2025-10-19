/*
Author: Szász Roland
Neptun: UW0FDO
*/
// using System;
class Program {
  static void Main(string[] args) {

    string s = Console.ReadLine();
    int k = int.Parse(Console.ReadLine());

    bool szamE = (s[k - 1] >= '0' && s[k - 1] <= '9');

    Console.WriteLine(szamE);
  }
}
