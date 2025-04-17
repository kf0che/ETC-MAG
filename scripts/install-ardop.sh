#!/bin/bash

# Script to install ARDOP on Linux Mint

set -e

echo "Updating package list..."
sudo apt update

echo "Installing dependencies..."
sudo apt install -y build-essential git libasound2-dev libudev-dev

echo "Cloning ARDOP repository..."
git clone https://github.com/LA3QMA/ardopc.git ~/ardopc

echo "Building ARDOP..."
cd ~/ardopc
make

echo "Installing ARDOP..."
sudo make install

echo "Cleaning up..."
cd ~
rm -rf ~/ardopc

echo "ARDOP installation completed successfully!"