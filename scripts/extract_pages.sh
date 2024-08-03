#!/bin/bash

# Check if qpdf is installed
if ! command -v qpdf &> /dev/null
then
    echo "qpdf could not be found, please install it first."
    exit 1
fi

# Check if the correct number of arguments are provided
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <start_page> <end_page> <input_pdf> <output_pdf>"
    exit 1
fi

# Assign parameters to variables
START_PAGE=$1
END_PAGE=$2
INPUT_PDF=$3
OUTPUT_PDF=$4

# Check if the input PDF file exists
if [[ ! -f "$INPUT_PDF" ]]; then
    echo "Input PDF file not found: $INPUT_PDF"
    exit 1
fi

# Extract the specified pages and create the output PDF
qpdf --empty --pages "$INPUT_PDF" "$START_PAGE-$END_PAGE" -- "$OUTPUT_PDF"

# Check if the output file was created successfully
if [[ -f "$OUTPUT_PDF" ]]; then
    echo "Successfully created: $OUTPUT_PDF"
else
    echo "Failed to create: $OUTPUT_PDF"
    exit 1
fi

