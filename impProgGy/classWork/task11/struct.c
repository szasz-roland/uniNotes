#include <stdio.h>

struct Circle
{
  double x, y;
  double r;
};

double area(struct Circle c)
{
  return c.r * c.r * 3.14;
}

void move(struct Circle *c, double dx, double dy)
{
  //  (*c).x += dx;
  //  (*c).y += dy;
  c->x += dx;
  c->y += dy;
}

int main()
{
  struct Circle c;
  c.x = 0;
  c.y = 0;
  c.r = 5;
  move(&c, 1, 2);
  printf("%lf\n", area(c));
  printf("%lf %lf\n\n", c.x, c.y);
}
