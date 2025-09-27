#!/bin/bash
pacman=$(checkupdates | wc -l)
echo "$pacman updates"
