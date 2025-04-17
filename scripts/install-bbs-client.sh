#!/bin/bash


VERSION=1.1.0
DOWNLOAD_FILE=paracon_${VERSION}.pyz

BIN_FILE=paracon
INSTALL_DIR=/opt/paracon-${VERSION}
INSTALL_BIN_DIR="${INSTALL_DIR}/bin"
LINK_PATH=/opt/paracon

log "Installing BBS client dependencies..."
apt install \
  python3 \
  -y

log "Installing BBS client..."

if [ ! -e ${INSTALL_BIN_DIR} ]; then
   log "Creating Paracon install directory: ${INSTALL_BIN_DIR}"
   mkdir -v -p ${INSTALL_BIN_DIR}
fi

if [ ! -e ${INSTALL_BIN_DIR}/${BIN_FILE} ]; then
  URL="https://github.com/mfncooper/paracon/releases/download/v${VERSION}/${DOWNLOAD_FILE}"

  log "Downloading Paracon: ${URL}"
  curl -s -L -o ${BIN_FILE} --fail ${URL}
  
  mv -v ${BIN_FILE} ${INSTALL_BIN_DIR}
fi

chmod 755 ${INSTALL_BIN_DIR}/${BIN_FILE}

[ -e ${LINK_PATH} ] && rm ${LINK_PATH}
ln -s ${INSTALL_DIR} ${LINK_PATH}

stow -v -d /opt paracon -t /usr/local