#!/bin/bash

# fekez.sh - Fékezési helyzetek keresése
# Használat: ./fekez.sh <kritikus_tavolsag> [adatfájl]

if [ $# -eq 0 ]; then
    echo "Használat: $0 <kritikus_távolság_méter> [adatfájl]"
    echo "Példa: $0 100 adat.csv"
    exit 1
fi

kritikus_tavolsag=$1
adatfajl=${2:-"adat.csv"}

if [ ! -f "$adatfajl" ]; then
    echo "Hiba: $adatfajl nem található!"
    exit 1
fi

echo "Fékezési helyzetek (előtte lévő távolság < $kritikus_tavolsag méter):"
echo "=================================================="

fekezesek=0

while IFS=',' read -r ido sebesseg elol hatulrol; do
    # Ellenőrizzük, hogy az előtti távolság kisebb-e a kritikus értéknél
    if (( $(echo "$elol < $kritikus_tavolsag" | bc -l) )); then
        echo "$ido - Sebesség: ${sebesseg} km/h, Távolság elöl: ${elol}m, Távolság hátul: ${hatulrol}m"
        ((fekezesek++))
    fi
done < "$adatfajl"

echo "=================================================="
echo "Összesen $fekezesek fékezési helyzetben volt az autó."
