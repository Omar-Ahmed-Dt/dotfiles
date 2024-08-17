#!/bin/bash
output_file="ffmpeg/$(date +"%Y%m%d_%H%M%S").gif"
gifcast -o "/home/omar/$output_file"
echo "GIF saved at ./$output_file"
