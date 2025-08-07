#!/bin/bash
pacman=$(aur-check-updates | wc -l)
echo "$pacman pkgs" 
