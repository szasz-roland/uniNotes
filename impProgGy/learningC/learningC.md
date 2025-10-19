# C Programming: Pointers & Arrays - Deep Understanding Tasks

## 🎯 Learning Path Overview
These tasks progress from basic concepts to advanced pointer/array manipulation. Each task builds on previous knowledge and focuses on understanding **memory layout** and **how C really works**.

---

## **LEVEL 1: Foundation - Understanding Memory & Addresses**

### Task 1.1: Memory Address Explorer
**Goal:** Understand that variables have addresses in memory

```c
// Create a program that:
// 1. Declares several int variables
// 2. Prints each variable's address using &
// 3. Prints the size of each variable using sizeof()
```

**What to learn:**
- Every variable lives at a specific memory address
- `&` operator gives you the address of a variable
- Addresses are just numbers (usually shown in hexadecimal)
- `sizeof()` tells you how many bytes a type uses

**Example exploration:**
```c
int a = 10;
int b = 20;
printf("a lives at: %p, size: %lu bytes\n", (void*)&a, sizeof(a));
printf("b lives at: %p, size: %lu bytes\n", (void*)&b, sizeof(b));
```

**Questions to answer:**
- Are the addresses next to each other?
- What is the difference between addresses?
- Why does int typically use 4 bytes?

---

### Task 1.2: Your First Pointer
**Goal:** Create and use a pointer to access a variable

```c
// 1. Create an int variable with value 42
// 2. Create a pointer that points to this variable
// 3. Print the value using both the variable and the pointer
// 4. Change the value through the pointer
// 5. Verify the original variable changed
```

**What to learn:**
- Pointer declaration syntax: `int *ptr;`
- Pointer stores an address: `ptr = &variable;`
- Dereferencing with `*`: `*ptr` accesses the value at that address
- Pointers and variables are just two ways to access the same memory

**Memory diagram to understand:**
```
Memory:     [  42  ]
Address:     0x1000
            
variable:    holds value 42, lives at 0x1000
ptr:         holds value 0x1000 (points to variable)
*ptr:        accesses what's at 0x1000, so gives you 42
```

---

### Task 1.3: Array Fundamentals
**Goal:** Understand that arrays are contiguous memory blocks

```c
// 1. Create an array: int arr[5] = {10, 20, 30, 40, 50};
// 2. Print each element's value AND address
// 3. Calculate the difference between consecutive addresses
// 4. Access elements using both arr[i] and pointer arithmetic
```

**What to learn:**
- Arrays allocate consecutive memory
- Array name is the address of the first element
- `arr[i]` is syntactic sugar for `*(arr + i)`
- Elements are spaced by sizeof(type) bytes

**Memory layout:**
```
arr[0]  arr[1]  arr[2]  arr[3]  arr[4]
[  10  ][  20  ][  30  ][  40  ][  50  ]
0x2000  0x2004  0x2008  0x200C  0x2010
```

---

## **LEVEL 2: Pointer Arithmetic & Array Traversal**

### Task 2.1: Walk Through an Array with Pointers
**Goal:** Master pointer arithmetic

```c
// Given: int numbers[] = {5, 10, 15, 20, 25};
// 1. Create a pointer to the first element
// 2. Use a loop with pointer increment (ptr++) to print all values
// 3. Do the same thing backwards from the last element using ptr--
// 4. Print the "distance" between first and last element using pointer subtraction
```

**What to learn:**
- `ptr++` moves to the next element (adds sizeof(type) bytes)
- `ptr--` moves to previous element
- `ptr2 - ptr1` gives the number of elements between them
- Pointer arithmetic is type-aware (not just byte arithmetic)

**Critical concept:**
```c
int *p = arr;
p + 1 // doesn't add 1 byte, it adds sizeof(int) bytes!
```

---

### Task 2.2: Equivalence of Arrays and Pointers
**Goal:** Prove that `arr[i]` and `*(arr + i)` are identical

```c
// 1. Create an array of 10 integers
// 2. Fill it using arr[i] = i * i;
// 3. Print it using *(arr + i)
// 4. Modify it using *(arr + i) = new_value;
// 5. Verify using arr[i]
```

