#!/bin/bash

# Script to install Pat Menu on Linux Mint

# Update and upgrade the system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install required dependencies
echo "Installing dependencies..."
sudo apt install -y git curl wget build-essential libssl-dev libncurses5-dev zlib1g-dev

# Clone the Pat Menu repository
echo "Cloning Pat Menu repository..."
git clone https://github.com/la5nta/patmenu.git ~/patmenu

# Navigate to the Pat Menu directory
cd ~/patmenu

# Build Pat Menu
echo "Building Pat Menu..."
make

# Install Pat Menu
echo "Installing Pat Menu..."
sudo make install

# Verify installation
echo "Verifying installation..."
if command -v patmenu &> /dev/null; then
    echo "Pat Menu installed successfully!"
else
    echo "Pat Menu installation failed."
fi