#!/bin/bash

APP=qttermtcp
VERSION=latest
DOWNLOAD_FILE=QtTermSource.zip
BIN_FILE=QtTermTCP
INSTALL_DIR="/opt/${APP}-${VERSION}"
INSTALL_BIN_DIR="${INSTALL_DIR}/bin"
LINK_PATH="/opt/${APP}"

log "Enabling i386 architecture support.."
dpkg --add-architecture i386
apt update

log "Installing QtTermTCP 32-bit build dependencies..."
apt install \
  qtbase5-dev:i386 \
  qtbase5-dev-tools:i386 \
  qt5-qmake:i386 \
  qtchooser:i386 \
  qtmultimedia5-dev:i386 \
  libqt5serialport5-dev:i386 \
  libfftw3-dev:i386 \
  qttools5-dev-tools:i386 \
  -y

log "Installing QtTermTCP build dependencies..."
apt install \
  qtbase5-dev \
  qtbase5-dev-tools \
  qt5-qmake \
  qtchooser \
  qtmultimedia5-dev \
  libqt5serialport5-dev \
  libfftw3-dev \
  qttools5-dev-tools \
  -y

if [ ! -e ${DIST_DIR}/${DOWNLOAD_FILE} ]; then

  URL=http://www.cantab.net/users/john.wiseman/Downloads/${DOWNLOAD_FILE}

  log "Downloading QtTermTCP: ${URL}"
  curl -s -L -o ${DOWNLOAD_FILE} --fail ${URL}

  mv -v ${DOWNLOAD_FILE} ${DIST_DIR}
fi

CWD_DIR=`pwd`

# Only build once
if [ ! -e "${SRC_DIR}/${APP}/${BIN_FILE}" ]; then
  cd ${SRC_DIR}
  mkdir -v ${APP} && cd ${APP}
  unzip ${DIST_DIR}/${DOWNLOAD_FILE}

  log "Building QtTermTCP.."
  qmake && make
fi

[ ! -e ${INSTALL_BIN_DIR} ] && mkdir -v -p ${INSTALL_BIN_DIR}
cp -v "${SRC_DIR}/${APP}/${BIN_FILE}" ${INSTALL_BIN_DIR}

[ -e ${LINK_PATH} ] && rm ${LINK_PATH}
ln -s ${INSTALL_DIR} ${LINK_PATH}

stow -v -d /opt ${APP} -t /usr/local

cd $CWD_DIR