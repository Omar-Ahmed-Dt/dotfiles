#!/bin/bash

# Set the input to the headset microphone
input=$(pactl list sources short | grep input | grep -v aloop | awk  '{print $1}')
pactl set-source-port $input analog-input-headset-mic 

# Set the output to the headphones
output=$(pactl list sources short | grep output | grep -v aloop | awk '{print $1}')
pactl set-sink-port $output analog-output-headphones
