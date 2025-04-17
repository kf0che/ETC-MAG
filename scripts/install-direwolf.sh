#!/bin/bash

# Script to install Direwolf on Linux Mint

set -e

echo "Updating package list..."
sudo apt update

echo "Installing dependencies..."
sudo apt install -y build-essential cmake git libasound2-dev

echo "Cloning Direwolf repository..."
git clone https://www.github.com/wb2osz/direwolf.git
cd direwolf

echo "Checking out the latest stable release..."
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))

echo "Building Direwolf..."
mkdir build && cd build
cmake ..
make -j$(nproc)

echo "Installing Direwolf..."
sudo make install
sudo make install-conf

echo "Direwolf installation completed successfully."
echo "You can now configure Direwolf using the configuration file in your home directory."