**What to learn:**
- `arr[3]` is literally translated to `*(arr + 3)` by the compiler
- You can use pointer notation on arrays
- You can use array notation on pointers
- Understanding this is key to mastering C

---

### Task 2.3: Array as Function Parameter
**Goal:** Understand that arrays decay to pointers when passed to functions

```c
// 1. Write a function: void print_array(int arr[], int size)
// 2. Inside, print sizeof(arr) - surprise! It's pointer size, not array size
// 3. Write another version: void print_array2(int *arr, int size)
// 4. Notice they're identical
```

**What to learn:**
- Arrays passed to functions become pointers
- The array size information is lost
- This is why you must pass the size separately
- `int arr[]` and `int *arr` are the same in function parameters

**Critical understanding:**
```c
void func(int arr[100]) {  // You might think arr is array of 100
    printf("%lu\n", sizeof(arr));  // But it's just a pointer! (8 bytes on 64-bit)
}
```

---

## **LEVEL 3: Dynamic Memory & Practical Applications**

### Task 3.1: Dynamic Array Creation
**Goal:** Create arrays at runtime using malloc

```c
// 1. Ask user for array size
// 2. Allocate memory: int *arr = (int*)malloc(n * sizeof(int));
// 3. Check if malloc succeeded (arr != NULL)
// 4. Fill the array with values
// 5. Use the array
// 6. FREE THE MEMORY: free(arr);
```

**What to learn:**
- Stack arrays have fixed size at compile time
- `malloc` allocates memory from the heap at runtime
- You must manually free heap memory
- Memory leaks happen when you forget to free
- Always check if malloc returns NULL

**Memory regions:**
```
Stack:  Local variables, function calls (automatic cleanup)
Heap:   malloc/free (manual management)
```

---

### Task 3.2: Array of Pointers vs Pointer to Array
**Goal:** Understand the difference - this is confusing but crucial!

```c
// Part A: Array of pointers
char *names[] = {"Alice", "Bob", "Charlie"};  // Array of 3 pointers

// Part B: Pointer to array
int (*ptr_to_array)[5];  // Pointer to an array of 5 ints
int arr[5] = {1,2,3,4,5};
ptr_to_array = &arr;

// Implement both and understand the difference
```

**What to learn:**
- `char *names[]` - array where each element is a pointer
- `int (*ptr)[5]` - single pointer pointing to whole array
- Parentheses matter! `int *ptr[5]` vs `int (*ptr)[5]`
- Used differently: `names[0][0]` vs `(*ptr_to_array)[0]`

---

### Task 3.3: String Manipulation with Pointers
**Goal:** Work with strings (char arrays) using pointers

```c
// Implement these functions WITHOUT using array notation:
// 1. int my_strlen(char *str) - calculate string length
// 2. void my_strcpy(char *dest, char *src) - copy string
// 3. void my_strcat(char *dest, char *src) - concatenate strings
// 4. int my_strcmp(char *s1, char *s2) - compare strings
```

**What to learn:**
- Strings are char arrays ending with '\0'
- String functions use pointer arithmetic
- Understanding null terminator is critical
- This is how the standard library works

**Example approach for strlen:**
```c
int my_strlen(char *str) {
    char *ptr = str;
    while (*ptr != '\0') {
        ptr++;
    }
    return ptr - str;  // pointer subtraction gives length
}
```

---

## **LEVEL 4: Advanced Concepts**

### Task 4.1: 2D Arrays and Pointer-to-Pointer
**Goal:** Understand multi-dimensional arrays and double pointers

```c
// Part A: Static 2D array
int matrix[3][4] = {...};
// Access using matrix[i][j] and pointer arithmetic

// Part B: Dynamic 2D array (array of pointers)
int **matrix = (int**)malloc(rows * sizeof(int*));
for (int i = 0; i < rows; i++) {
    matrix[i] = (int*)malloc(cols * sizeof(int));
}
// Remember to free in reverse order!
```

