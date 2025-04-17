#!/bin/bash

# Script to install YAAC (Yet Another APRS Client) on Linux Mint

# Update package list and install Java if not already installed
echo "Updating package list and installing Java..."
sudo apt update
sudo apt install -y openjdk-11-jre

# Define YAAC download URL and installation directory
YAAC_URL="https://www.ka2ddo.org/ka2ddo/YAAC.zip"
INSTALL_DIR="$HOME/YAAC"

# Download and extract YAAC
echo "Downloading and installing YAAC..."
mkdir -p "$INSTALL_DIR"
wget -O /tmp/YAAC.zip "$YAAC_URL"
unzip /tmp/YAAC.zip -d "$INSTALL_DIR"

# Clean up
rm /tmp/YAAC.zip

# Create a desktop shortcut
echo "Creating desktop shortcut..."
cat <<EOF > "$HOME/Desktop/YAAC.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=YAAC
Exec=java -jar $INSTALL_DIR/YAAC.jar
Icon=$INSTALL_DIR/YAAC.png
Terminal=false
EOF

chmod +x "$HOME/Desktop/YAAC.desktop"

echo "YAAC installation completed. You can launch it from the desktop shortcut."