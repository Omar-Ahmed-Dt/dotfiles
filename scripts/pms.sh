#!/usr/bin/env bash
case $1 in
    install)
    pacman -Slq | fzf --multi --preview 'pacman -Si {1}' 
    ;;
    remove)
    pacman -Qq | fzf --multi --preview 'pacman -Qi {1}'
    ;;
esac

