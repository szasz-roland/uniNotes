#include <stdio.h>

int *f()
{
  int i = 42;
  return &i;
}

int main()
{
  int *p = f();
  printf("%d\n", *p);
  return 0;
}

// mivel az f függvény lefutása után az int i = 42; törlődik a memóriából ezért a *p definiálatlan viselkedés
// vagyis bármi történhet
