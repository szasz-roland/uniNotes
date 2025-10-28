#include <stdio.h>

int counter()
{
  static int i = 0;
  return ++i;
}

int main()
{
  printf("%d\n", counter());
  printf("%d\n", counter());
  printf("%d\n", counter());

  return 0;
}

// minden egyes futásnál a counter függvény kipucolódik a memóriábol ezért az output
// 5 db 1-es lesz

// megoldás hogy a globális memóriaterületre tesszük
//
// int i = 0;
// int counter()
// {
//   return ++i;
// }
//
//
// megoldás hogy a static memóriaterületre tesszük
// int counter()
// {
//   static int i = 0;
//   return ++i;
// }
