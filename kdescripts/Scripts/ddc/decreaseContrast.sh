#!/bin/bash

# Decrease contrast by 10 steps
contrast_step=10

# Get the current contrast level
current_contrast=$(ddcutil getvcp 12 | grep -oP 'current: \K[0-9]+')

# Calculate the new contrast level
new_contrast=$((current_contrast - contrast_step))

# Ensure the new contrast level does not go below the minimum (0)
if [ "$new_contrast" -lt 0 ]; then
    new_contrast=0
fi

# Set the new contrast level
ddcutil setvcp 12 "$new_contrast"

