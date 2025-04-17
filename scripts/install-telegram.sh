#!/bin/bash

# Script to install Telegram on Linux Mint

# Update package list
sudo apt update

# Install Telegram Desktop
sudo apt install -y telegram-desktop

# Confirm installation
if command -v telegram-desktop &> /dev/null; then
    echo "Telegram has been successfully installed."
else
    echo "Failed to install Telegram."
fi