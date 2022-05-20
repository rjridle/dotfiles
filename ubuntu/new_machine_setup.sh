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
sudo apt install gcc -y #gcc
sudo apt install csh -y #csh
sudo apt install tcsh -y #tcsh
sudo apt install tk8.6-dev -y #Tcl/Tk
sudo apt install libqt5opengl5-dev -y #OpenGL

# Xschem
sudo apt install gawk -y # Gawk
sudo apt install libx11-dev -y # Xlib (auto installed)
sudo apt install libxpm-dev -y # Xpm
sudo apt install bison -y # Bison
sudo apt install flex -y # Flex
sudo apt install libcairo2-dev -y # Cairo


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
