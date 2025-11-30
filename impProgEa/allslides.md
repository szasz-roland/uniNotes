[all-slides_hu.pdf](attachment:b9d8716f-df75-40fd-b09d-3aba0614e21f:all-slides_hu.pdf)

---

# 🧠 Imperatív Programozás – All Slides jegyzet

> Teljes anyag: 361 oldal, egyetemi kurzus – Kozsik Tamás és mások (ELTE)
> 

---

## 📘 1. Alapfogalmak (3–30. dia)

### Mi az imperatív programozás?

- **Utasítások**: utasítások sorozata, amelyek memóriát írnak/olvasnak
- **Vezérlési szerkezetek**: elágazások, ciklusok
- **C nyelv**: alacsony szintű, közvetlen memória-hozzáférés

---

### Program szerkezete

| Elem | Példa |
| --- | --- |
| Kulcsszavak | `if`, `while`, `int`, `return` |
| Literálok | `42`, `"hello"`, `'c'` |
| Operátorok | `+`, `*`, `==`, `&&` |
| Azonosítók | `n`, `factorial`, `main` |
| Kifejezések | `n + 1`, `x < 3` |
| Utasítások | `n = 5;`, `return x;` |
| Alprogramok | függvények, eljárások |
| Modulok | `.c` és `.h` fájlok |

---

### Egyszerű utasítások

- Értékadás: `x = 5;`
- Üres utasítás: `;`
- Függvényhívás: `printf("hello");`
- Visszatérés: `return 0;`

---

### Vezérlési szerkezetek

- **Elágazás**:
    
    ```c
    if (x > 0) {
        y = x;
    } else {
        y = -x;
    }
    ```
    
- **Ciklusok**:
    - `while`, `for`, `do-while`
- **Switch**:
    
    ```c
    switch (day) {
        case 1: printf("Hétfő"); break;
        default: printf("Ismeretlen");
    }
    ```
    

---

### Nem strukturált vezérlés

- `break`: kilép a ciklusból
- `continue`: átugorja a ciklus többi részét
- `goto`: ugrás címkére – **kerüld!**

---

### Rekurzió

```c
int factorial(int n) {
    return n < 2 ? 1 : n * factorial(n - 1);
}
```

---

## 📗 2. Alaptípusok és Műveletek (33–84. dia)

### Literálok

| Típus | Példa |
| --- | --- |
| Egész | `42`, `0xCAFE`, `123L` |
| Lebegőpontos | `3.14`, `1.23e-4` |
| Karakter | `'a'`, `'\\n'` |
| Sztring | `"hello"` |

---

### Operátorok

| Kategória | Operátorok |
| --- | --- |
| Aritmetikai | `+`, `-`, `*`, `/`, `%` |
| Relációs | `==`, `!=`, `<`, `>` |
| Logikai | `&&`, ` |
| Bitműveletek | `&`, ` |
| Egyéb | `++`, `--`, `?:`, `sizeof` |

---

### Típuskonverzió

```c
float f = 5;         // automatikus
int i = (int)3.14;   // kényszerítés

```

---

### Számábrázolás

- **Egész**: két-komplemens
- **Lebegőpontos**: IEEE 754
- **Karakter**: ASCII/UTF-8

---

### Sorozatok (tömbök)

```c
int a[10];
int b[][3] = { {1,2,3}, {4,5,6} };
```

---

### Szövegek

```c
char s[] = "hello";
printf("%s", s);
```

---

## 📙 3. Programozási Nyelvek Definíciója (86–100. dia)

### Szabályok

- **Lexikai**: milyen elemek vannak
- **Szintaktikus**: hogyan építkezhetünk
- **Szemantikus**: mit jelent

---

### Példa: azonosítók

- **Jó**: `factorial`, `x`, `open_file`
- **Rossz**: `2cents`, `fifty%`

---

### BNF példa

```
<while-stmt> ::= while (<expression>) <statement>
```

---

### Típusrendszer

- **Statikus**: fordítási időben
- **Dinamikus**: futási időben
- **Erősen típusos**: C viszonylag szigorú

---

## 📕 4. Kifejezések (104–113. dia)

### Értékelés

- **Precedencia**:  erősebb, mint `+`
- **Asszociativitás**: balról jobbra
- **Mellékhatás**: `x++`, `n = 1`
- **Lustaság**: `A && B` – ha `A` hamis, `B` ki sem értékelődik

---

### Vessző operátor

```c
int x = (1, 2, 3); // x = 3
```

---

## 📓 5. Utasítások (114–161. dia)

### Egyszerű utasítások

