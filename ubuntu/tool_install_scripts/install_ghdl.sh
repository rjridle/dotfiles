#!/bin/bash

RUN_DIR=`pwd`
TOOL=ghdl
TOOL_DIR=${HOME}/Util/${TOOL}
INSTALL_PATH=/opt/${TOOL}

if [ "$(id -u)" -eq 0 ]; then
	echo '[ERROR] Script must be ran without sudo privaleges'
	exit 1
fi

if [ ! -d ${TOOL_DIR} ]; then
    echo "[ERROR] Directory not found: ${TOOL_DIR}"
    echo "[ABORT] $0"
    exit 1
fi


echo "[INFO] ${TOOL_DIR} found. Starting install..."
cd ${TOOL_DIR}
sudo ./configure --prefix=/opt/${TOOL}
sudo make
sudo make install
