#!/bin/bash

# Script to install PAT Winlink on Linux Mint

set -e

echo "Updating package list..."
sudo apt update

echo "Installing dependencies..."
sudo apt install -y curl git build-essential golang

echo "Setting up Go environment..."
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if ! grep -q "export GOPATH=$HOME/go" ~/.bashrc; then
    echo "export GOPATH=$HOME/go" >> ~/.bashrc
    echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
fi

echo "Cloning PAT repository..."
git clone https://github.com/la5nta/pat.git $GOPATH/src/github.com/la5nta/pat

echo "Building PAT..."
cd $GOPATH/src/github.com/la5nta/pat
go build

echo "Installing PAT..."
sudo cp pat /usr/local/bin/

echo "Creating configuration directory..."
mkdir -p ~/.wl2k

echo "Installation complete. Run 'pat --help' to get started."