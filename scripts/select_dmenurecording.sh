#!/bin/bash

if [ -f /tmp/recordingpid ]; then
    ~/scripts/dmenurecording.sh kill 
else 
    ~/scripts/dmenurecording.sh
fi 

