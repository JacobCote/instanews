import pandas as pd
import os
import requests

site = 'https://ici.radio-canada.ca'
href = pd.read_csv('cleaned.txt', header=None)
## create file names
names = [site + i[0] for i in href.values]


## split on / and get the last element
number = [i.split('/')[-2] for i in names]

for i in range(5):
    print(i)
    os.system(f"curl -o 'data/nouvelle_{number[i]}' {names[i]}" )
    
## extraire le titre de chaque page et le mettre dans un fichier data/title/number
for i in range(5):
    print(f"bash get_title.sh {number[i]}")
    os.system(f"bash get_title.sh {number[i]}")

