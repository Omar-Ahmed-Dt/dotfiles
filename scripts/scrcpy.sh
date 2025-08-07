#!/usr/bin/env bash
#
#
adb tcpip 5555
adb connect $1:5555
scrcpy -e 
# scrcpy --bit-rate 2M --max-size 1024
