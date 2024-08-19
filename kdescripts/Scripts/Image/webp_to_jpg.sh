#!/bin/bash
# Check if a file was provided as an argument
if [ -z "$1" ]; then
  echo "Error: No file provided."
  exit 1
fi
# Store the filename from the command line argument
filename="$1"
# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "Error: File '$filename' does not exist."
  exit 1
fi
outFileName="$filename"_CONVERTED.jpg
convert "$filename" "$outFileName"