**What to learn:**
- `int matrix[3][4]` is contiguous memory (12 ints in a row)
- `int **matrix` is array of pointers, each pointing to a row
- Memory layout is completely different!
- Double pointers are "pointers to pointers"

**Memory layout difference:**
```
Static 2D array: [row0][row1][row2] all consecutive
Dynamic 2D:      pointers -> [row0] somewhere
                          -> [row1] somewhere else
                          -> [row2] yet another place
```

---

### Task 4.2: Function Pointers
**Goal:** Store and call functions using pointers

```c
// 1. Create functions: int add(int a, int b), int multiply(int a, int b)
// 2. Create function pointer: int (*operation)(int, int);
// 3. Point it to add, call it
// 4. Point it to multiply, call it
// 5. Create an array of function pointers for a calculator
```

**What to learn:**
- Functions also have addresses in memory
- Function pointers store these addresses
- Used for callbacks, plugin systems, etc.
- Syntax is tricky but follows the pattern

---

### Task 4.3: Pointer to Const vs Const Pointer
**Goal:** Master const correctness

```c
// Understand these four combinations:
const int *ptr1;        // pointer to const int (can't change value)
int *const ptr2;        // const pointer to int (can't change address)
const int *const ptr3;  // const pointer to const int (can't change either)
int *ptr4;              // regular pointer (can change both)

// Test what operations are allowed for each
```

**What to learn:**
- `const` helps prevent bugs
- Read right-to-left: "ptr1 is a pointer to const int"
- Used in function parameters to show intent
- Compiler will catch mistakes

---

## **LEVEL 5: Real-World Applications**

### Task 5.1: Implement a Dynamic Vector
**Goal:** Create a resizable array (like C++ vector)

```c
typedef struct {
    int *data;
    size_t size;
    size_t capacity;
} Vector;

// Implement:
// - Vector* vector_create()
// - void vector_push_back(Vector *v, int value)
// - int vector_get(Vector *v, size_t index)
// - void vector_free(Vector *v)
```

**What to learn:**
- Real data structures use dynamic memory
- Resizing with `realloc()`
- Capacity vs size concept
- Memory management in practice

---

### Task 5.2: Linked List
**Goal:** Understand how pointers create data structures

```c
typedef struct Node {
    int data;
    struct Node *next;  // Pointer to next node
} Node;

// Implement:
// - Create node
// - Insert at beginning
// - Insert at end
// - Search for value
// - Delete node
// - Free entire list
```

**What to learn:**
- Structures can contain pointers to themselves
- Memory isn't contiguous (unlike arrays)
- Pointer manipulation creates connections
- Manual memory management is crucial

---

### Task 5.3: Swap Function Variations
**Goal:** Understand pointer parameters deeply

```c
// Implement and compare:
void swap_wrong(int a, int b);           // Doesn't work - why?
void swap_correct(int *a, int *b);       // Works - why?
void swap_pointers(int **a, int **b);    // Swaps pointers themselves
```

**What to learn:**
- Pass by value vs pass by pointer
- To modify caller's variable, need its address
- Double pointers to modify pointers
- This is fundamental to C parameter passing

---

## 📚 Study Tips for ELTE Imperatív Programozás

1. **Draw memory diagrams** for every exercise
2. **Use printf to print addresses** liberally while learning
3. **Run code through a debugger** (gdb) to watch memory
4. **Compile with warnings**: `gcc -Wall -Wextra`
5. **Use valgrind** to check for memory leaks
6. **Don't just read** - type and run every example

## Common Mistakes to Avoid

❌ Forgetting to free memory  
❌ Accessing freed memory (dangling pointers)  
❌ Array out of bounds access  
❌ Dereferencing NULL pointers  
❌ Confusing `*` (declaration) with `*` (dereferencing)  
❌ Forgetting that array names are const pointers  

## Essential Commands

```bash
# Compile with all warnings
gcc -Wall -Wextra -g program.c -o program

# Run with valgrind (check memory)
valgrind --leak-check=full ./program

# Debug with gdb
gdb ./program
```

---

**Remember:** Understanding pointers is understanding C. Take your time with each level, and make sure you deeply understand one before moving to the next. Sok sikert az egyetemen! 🎓
