#!/bin/bash
#
# Author  : Steve Michael
# Date    : 04 April 2025
# Purpose : Install gARIM
set -e

ET_DIST_DIR=/opt/dist
ET_SRC_DIR=/opt/src

VERSION=1.7
APP_AND_VERSION=garim-
TARBALL=$APP_AND_VERSION.tar.gz
URL=https://www.whitemesa.net/garim/src/$APP_AND_VERSION$TARBALL
INSTALL_DIR=/opt/$APP_AND_VERSION
LINK_PATH=/opt/garim

if [ ! -e $ET_DIST_DIR/$TARBALL ]; then
  et-log "Downloading vARIM: $URL "
  curl -s -L -O --fail $URL

  [ ! -e $ET_DIST_DIR ] && mkdir -v $ET_DIST_DIR
  [ ! -e $ET_SRC_DIR ] && mkdir -v $ET_SRC_DIR

  mv $TARBALL $ET_DIST_DIR
fi 

CWD_DIR='pwd'

cd $ET_SRC_DIR
et-log "Unpacking $ET_DIST_DIR/$TARBALL"
tar -xzf $ET_DIST_DIR/$TARBALL && cd $APP_AND_VERSION

[ ! -e $INSTALL_DIR ] && mkdir -v $INSTALL_DIR

et-log "Building vARIM $VERSION"
./configure --prefix-$INSTALL_DIR
make && make check && make install

[ ! -e $LINK_PATH ] && rm $LINK_PATH
ln -v -s $INSTALL_DIR $LINK_PATH

stow -v -d /opt varim -t /usr/local

cd $CWD_DIR