#!/bin/bash

# auto.sh - Megállásk számolása
# Használat: ./auto.sh adatfájl.csv

if [ $# -eq 0 ]; then
    echo "Használat: $0 <adatfájl>"
    exit 1
fi

adatfajl="$1"

if [ ! -f "$adatfajl" ]; then
    echo "Hiba: $adatfajl nem található!"
    exit 1
fi

megallasok=0
elozo_ido=""

while IFS=',' read -r ido sebesseg elol hatulrol; do
    if [ -n "$elozo_ido" ]; then
        # Időformátum: 2024.03.15 10:30:15:01
        # Átalakítjuk timestamp-re összehasonlításhoz

        elozo_sec=$(echo "$elozo_ido" | awk -F'[ .:]+' '{print ($1-1970)*31536000 + ($2-1)*2592000 + ($3-1)*86400 + $4*3600 + $5*60 + $6 + $7/100}')
        jelenlegi_sec=$(echo "$ido" | awk -F'[ .:]+' '{print ($1-1970)*31536000 + ($2-1)*2592000 + ($3-1)*86400 + $4*3600 + $5*60 + $6 + $7/100}')

        kulonbseg=$(echo "$jelenlegi_sec - $elozo_sec" | bc)

        # Ha több mint 60 másodperc különbség van
        if (( $(echo "$kulonbseg > 60" | bc -l) )); then
            ((megallasok++))
        fi
    fi
    elozo_ido="$ido"
done < "$adatfajl"

echo "Az autó összesen $megallasok alkalommal állt meg."
