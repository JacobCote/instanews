## get data 
curl -o test https://ici.radio-canada.ca/saguenay-lac-saint-jean/en-continu         

## extract into file
grep -o ".\{0,10\}sc-18ic2jw-0 kwzGTv.\{0,100\}" ./test | awk -F ' tabindex'  '{print $1}' | awk -F 'href='  '{print $2}' > cleaned.txt
