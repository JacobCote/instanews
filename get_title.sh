#!/bin/bash
# Get the title of a web page
grep -o '.\{0,0\}Titre":".\{0,100\}' ./data/nouvelle_$1 | head -1 | awk -F '"' '{print $3}' > data/title/$1.txt

## clean files 

## intro 
grep 'Description content=' test |sed 's/<em>/ /g' | sed 's/</<\n/g' | grep 'Description content=' | sed 's/><//g' | awk -F 'scription content=' '{print $2}' > data/cleaned_files/temp_$1.txt
## core 
grep 'sc-jbo7hw-4 gPWroG' ./data/nouvelle_$1 |sed 's/<em>/ /g' | sed 's/</<\n/g' | grep 'sc-jbo7hw-4 gPWroG' | awk -F 'sc-jbo7hw-4 gPWroG' '{print $2}' | sed 's/"><//g' >> data/cleaned_files/temp_$1.txt

sed 's/"Suivez l’actualité du Saguenay–Lac-Saint-Jean sur le web : nouvelles, sports, arts, météo, services, émissions, audio et vidéo."//g' data/cleaned_files/temp_$1.txt  > data/cleaned_files/$1.txt
rm data/cleaned_files/temp_$1.txt