- Változódeklaráció: `int x = 0;`
- Értékadás: `x = 5;`
- Függvényhívás: `printf("hello");`
- Visszatérés: `return x;`

---

### Vezérlési szerkezetek

- **Elágazás**:
    
    ```c
    if (x > 0) {
        y = x;
    } else {
        y = -x;
    }
    ```
    
- **Ciklusok**:
    - `while`, `for`, `do-while`
- **Switch**:
    
    ```c
    switch (day) {
        case 1: printf("Hétfő"); break;
        default: printf("Ismeretlen");
    }
    ```
    

---

### Nem strukturált vezérlés

- `break`: kilép a ciklusból
- `continue`: átugorja a ciklus többi részét
- `goto`: ugrás címkére – **kerüld!**

---

### Rekurzió

```c
int factorial(int n) {
    return n < 2 ? 1 : n * factorial(n - 1);
}
```

---

## 📒 6. Hatókör (Scope) (163–185. dia)

### Deklaráció vs Definíció

- **Deklaráció**: név bevezetése
- **Definíció**: tárhely lefoglalása

---

### Statikus hatókör

- A deklarációtól a blokk végéig érvényes
- **Lokális**: blokkban van
- **Globális**: nincs blokkban
- **Elfedeés**: belső név árnyékolja a külsőt

---

## 📔 7. Dinamikus Programstruktúra (188–223. dia)

### Végrehajtási verem

- LIFO: utoljára hívott függvény fejeződik be először
- **Aktivációs rekord**: minden függvényhívéshez egy
- **Rekurzió**: minden híváshoz új rekord

---

### Változók élettartama

| Típus | Tárhely | Élettartam |
| --- | --- | --- |
| `static` | statikus | program elejétől végéig |
| `auto` | verem | blokk végrehajtása alatt |
| `malloc` | heap | `free()`-ig |

---

## 📋 8. Dinamikus Memóriakezelés (225–246. dia)

### `malloc` és `free`

```c
int *p = (int*)malloc(sizeof(int));
if (p != NULL) {
    *p = 42;
    printf("%d\\n", *p);
    free(p);
}
```

---

### Hibák

- **Memóriaszivárgás**: `free()` elmarad
- **Dupla felszabadítás**: `free()` kétszer
- **Érvénytelen mutató**: felszabadítás utáni használat

---

## 📊 9. Paraméterátadás (265–281. dia)

### Érték szerinti

- Másolat készül
- Eredeti változó nem változik

---

### Cím szerinti emuláció

```c
void swap(int *a, int *b) {
    int c = *a;
    *a = *b;
    *b = c;
}
```

---

### Tömbök

- Tömböt érték szerint **nem lehet** átadni
- Tömb mutatóként viselkedik

---

## 📈 10. Típuskonstrukciók (283–289. dia)

### Felsorolási típus

```c
enum color { RED, GREEN, BLUE };
```

---

### Tömbök

```c
int a[10];
int b[][3] = { {1,2,3}, {4,5,6} };
```

---

### Mutatók

```c
int *p = &x;
*p = 10;
```

---

### Makrók

```c
#define SQURE(x) x*x;

int main() {
	printf("%d\n", SQURE(5)); 
}
```

This will be translated while compiling so the code will actually look like this

```c
#define SQURE(x) x*x;

int main() {
	printf("%d\n", 5*5);
}
```

This saves runtime function running

## 🧩 11. Statikus Programstruktúra (248–263. dia)

### Fordítási egység

- `.c` → `.o` → futtatható

---

### Példa

```bash
gcc -c factorial.c
gcc -c main.c
gcc -o program factorial.o main.o
./program

```

---

### Include guard

```c
#ifndef HEADER_H
#define HEADER_H
// tartalom
#endif
```

---

## ✅ 12. Ajánlott Fordítási Kapcsolók

```bash
gcc -ansi -Wall -W -pedantic -o program file.c
```

---

## ⚠️ 13. Gyakori Hibák

- **Nem inicializált változók**
- **Túlindexelés**
- **Memóriaszivárgás**
- **Érvénytelen mutató használata**

---

## 🧰 14. Hasznos Függvények

| Függvény | Leírás |
| --- | --- |
| `malloc()` | memória foglalás |
| `free()` | memória felszabadítás |
| `printf()` | kiírás |
| `scanf()` | beolvasás |
| `strlen()` | sztring hossza |
| `strcpy()` | sztring másolás |
| `sizeof()` | típus mérete |

---

> 💡 Tipp: Mindig használj -Wall -Wextra kapcsolókat a fordításkál, hogy elkerüld a rejtett hibákat!
> 

---
