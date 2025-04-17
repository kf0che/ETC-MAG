#!/bin/bash

# Script to install Winlink on Linux Mint using Wine

# Check if Wine is installed
if ! command -v wine &> /dev/null; then
    echo "Wine is not installed. Installing Wine..."
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install -y wine64 wine32
fi

# Download Winlink Express installer
WINLINK_INSTALLER="Winlink_Express_install.exe"
if [ ! -f "$WINLINK_INSTALLER" ]; then
    echo "Downloading Winlink Express installer..."
    wget -O "$WINLINK_INSTALLER" "https://downloads.winlink.org/User%20Programs/Winlink_Express_install.exe"
fi

# Run the installer with Wine
echo "Running Winlink Express installer..."
wine "$WINLINK_INSTALLER"

# Notify user of completion
echo "Winlink Express installation completed. Run it using: WINEPREFIX=$WINEPREFIX wine ~/.wine-winlink/drive_c/Program\ Files\ \(x86\)/Winlink\ Express/Winlink.exe"