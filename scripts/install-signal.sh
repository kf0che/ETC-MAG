#!/bin/bash

# Update package list and install dependencies
sudo apt update
sudo apt install -y wget gpg

# Add Signal's official GPG key
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# Add Signal's repository to the sources list
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main" | sudo tee /etc/apt/sources.list.d/signal-desktop.list

# Update package list again and install Signal
sudo apt update
sudo apt install -y signal-desktop

echo "Signal installation completed."