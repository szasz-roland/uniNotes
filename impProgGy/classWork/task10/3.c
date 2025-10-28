#include <stdio.h>
#include <string.h> // string manipulation

// Heap memory
int main()
{
  // 1.feladata
  char original[20]; // 19 + záró 0
  scanf("%s", original);
  int size = strlen(original);

  char other[size + 1];

  for (int i = 0; i < size; i++)
  {
    other[i] = original[i];
  }
  other[size] = '\0';

  strcpy(other, original);
}
