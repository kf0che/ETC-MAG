#!/bin/bash

# Script to install the FLDigi suite on Linux Mint

set -e

echo "Updating package list..."
sudo apt update

# Check if the user wants to install the FLDigi suite
read -p "Do you want to install the FLDigi suite? (y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Installing FLDigi suite..."
    sudo apt install -y fldigi flrig flmsg flamp
    echo "FLDigi suite installed successfully."
else
    echo "Skipping FLDigi suite installation."
fi