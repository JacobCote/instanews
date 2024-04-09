#!/bin/bash
# Get the title of a web page
grep -o '.\{0,0\}Titre":".\{0,100\}' ./data/nouvelle_$1 
