#!/bin/bash

# Use fzf to select one or more files
selected_files=$(fzf --multi)

# Check if any file was selected
if [ -z "$selected_files" ]; then
  echo "No file selected. Exiting..."
  exit 1
fi

# Loop through the selected files
for file in $selected_files; do
  # Extract the base name without the extension
  base_name="${file%.*}"

  # Define the output file name
  output_file="${base_name}.mp4"

  # Convert the file using ffmpeg
  # ffmpeg -i "$file" -c copy "$output_file"
  ffmpeg -i "$file" "$output_file"

  # Check if the conversion was successful
  if [ $? -eq 0 ]; then
    notify-send "Converted $file to $output_file successfully."
  else
    notify-send "Failed to convert $file. Skipping..."
  fi
done
