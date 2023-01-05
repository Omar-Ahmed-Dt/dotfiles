#!/bin/bash 
pacman=$(echo  $(checkupdates-aur | wc -l) pks )
# aur_=echo  $(checkupdates-with-aur | wc -l) pks 

echo $pacman
