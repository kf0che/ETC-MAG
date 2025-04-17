#!/bin/bash

# Script to install VaraHF, VaraFM, and VaraC on Linux Mint using Wine

# Check if Wine is installed
if ! command -v wine &> /dev/null; then
    echo "Wine is not installed. Installing Wine..."
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install -y wine64 wine32
fi

# Create Wine prefix for Vara applications
WINEPREFIX="$HOME/.wine_vara"
mkdir -p "$WINEPREFIX"
export WINEPREFIX

# Install required Wine dependencies
winetricks -q dotnet48

# Download VaraHF, VaraFM, and VaraC installers
VARA_HF_URL="https://www.vara-software.com/download/varahf.exe"
VARA_FM_URL="https://www.vara-software.com/download/varafm.exe"
VARA_C_URL="https://www.vara-software.com/download/varac.exe"

wget -O /tmp/varahf.exe "$VARA_HF_URL"
wget -O /tmp/varafm.exe "$VARA_FM_URL"
wget -O /tmp/varac.exe "$VARA_C_URL"

# Install VaraHF
wine /tmp/varahf.exe

# Install VaraFM
wine /tmp/varafm.exe

# Install VaraC
wine /tmp/varac.exe

# Clean up
rm /tmp/varahf.exe /tmp/varafm.exe /tmp/varac.exe

echo "Installation of VaraHF, VaraFM, and VaraC completed."