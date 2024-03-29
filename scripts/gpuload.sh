#!/bin/bash

load=$(nvidia-settings -q all | grep -m1 'UsedDedicatedGPUMemory' | awk -F: '{print $4}' | awk '{print ($0+0)}')

utilize=$(nvidia-smi --format=nounits,csv,noheader --query-gpu=utilization.gpu | xargs echo)
echo $utilize% / $load MB
