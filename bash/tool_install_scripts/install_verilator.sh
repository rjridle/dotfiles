#!/bin/bash

RUN_DIR=`pwd`
VERILATOR_DIR=${HOME}/Util/verilator

if [ "$(id -u)" -ne 0 ]; then
	echo '[ERROR] Script must be ran with sudo privaleges'
	exit 1
fi

if [ ! -d ${VERILATOR_DIR} ]; then
    echo "[ERROR] Directory not found: ${VERILATOR_DIR}"
    echo "[ABORT] $0"
    exit 1
fi


echo "[INFO] Verilator repo found. Starting install..."
cd ${VERILATOR_DIR}
git pull
git checkout stable
autoconf
./configure --prefix=/opt/verilator
make
make install
