#include <stdio.h>

int main() {

  int arr[] = {10, 20, 30, 1, 40, 50, 999};
  int arrLength = sizeof(arr) / sizeof(arr[0]);
  int max = arr[0], min = arr[0];

  // Lgkissebb
  for (int i = 0; i < arrLength; i++) {
    if (arr[i] < min) {
      min = arr[i];
    }
    if (arr[i] > max) {
      max = arr[i];
    }
  }
  // switch thm
  int temp = min;
  min = max;
  max = temp;

  printf("A legnagyobb: %d\n A legkissebb: %d\n", max, min);

  return 0;
}
