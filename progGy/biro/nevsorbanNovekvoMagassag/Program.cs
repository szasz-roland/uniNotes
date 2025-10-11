// using System;

class Program {
  static void Main(string[] args) {
    /*
    [][][]
    [][][] MÁTRIX :D
    [][][]
     */
    // try to convert the string to int if success then retirns  true which
    // means it OUT int res returns the nubmber else it returns 0
    int n = int.TryParse(Console.ReadLine(), out int res) ? res : 0;

    // makes it nullable so no warning is shown
    string s = Console.ReadLine() ?? "";
    string[] splitted = s.Split(' ');

    string[] names = new string[n];
    string[] heights = new string[n];

    int helper = 1;
    for (int i = 0; i < splitted.Length; i++) {
      if (helper % 2 == 0) {
        heights[i] = splitted[i];
      } else {
        names[i] = splitted[i];
      }
    }
  }
}
