2025. october 8


# 05-Gyakori programozási minta változatok
## Visszavezetési tábla
maxind,maxért ~ minind,-minért
f(i)          ~ -f(i)

e..u ellentetje -u..-e

## Legmelegebb vasárap feladat
    - IUgazábol egy for ciklus ami 7 esével lépked csak while -al (tesztelős)

# 06-mintamegoldás

## Gyoesabb vonat az előzőnél
```yaml
Be: n eleme N, menet eleme N[1..n] 
Ki: index eleme Z
Ef: 1<=n<=100 és minden i eleme [1...n]: (1<=menet[i]<=1000)
Uf: (van, index)=Keres(2..n, menet[i] > menet[i-1]) és ((nem van) -> int=-1)
```
(van, index)=Keres(e..u, T(i))

### Visszavezetési Tábla
van     ~   van
ind     ~   index
e..u    ~   2..n
T(i)    ~   menet[i] > menet[i-1]

### Tesztesetek
n: 3
menet: [1,2,3]
index: 2
van: true
---
n: 3
menet: [3,2,1]
index: 0 // ilyenkor elhanyagolható
van: false
---
n: 1
menet: [2]
index: -1
van: false

## _Beolvasás és feldolgozás külön van_ 
Struct helyett többD tömb magasságos feladat

