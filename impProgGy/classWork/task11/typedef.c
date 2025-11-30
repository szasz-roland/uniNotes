#include <stdio.h>

struct Circle
{
  double x, y;
  double r;
};
typedef struct Circle Circle;

double area(struct Circle c)
{
  return c.r * c.r * 3.14;
}

void move(Circle *c, double dx, double dy)
{
  //  (*c).x += dx;
  //  (*c).y += dy;
  c->x += dx;
  c->y += dy;
}

typedef int Egesz;

int main()
{
  Egesz i = 2;

  Circle c;
  c.x = 0;
  c.y = 0;
  c.r = 5;

  move(&c, 1, 2);

  printf("%lf\n", area(c));
  printf("%lf %lf\n\n", c.x, c.y);
}
