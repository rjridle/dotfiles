#!/bin/bash


if [ "$(id -u)" -ne 0 ]; then
	echo 'Script must be ran with sudo privaleges'
	exit 1
fi

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

# ModelSim dependencies
apt-get install libx

# Get the files for Vim Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Clone dotfiles repo
cd ~/ && git clone git@github.com:rjridle/dotfiles.git
cp ~/dotfiles/vim/.vimrc ~/.vimrc

# Install Vim plugins
vim "+:PlugInstall" "+:qall"

echo "[INFO] Installing packages needed for tools"
## Packages needed for tools
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
echo "[INFO]   netgen-lvs"
echo "[INFO]   Xschem"
echo "[INFO]   Icarus Verilog"
echo "[INFO]   Verilator"
echo "[INFO]   GHDL"
echo "[INFO]   riscv-gnu-toolchain"

# Install Ngspice 
echo "[INFO] Installing ngspice from apt"
apt install ngspice -y
# Install Netgen
echo "[INFO] Installing netgen from apt"
apt install netgen-lvs -y

#echo "[INFO] Cloning OpenRadHardSCL repo to home directory"
# Clone OpenRadHardSCL repo
#cd ~/ && git clone git@github.com:rjridle/OpenRadHardSCL.git

echo "[INFO] Installing EDA tools"
## Install all EDA tools
# Install Magic

# Command below only installs Magic 8.2 but we need Magic 8.3,
# use repo in OpenRadHardSCL/tools/magic to install.
#apt install magic -y 
cp ~/OpenRadHardSCL/.magicrc.template ~/.magicrc
echo "[INFO] Ready to install magic. Refer to OpenRadHardSCL/tools/magic to install"

# Install Xschem

# Command below install wrong version of xschem. Need to install from
# repo in OpenRadHardSCL/tools/xschem instead.
cp ~/OpenRadHardSCL/.xschemrc.template ~/.xschem/xschemrc
echo "[INFO] Ready to install xschem. Refer to OpenRadHardSCL/tools/xschem to install"


echo "[INFO] Done."
