#!/bin/bash

# Function to determine the Linux distribution
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        echo "$ID"
    elif [ -f /etc/debian_version ]; then
        echo "debian"
    elif [ -f /etc/redhat-release ]; then
        echo "fedora"
    else
        echo "unknown"
    fi
}

# Function to append alias to ~/.bashrc
append_alias() {
    local alias_name=$1
    local alias_value=$2
    local bashrc_file="$HOME/.bashrc"

    if ! grep -q "^alias $alias_name=" "$bashrc_file"; then
        echo "alias $alias_name='$alias_value'" >> "$bashrc_file"
        echo "Added alias $alias_name='$alias_value' to $bashrc_file"
    else
        echo "Alias $alias_name already exists in $bashrc_file"
    fi
}

# Detect the distribution and set the alias value
distro=$(detect_distro)

case "$distro" in
    arch)
        alias_value="sudo pacman -S --needed --noconfirm"
        ;;
    debian|ubuntu)
        alias_value="sudo apt install"
        ;;
    fedora)
        alias_value="sudo dnf install"
        ;;
    *)
        echo "Unsupported or unknown distribution: $distro"
        exit 1
        ;;
esac

# Append the aliases to ~/.bashrc
append_alias "ll" "ls -lart"
append_alias "ii" "$alias_value"
append_alias "brc" "nano ~/.bashrc"
append_alias "brcr" "source ~/.bashrc"
append_alias "xxx" "reboot"


# Notify user to reload ~/.bashrc
echo "Please run 'source ~/.bashrc' to apply the changes."
