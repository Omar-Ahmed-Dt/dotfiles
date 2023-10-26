#!/bin/bash

# take all the cache and remove useless packages
sudo pacman -Sc
sudo pacman -Scc
paccache -r
sudo pacman -Qtdq | sudo pacman -Rns -

# list cache 
# sudo du -sh ~/.cache/
# rm -rf ~/.cache/*
