#!/bin/bash

# Script to install Kiwix and download Wikipedia for offline use on Linux Mint

set -e

# Update package list and install dependencies
echo "Updating package list and installing dependencies..."
sudo apt update
sudo apt install -y wget unzip

# Download and install Kiwix
echo "Downloading and installing Kiwix..."
KIWIX_URL="https://download.kiwix.org/release/kiwix-desktop/kiwix-desktop-linux-x86_64.tar.gz"
KIWIX_DIR="$HOME/kiwix"
mkdir -p "$KIWIX_DIR"
wget -O "$KIWIX_DIR/kiwix-desktop.tar.gz" "$KIWIX_URL"
tar -xzf "$KIWIX_DIR/kiwix-desktop.tar.gz" -C "$KIWIX_DIR"
rm "$KIWIX_DIR/kiwix-desktop.tar.gz"

# Add Kiwix to PATH
echo "Adding Kiwix to PATH..."
echo "export PATH=\$PATH:$KIWIX_DIR/kiwix-desktop" >> "$HOME/.bashrc"
source "$HOME/.bashrc"

# Download Wikipedia ZIM file
echo "Downloading Wikipedia ZIM file (this may take a while)..."
ZIM_URL="https://download.kiwix.org/zim/wikipedia_en_all_nopic.zim"
ZIM_DIR="$HOME/kiwix/zim"
mkdir -p "$ZIM_DIR"
wget -O "$ZIM_DIR/wikipedia_en_all_nopic.zim" "$ZIM_URL"

# Installation complete
echo "Installation complete. You can now run Kiwix from the terminal and open the Wikipedia ZIM file."