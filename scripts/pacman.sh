#!/bin/bash
pacman=$(checkupdates | wc -l)
# aur=$(checkupdates-aur | wc -l)
# echo "$pacman - $aur pkgs" 
echo "$pacman pkgs" 
