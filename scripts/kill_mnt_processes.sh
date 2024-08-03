#!/bin/bash

# Function to find and kill processes using /mnt
function check_and_kill_mnt_processes {
    echo "Finding processes using /mnt..."
    PROCESSES=$(lsof +D /mnt | awk 'NR>1 {print $2}')

    if [ -z "$PROCESSES" ]; then
        echo "No processes are using /mnt."
    else
        echo "The following processes are using /mnt:"
        echo "$PROCESSES"

        # Killing processes
        for PID in $PROCESSES; 
        do
            echo "Killing process ID: $PID"
            sudo kill -9 $PID
        done
    fi
}

# Execute the function
check_and_kill_mnt_processes
