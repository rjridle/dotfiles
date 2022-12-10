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

# Install packages for ModelSim
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
# Magic
apt-get install gcc -y #gcc
apt-get install csh -y #csh
apt-get install tcsh -y #tcsh
apt-get install tk8.6-dev -y #Tcl/Tk
apt-get install libqt5opengl5-dev -y #OpenGL

# Xschem
apt-get install gawk -y # Gawk
apt-get install libx11-dev -y # Xlib (auto installed)
apt-get install libxpm-dev -y # Xpm
apt-get install bison -y # Bison
apt-get install flex -y # Flex
apt-get install libcairo2-dev -y # Cairo
apt-get install libgtk-3-dev -y # Gaw waveform viewer
apt-get install build-essential -y # Gaw waveform viewer

# riscv-gnu-toolchain
apt-get install autoconf 
apt-get install automake 
apt-get install autotools-dev 
apt-get install curl 
apt-get install python3 
apt-get install libmpc-dev 
apt-get install libmpfr-dev 
apt-get install libgmp-dev 
apt-get install patchutils 
apt-get install bc 
apt-get install zlib1g-dev 
apt-get install libexpat-dev


# Icarus Verilog
# gperf 3.0 or later
# readline 4.2 (usually means readline-devel rpm)
# termcap (used by readline)
# autoconf 2.53 or later

echo "[INFO] Cloning OpenRadHardSCL repo to home directory"
# Clone OpenRadHardSCL repo
cd ~/ && git clone git@github.com:rjridle/OpenRadHardSCL.git

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

# Install Ngspice 
echo "[INFO] Installing ngspice from apt"
apt install ngspice -y
# Install Netgen
echo "[INFO] Installing netgen from apt"
apt install netgen-lvs -y


# Install packages for minipro EEPROM programmer software
echo "[INFO] Installing packages for MiniPro EEPROM"
apt install libusb-1.0-0-dev

echo "[INFO] Done."
