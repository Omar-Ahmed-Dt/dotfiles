#!/bin/bash

# mapping caps to escape 
# setxkbmap -option caps:escape
# mapping escape to caps 
# setxkbmap -option caps:swapescape
#
export DISPLAY=:0
export XAUTHORITY=/home/omar/.Xauthority

setxkbmap -option caps:escape
