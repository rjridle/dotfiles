#!/bin/bash

RUN_DIR=`pwd`
TOOL=iverilog
INSTALL_PATH=/opt/${TOOL}

echo "${TOOL_DIR_PATH}"


if [ "$(id -u)" -eq 0 ]; then
    "[ERROR] Run without sudo priveleges"
	exit 1
fi

TOOL_DIR_PATH=${HOME}/Util/${TOOL}

if [ ! -d ${TOOL_DIR_PATH} ]; then
    echo "[ERROR] Directory not found: ${TOOL_DIR_PATH}"
    echo "[ABORT] $0"
    exit 1
fi

echo "[INFO] ${TOOL_DIR_PATH} found. Install ${TOOL} to ${INSTALL_PATH}"

cd ${TOOL_DIR_PATH}
sudo sh autoconf.sh
sudo ./configure --prefix=${INSTALL_PATH}
sudo make
sudo make install
echo "[INFO] ${TOOL} installed to ${INSTALL_PATH}"
