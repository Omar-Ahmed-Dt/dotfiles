#!/bin/bash 
pacman=$(checkupdates | wc -l)
aur=$(yay -Qum | wc -l)
#echo  $(checkupdates | wc -l) pks 

echo $pacman-$aur pks 


