#!/bin/bash

# Increase brightness by 10 steps
brightness_step=10

# Get the current brightness level
current_brightness=$(ddcutil getvcp 10 | grep -oP 'current: \K[0-9]+')

# Calculate the new brightness level
new_brightness=$((current_brightness + brightness_step))

# Ensure the new brightness level does not exceed the maximum (255)
if [ "$new_brightness" -gt 255 ]; then
    new_brightness=255
fi

# Set the new brightness level
ddcutil setvcp 10 "$new_brightness"

