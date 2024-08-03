#!/bin/bash

# Use fzf to select a file
selected_file=$(fzf --multi)

# Check if a file was selected
if [ -z "$selected_file" ]; then
  echo "No file selected. Exiting..."
  exit 1
fi

# If a file was selected, proceed with the script
# echo "Selected file: $selected_file"
ripdrag ${selected_file} 2> /dev/null

# Replace the following line with the desired operation, e.g., ripdrag
# ripdrag "$selected_file"

