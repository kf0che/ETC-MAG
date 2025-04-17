#!/bin/bash

# Script to install QSSTV on Linux Mint

set -e

echo "Updating package list..."
sudo apt update

echo "Installing dependencies..."
sudo apt install -y build-essential cmake qt5-default qttools5-dev-tools libfftw3-dev \
libpulse-dev libasound2-dev libv4l-dev libjpeg-dev libx11-dev git

echo "Cloning QSSTV repository..."
git clone https://github.com/dl4mea/Qt-Digital-ATV.git ~/qsstv-source

echo "Building QSSTV..."
cd ~/qsstv-source
mkdir build
cd build
cmake ..
make -j$(nproc)

echo "Installing QSSTV..."
sudo make install

echo "QSSTV installation completed!"