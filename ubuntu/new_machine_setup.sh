#!/bin/bash
RUN_DIR=`pwd`
UTIL_DIR=~/Util
GIT_USER=
GIT_EMAIL=

if [ "$(id -u)" -ne 0 ]; then
	echo 'Script must be ran with sudo privaleges'
	exit 1
fi

mkdir -p ${UTIL_DIR}

apt update && apt upgrade -y

# Install Git
apt-get install git -y

# Install Vim
apt-get install vim -y

# Install tcl/tk 
apt-get install tcl-dev
apt-get install tk-dev
apt-get install python-tk
apt-get install python3-tk

# Install python3
apt-get install python3 -y

# Install pip3
apt-get install python3-pip -y

# Install python packages
pip install numpy
pip install matplotlib


# Get the files for Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Clone dotfiles repo
cp ${RUN_DIR}/dotfiles/vim/.vimrc ~/.vimrc

# Install Vim plugins
vim "+:PlugInstall" "+:qall"

echo "[INFO] Installing tool dependencies"
# ModelSim dependencies
apt-get install libx

# Magic dependencies
apt-get install gcc -y #gcc
apt-get install csh -y #csh
apt-get install tcsh -y #tcsh
apt-get install tk8.6-dev -y #Tcl/Tk
apt-get install libqt5opengl5-dev -y #OpenGL

# Xschem dependencies
apt-get install gawk -y # Gawk
apt-get install libx11-dev -y # Xlib (auto installed)
apt-get install libxpm-dev -y # Xpm
apt-get install bison -y # Bison
apt-get install flex -y # Flex
apt-get install libcairo2-dev -y # Cairo
apt-get install libgtk-3-dev -y # Gaw waveform viewer
apt-get install build-essential -y # Gaw waveform viewer

# riscv-gnu-toolchain dependencies
apt-get install autoconf -y
apt-get install automake -y 
apt-get install autotools-dev -y 
apt-get install curl -y 
apt-get install python3 -y 
apt-get install libmpc-dev -y 
apt-get install libmpfr-dev -y 
apt-get install libgmp-dev -y 
apt-get install patchutils -y 
apt-get install bc -y 
apt-get install zlib1g-dev -y 
apt-get install libexpat-dev -y

# Verilator dependencies
apt-get install git perl python3 make autoconf g++ flex bison ccache -y
apt-get install libgoogle-perftools-dev numactl -y
apt-get install libfl2 -y
apt-get install libfl-dev -y
apt-get install zlibc zlib1g zlib1g-dev -y

# MiniPro EEPROM dependencies
apt install libusb-1.0-0-dev

echo "[INFO] Dependencies installed for: "
echo "[INFO]   ModelSim"
echo "[INFO]   Magic"
echo "[INFO]   ngspice"
echo "[INFO]   netgen"
echo "[INFO]   Xschem"
echo "[INFO]   Icarus Verilog"
echo "[INFO]   Verilator"
echo "[INFO]   GHDL"
echo "[INFO]   riscv-gnu-toolchain"

echo "[INFO] Cloning tools in ${UTIL_DIR}"
# Clone OpenRadHardSCL repo
cd ${UTIL_DIR} && git clone git@github.com:rjridle/OpenRadHardSCL.git
cd ${UTIL_DIR} && git clone git@github.com:verilator/verilator.git
cd ${UTIL_DIR} && git clone git@github.com:ghdl/ghdl.git
cd ${UTIL_DIR} && git clone git@github.com:steveicarus/iverilog.git
cd ${UTIL_DIR} && git clone git@github.com:RTimothyEdwards/magic.git
cd ${UTIL_DIR} && git clone git@github.com:StefanSchippers/xschem.git
cd ${UTIL_DIR} && git clone git@github.com:RTimothyEdwards/netgen.git
cd ${UTIL_DIR} && git clone git@github.com:riscv-collab/riscv-gnu-toolchain.git
cd ${UTIL_DIR} && git clone git://git.code.sf.net/p/ngspice/ngspice ngspice-ngspice

echo "[INFO] Copying .magicrc.template to ~/.magicrc"
cp ${RUN_DIR}/magic/.magicrc.template ~/.magicrc

echo "[INFO] Copying .xschem.template to ~/.xschem/xschemrc"
cp ${RUN_DIR}/xschem/.xschemrc.template ~/.xschem/xschemrc
echo "[INFO] Ready to install xschem. Refer to OpenRadHardSCL/tools/xschem to install"

echo "[INFO] Done."
