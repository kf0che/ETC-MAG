#!/usr/bin/env bash
#
# Author  : Steve Michael
# Date    : 04 April 2025
# Purpose : Install ETC then additional ham radio tools
# 


SCRIPT_PATH="$(readlink -f $0)"
SCRIPTS_DIR="$(dirname ${SCRIPT_PATH})"
export ET_OS_ADDONS_BASE="${SCRIPTS_DIR}/.."
ET_SCRIPTS_DIR="${ET_OS_ADDONS_BASE}/emcomm-tools-os-community/scripts"

. ${ET_SCRIPTS_DIR}/env.sh
. ${ET_SCRIPTS_DIR}/functions.sh

# Must run as user root
exitIfNotRoot

# First install emcomm-tools-os-community
cd ${ET_SCRIPTS_DIR} && ./install.sh

cd ${SCRIPTS_DIR}

# Install WSJT-X-Improved
${SCRIPTS_DIR}/install-wsjtx-improved.sh

# Install ARIM Suite
${SCRIPTS_DIR}/install-arim.sh
${SCRIPTS_DIR}/install-garim.sh
${SCRIPTS_DIR}/install-varim.sh

# Install JS8Spotter
${SCRIPTS_DIR}/install-js8spotter.sh

# Install FL Suite

# Customize Gnome Desktop
${SCRIPTS_DIR}/customize-desktop.sh

# Install ET OS Addons command and support files
${SCRIPTS_DIR}/install-et-os-addons.sh
