#!/bin/bash

# This scripts supposedly replicates my setup on a new machine, it is not yet tested.

#######################################

# HELPER FUNCTIONS
mkhomefolder() {
    if [ ! -d $HOME/$1 ]; then
        echo "Creating $1 folder."
        mkdir $HOME/$1
    fi
}

debinstall() {
    echo "Downloading from $1/$2"
    wget $1/$2
    echo "Installing."
    sudo gdebi $2
    rm $2
}

# FOLDERS
mkhomefolder .env_vars # Projects' environment variables
mkhomefolder .scripts  # Projects' scripts
mkhomefolder .venvs    # Projects' virtual environments

# PROGRAMS
sudo -v # Initial sudo to avoid asking for the password again

sudo apt update

# Install basic programs
sudo apt install vim ranger htop tree tig redshift synaptic unrar r-base gdebi wget libevent-dev libncurses5-dev libxml2-dev libzip-dev

# Install snaps
sudo snap install mailspring telegram-desktop skype

# Other instalations
debinstall "https://download1.rstudio.org" "rstudio-xenial-1.1.463-amd64.deb"

# Tmux
git clone https://github.com/tmux/tmux.git
wget https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz
cd tmux-2.8
sh autogen.sh
./configure && make
sudo make install
cd ..
rm tmux-2.8

# SC-IM
git clone https://github.com/jmcnamara/libxlsxwriter.git
cd libxlsxwriter/
make
sudo make install
cd ..
rm libxlsxwriter

git clone https://github.com/andmarti1424/sc-im.git
cd sc-im/src
make
sudo make install
cd ../..
rm sc-im

#######################################

# INSTALL DOTFILES
echo "Symlinking my dotfiles"
. ~/.dotfiles/makesymlinks.sh

# Prepare vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

echo "DONE!"
