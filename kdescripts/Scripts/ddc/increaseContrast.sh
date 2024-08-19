#!/bin/bash

# Increase contrast by 10 steps
contrast_step=10

# Get the current contrast level
current_contrast=$(ddcutil getvcp 12 | grep -oP 'current: \K[0-9]+')

# Calculate the new contrast level
new_contrast=$((current_contrast + contrast_step))

# Ensure the new contrast level does not exceed the maximum (255)
if [ "$new_contrast" -gt 255 ]; then
    new_contrast=255
fi

# Set the new contrast level
ddcutil setvcp 12 "$new_contrast"

