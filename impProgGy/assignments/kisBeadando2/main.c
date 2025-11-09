// Neptunkód: UW0FDO
// Név: Szász Roland
//

#include <ctype.h> // Character handling functions
#include <stdio.h> // Standradt Input/Output functions

int main()
{
  // Opening file
  // fp points to a FILE object -> represens opened file in C
  // fopen("<filename>", "<mode>") -> opens the file in specified mode -> if error: NULL
  FILE *fp;
  fp = fopen("input.txt", "r");

  // Checking if opened or not
  if (!fp)
  {
    printf("Error opening file :(");
    // Exit w/ error code 1
    return 1;
  }

  // 26 long int array-> 26 letter in ABC
  int count[26] = {0}; //{0} -> setts all elements to 0
  int c;

  // fgetc() reads the next character form the file and stores it in int c;
  // untin c == EOF then it exits
  while ((c = fgetc(fp)) != EOF)
  {
    if (isalpha(c))
    {
      c = tolower(c);
      // Calculates the index with ASCII eg. c = ''a' ->  97 - 97 = 0
      count[c - 'a']++;
    }
  }

  // Closing file
  fclose(fp);

  for (int i = 0; i < 26; i++)
  {
    if (count[i] > 0)
      // Determining the letter with i + 'a' w/ ascii
      printf("%c: %d\n", i + 'a', count[i]);
  }

  return 0;
}
