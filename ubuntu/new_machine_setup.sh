#!/bin/bash


if [ "$(id -u)" -ne 0 ]; then
	echo 'Script must be ran with sudo privaleges'
	exit 1
fi

apt update && apt upgrade -y

# Install Git
apt install git -y

# Install Vim
apt install vim -y

apt install tcl-dev
apt install tk-dev
apt install python-tk
apt install python3-tk

# Install python3
apt install python3 -y
# Install pip3
apt install python3-pip -y

# Install python packages
pip install numpy
pip install matplotlib

# Install packages for ModelSim
apt install libx

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
apt install gcc -y #gcc
apt install csh -y #csh
apt install tcsh -y #tcsh
apt install tk8.6-dev -y #Tcl/Tk
apt install libqt5opengl5-dev -y #OpenGL

# Xschem
apt install gawk -y # Gawk
apt install libx11-dev -y # Xlib (auto installed)
apt install libxpm-dev -y # Xpm
apt install bison -y # Bison
apt install flex -y # Flex
apt install libcairo2-dev -y # Cairo
apt install libgtk-3-dev -y # Gaw waveform viewer
apt install build-essential -y # Gaw waveform viewer

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

echo "[INFO] Done."
