#!/bin/bash
#
# Author  : Steve Michael
# Date    : 17 April 2025
# Purpose : Install development tools
set -e

log "Installing dev tools for fldigi..."
apt install \
  autoconf \
  dialog \
  gettext \
  libfltk1.3-dev \
  libportaudio2 \
  libsamplerate0-dev \
  libsndfile1-dev \
  libudev-dev \
  pkg-config \
  portaudio19-dev \
  -y

log "Installing dev tools for building EmComm Tools packages and general development..."
apt install \
  git \
  libfuse2 \
  meld \
  rpm \
  vim \
  -y

log "Installing tools for building custom ISO image..."
if ! command -v cubic
then
  sudo apt-add-repository universe -y
  sudo apt-add-repository ppa:cubic-wizard/release -y
  sudo apt update
  sudo apt install --no-install-recommends cubic -y
fi