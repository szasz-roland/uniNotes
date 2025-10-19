#include <stdio.h>

int main()
{
  printf("Hello World!\n\n");

  // Standartd I/O
  // 1. feladat
  printf("Roland\n\n");

  // 2. feladat
  printf("2.feladat %d\n", 1 + 2);

  // 3. feladat
  printf("3. feladat %d\n", 10 / 5);
  // printf("Osztás 0-val %d\n", 2 / 0); -> division by 0 is undefined error

  int x = 6;
  int xx = 12;
  float y = 3.14;
  float yy = 6.28;
  printf("Osztás INT-el és FLOAT-al: \n");
  printf("INT / FLOAT: %f\n", x / y);
  printf("FLOAT / INT: %f\n", y / x);
  printf("FLOAT / FLOAT: %f\n", yy / y);
  printf("INT / INT: %d\n", xx / x);

  // 4. feladat
  printf("Négyszög kerülete és területe:\n");
  double a;
  double b;

  printf("Add meg a négystög két oldalát!");
  scanf("%lf", &a);
  scanf("%lf", &b);
  printf("Kerület: %lf \nTerület: %lf\n", ((2 * a) + (2 * b)), (a * b));

  printf("Kör kerülete és területe:\n");
  double pi = 3.1415;
  double r;

  scanf("%lf", &r);
  printf("Kerület: %lf\nTerület: %lf\n", (2 * r * pi), (pi * (r * r)));

  // 5. feladat
  char name[10];
  printf("Add meg a neved: ");
  scanf("%s", &name);
  printf("Neved: %s", name);

  // 6. feladat

  return 0;
}
