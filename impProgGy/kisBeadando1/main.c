// Author: Szász Roland
// Neptun: UW0FDO

#include <stdio.h>
#include <stdlib.h>

int main()
{
  // Alsóhatár beolvasása
  int lowBorder;
  printf("Add meg az alsóhatárt >>> ");
  scanf("%d", &lowBorder);
  // Felsőhatár beolvasása
  int highBorder;
  printf("Add meg az felsőhatárt >>> ");
  scanf("%d", &highBorder);

  // Tájékoztatás az intervallumról
  printf("\n----------------\n\"Gondolok\" egy számra %d és %d között...\n----------------\n\n", lowBorder, highBorder);

  // Próbák száma
  int numOfGuesses;

  // Random szám generálás a megadott intervallumban
  // rand() % highBorder = some number and the + lowBorder shifts it upwards
  // like +100 then eg. 9 will become 109
  int randNum = (rand() % highBorder + 1) + lowBorder;

  int userGuess;

  while (userGuess != randNum)
  {
    // Tipp bekérése
    printf("Mi lehet a szám amire gondoltam? >>> ");
    scanf("%d", &userGuess);

    // Ellenőrzöm hogy az intervallumon belül van-e a tipp
    if (userGuess > highBorder || userGuess < lowBorder)
    {
      printf("Ez nincs az intervallumban! >:(\n");
      // Végül nem növelem mert igazábol érvénytelen a próbálkozás
      // numOfGuesses++;
    }
    else
    {

      if (userGuess != randNum)
      {
        numOfGuesses++;
      }

      if (userGuess > randNum)
      {
        printf("\nEgy kicsit kissebbet! :D\n");
      }
      else if (userGuess < randNum)
      {
        printf("\nEnnél azért több! ;)\n");
      }
    }
  }

  printf("\n==========\nSzám >> %d\nProbálkozásaid >> %d\n==========\n", randNum, (numOfGuesses + 1));
}
