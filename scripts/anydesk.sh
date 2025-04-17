#!/bin/bash

# Script to install AnyDesk on Linux Mint

# Update package list
sudo apt update

# Add AnyDesk GPG key
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -

# Add AnyDesk repository
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk.list

# Update package list again
sudo apt update

# Install AnyDesk
sudo apt install -y anydesk

# Confirm installation
echo "AnyDesk installation completed."