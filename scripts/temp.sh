#!/bin/bash
#
temp=$(sensors | awk '/Core 0/ {print $3}')
PREFIX=' '

echo $temp | awk -F'+' '{print $2}'

