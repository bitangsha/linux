#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 file1 [file2 ... fileN]"
    exit 1
}

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    usage
fi

# Get the current date and time
CURRENT_DATETIME=$(date +"%Y%m%d_%H%M%S")

# Set the output zip file name
OUTPUT_ZIP="compressed_${CURRENT_DATETIME}.zip"

# Prompt the user for the password
read -sp "Enter the password: " PASSWORD
echo
read -sp "Confirm the password: " PASSWORD_CONFIRM
echo

# Check if the passwords match
if [ "$PASSWORD" != "$PASSWORD_CONFIRM" ]; then
    echo "Passwords do not match. Please try again."
    exit 1
fi

# Create the zip file with password protection
zip -r -j --password "$PASSWORD" "$OUTPUT_ZIP" "$@"

# Check if the zip command was successful
if [ $? -eq 0 ]; then
    echo "Files and folders have been encrypted and compressed into $OUTPUT_ZIP"
else
    echo "An error occurred while creating the zip file."
fi
