#!/bin/bash

# Update package list and upgrade system
sudo apt update && sudo apt upgrade -y

# Install GPS-related dependencies
sudo apt install -y gpsd gpsd-clients python3-gps

# Enable and start the GPSD service
sudo systemctl enable gpsd
sudo systemctl start gpsd

# Verify GPSD installation
echo "Testing GPSD installation..."
gpsd -V

echo "Installation complete. You can test GPS functionality using the 'cgps' command."