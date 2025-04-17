#!/bin/bash

# Script to install Syncthing on Linux Mint

set -e

echo "Updating package list..."
sudo apt update

echo "Installing prerequisites..."
sudo apt install -y curl apt-transport-https gnupg

echo "Adding Syncthing's official GPG key..."
curl -s https://syncthing.net/release-key.txt | sudo gpg --dearmor -o /usr/share/keyrings/syncthing-archive-keyring.gpg

echo "Adding Syncthing's repository..."
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

echo "Updating package list again..."
sudo apt update

echo "Installing Syncthing..."
sudo apt install -y syncthing

echo "Installation complete. You can start Syncthing by running 'syncthing' in the terminal."