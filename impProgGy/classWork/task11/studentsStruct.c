#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct Student
{
  int id;
  double avg;
  int age;
};
typedef struct Student Student;

void init_student(Student *s)
{
  s->id = rand();
  s->age = rand() % (50 - 15) + 18;
  s->avg = (rand() % 50 + 1) / 10.0;
}

Student init_student2()
{
  Student s;
  s.id = rand();
  s.age = rand() % (50 - 15) + 18;
  s.avg = (rand() % 50 + 1) / 10.0;

  return s;
}

Student *init_student3()
{
  Student *s = (Student *)malloc(sizeof(Student));
}

// figyelembe kell venni a másolandó sturct méretét mert fölöslegesen ne másolgassunk sokat
void print_student(Student *s)
{
  printf("Id: %d\nKor: %d\nAvg: %lf\n", s->id, s->age, s->avg);
}

int main()
{

  // seedelem a random szám generátort idővel mert az folyamatosan változik :d
  srand(time(0));

  Student s;
  init_student(&s);
  print_student(&s);

  Stident stidents
}
