#!/bin/bash

# Replace with your remote machine's details
remote_user="ubuntu"
remote_host="192.168.1.120"

# Maximum number of attempts
max_attempts=10

# SSH options
ssh_options="-o ConnectTimeout=5"

# Attempt SSH connection
for ((i=1; i<=max_attempts; i++)); do
    echo "Attempting SSH connection (Attempt $i)..."
    ssh $ssh_options "$remote_user@$remote_host" "echo 'SSH successful'"
    
    # Check the exit status of the last command
    if [ $? -eq 0 ]; then
        echo "SSH connection successful."
        break
    fi

    # If the attempt failed, wait for 1 second before the next attempt
    sleep 1
done

ssh US2



# Check if all attempts failed
# if [ $? -ne 0 ]; then
#     echo "All attempts failed. Exiting script."
# fi

