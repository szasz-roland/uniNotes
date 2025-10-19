#!/bin/bash

# legkozelebb.sh - Legközelebbi távolság keresése
# Használat: ./legkozelebb.sh [adatfájl]

adatfajl=${1:-"adat.csv"}

if [ ! -f "$adatfajl" ]; then
    echo "Hiba: $adatfajl nem található!"
    exit 1
fi

legkisebb_tavolsag=""
legkisebb_sor=""
irany=""

while IFS=',' read -r ido sebesseg elol hatulrol; do
    # Megkeressük a kisebb távolságot az elöl és hátul közül
    if (( $(echo "$elol <= $hatulrol" | bc -l) )); then
        aktualis_tavolsag=$elol
        aktualis_irany="elöl"
    else
        aktualis_tavolsag=$hatulrol
        aktualis_irany="hátul"
    fi

    # Ha ez az első sor, vagy kisebb távolságot találtunk
    if [ -z "$legkisebb_tavolsag" ] || (( $(echo "$aktualis_tavolsag < $legkisebb_tavolsag" | bc -l) )); then
        legkisebb_tavolsag=$aktualis_tavolsag
        legkisebb_sor="$ido,$sebesseg,$elol,$hatulrol"
        irany=$aktualis_irany
    fi
done < "$adatfajl"

echo "Legközelebbi objektum:"
echo "====================="
echo "Időpont: $(echo $legkisebb_sor | cut -d',' -f1)"
echo "Sebesség: $(echo $legkisebb_sor | cut -d',' -f2) km/h"
echo "Távolság elöl: $(echo $legkisebb_sor | cut -d',' -f3) m"
echo "Távolság hátul: $(echo $legkisebb_sor | cut -d',' -f4) m"
echo "Legközelebbi irány: $irany"
echo "Legkisebb távolság: $legkisebb_tavolsag méter"
