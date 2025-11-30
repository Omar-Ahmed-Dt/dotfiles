#!/bin/bash

# Exit on any error
set -e

# Check if a file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filename.tex>"
  exit 1
fi

# Get the filename without extension
FILE="$1"

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' not found!"
  exit 1
fi

# Compile the LaTeX file to PDF
echo "🛠️  Building PDF from $FILE..."
latexmk -pdf "$FILE"

# Clean up auxiliary files
echo "🧹  Cleaning up temporary files..."
latexmk -c

echo "✅  Done! PDF generated successfully."

