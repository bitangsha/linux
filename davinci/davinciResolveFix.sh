#!/bin/bash

# Run the command and capture the output
output=$(__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json /opt/resolve/bin/resolve 2>&1)

# Check for the first error
if echo "$output" | grep -q "error: /usr/lib/libpango"; then
    echo "Error detected: /usr/lib/libpango"

    # Remove the specified files
    rm -f /opt/resolve/libs/libglib-2.0.so
    rm -f /opt/resolve/libs/libglib-2.0.so.0
    rm -f /opt/resolve/libs/libglib-2.0.so.0.6800.4

    echo "Removed specified files."
fi

# Check for the second error
if echo "$output" | grep -q "error: /usr/lib/libgdk_pixbuf"; then
    echo "Error detected: /usr/lib/libgdk_pixbuf"

    # Copy the specified files to the destination
    cp ./libs/libgdk_pixbuf-2.0.so.0 /opt/resolve/libs/
    cp ./libs/libgdk_pixbuf-2.0.so.0.4200.6 /opt/resolve/libs/

    echo "Copied libgdk_pixbuf files to /opt/resolve/libs."
fi

# Check for the second error
if echo "$output" | grep -q "error while loading shared libraries: libjpeg.so.62"; then
    echo "Error detected: error while loading shared libraries: libjpeg.so.62"

    # Copy the specified files to the destination
    cp ./libs/libjpeg.so.62 /opt/resolve/libs/
    cp ./libs/libjpeg.so.62.4.0 /opt/resolve/libs/

    echo "Copied libjpeg files to /opt/resolve/libs."
fi


# Output if no relevant errors were detected
if ! echo "$output" | grep -q "error: /usr/lib/libpango\|error: /usr/lib/libgdk_pixbuf|error while loading shared libraries: libjpeg.so.62"; then
    echo "No relevant errors detected."
fi
