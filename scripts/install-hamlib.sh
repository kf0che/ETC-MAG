#!/bin/bash

# Script to install Hamlib on Linux Mint

set -e

echo "Updating package list..."
sudo apt update

echo "Installing dependencies..."
sudo apt install -y build-essential cmake libtool libusb-1.0-0-dev libudev-dev pkg-config

echo "Downloading Hamlib source code..."
HAMLIB_VERSION="4.5"
wget https://github.com/Hamlib/Hamlib/releases/download/$HAMLIB_VERSION/hamlib-$HAMLIB_VERSION.tar.gz

echo "Extracting Hamlib source code..."
tar -xvzf hamlib-$HAMLIB_VERSION.tar.gz
cd hamlib-$HAMLIB_VERSION

echo "Building and installing Hamlib..."
./configure
make
sudo make install
sudo ldconfig

echo "Cleaning up..."
cd ..
rm -rf hamlib-$HAMLIB_VERSION hamlib-$HAMLIB_VERSION.tar.gz

echo "Hamlib installation completed successfully!"