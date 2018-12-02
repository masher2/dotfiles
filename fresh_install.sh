#ranger !/bin/bash

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

#######################################
# FOLDERS
mkhomefolder .env_vars # Projects' environment variables
mkhomefolder .scripts  # Projects' scripts
mkhomefolder .venvs    # Projects' virtual environments

#######################################
# PROGRAMS
sudo -v # Initial sudo to avoid asking for the password again

sudo apt upgrade

# Install basic programs
sudo apt install rxvt-unicode vim htop tree tig redshift synaptic unrar r-base gdebi wget libevent-dev libncurses6-dev bison libncurses5-dev libncursesw5-dev libxml2-dev libzip-dev postgresql 

# Ranger
git clone https://github.com/ranger/ranger.git
cd ranger
sudo make install
cd ..
sudo rm -rf ranger

# Install snaps
sudo snap install mailspring telegram-desktop brave libreoffice
sudo snap install --classic skype heroku

#######################################
# ARC THEME
sudo add-apt-repository -u ppa:snwh/ppa

sudo apt install arc-theme moka-icon-theme

git clone https://github.com/horst3180/arc-icon-theme --depth 1
cd arc-icon-theme
./autogen.sh --prefix=/usr
sudo make install
rm -rf arc-icon-theme

#######################################
# i3-GAPS
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake i3-wm dmenu i3status i3blocks xbacklight xserver-xorg-input-synaptics xserver-xorg-input-libinput libinput-tools compton feh libxcb-composite0 libxcb-composite0-dev libpam0g-dev

# Removing i3-wm 
sudo apt remove i3-wm

# Installing i3
git clone https://github.com/Airblader/i3.git
cd i3
git checkout gaps && git pull
autoreconf --force --install
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
cd ~/.dotfiles
rm -rf i3

# i3-volume controls
git clone https://github.com/hastinbe/i3-volume.git
mv i3-volume/volume ~/.scripts/
rm -rf i3-volume

# Backlight control for i3
git clone https://github.com/haikarainen/light.git 
cd light
./autogen.sh
./configure && make
sudo make install
cd ..
rm -rf light

# i3-lock color
git clone https://github.com/PandorasFox/i3lock-color.git
cd i3-lock-color
git tag -f "git-$(git rev-parse --short HEAD)"
autoreconf -i
./configure
make
sudo make install
cd ..
rm -rf i3-lock-color

# Betterlockscreen
# Add --composite flag to the lock call to avoid problems with compton
git clone https://github.com/pavanjadhaw/betterlockscreen
cd betterlockscreen
mv betterlockscreen ~/.scripts/
cd ..
rm -rf betterlockscreen

#######################################
# OTHER
debinstall "https://download1.rstudio.org" "rstudio-xenial-1.1.463-amd64.deb"

# OneDrive
source ~/.dotfiles/onedrive-ubu.sh

# Tmux
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
sudo make install
cd ..
rm -r tmux

# SC-IM
git clone https://github.com/jmcnamara/libxlsxwriter.git
cd libxlsxwriter/
make
sudo make install
cd ..
rm -r libxlsxwriter

git clone https://github.com/andmarti1424/sc-im.git
cd sc-im/src
make
sudo make install
cd ../..
rm -r sc-im

#######################################

# INSTALL DOTFILES
echo "Symlinking my dotfiles"
. ~/.dotfiles/makesymlinks.sh

echo '#!/bin/bash
if synclient -l | grep "TouchpadOff .*=.*0" ; then
        synclient TouchpadOff=1 ;
else
    synclient TouchpadOff=0 ;
fi' > ~/.scripts/

# Prepare vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

echo "DONE!"
