#!/bin/bash

# Script to install AX.25 tools and dependencies on Linux Mint

set -e

echo "Updating package list..."
sudo apt update

echo "Installing AX.25 tools and dependencies..."
sudo apt install -y ax25-tools ax25-apps libax25-dev

echo "AX.25 installation completed successfully."