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

#######################################
# INSTALLERS

i_kitty() {
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
    ln -s ~/.local/kitty.app/share/man/man1/kitty.1 /usr/share/man/man1/
    ln -s ~/.local/kitty.app/share/terminfo/x/xterm-kitty /usr/share/terminfo/x/
}

i_ranger() {
    git clone https://github.com/ranger/ranger.git
    cd ranger
    sudo make install
    cd ..
    sudo rm -rf ranger

    # Ranger icons
    git clone https://github.com/alexanderjeurissen/ranger_devicons.git
    cd ranger_devicons/
    make install
    cd ..
    rm -rf ranger_devicons/
}

i_arc_theme() {
    sudo apt install arc-theme moka-icon-theme
    git clone https://github.com/horst3180/arc-icon-theme --depth 1
    cd arc-icon-theme
    ./autogen.sh --prefix=/usr
    sudo make install
    cd ..
    rm -rf arc-icon-theme
}

i_i3gaps() {
    # Requirements (i3wm is installed also because ¯\_(ツ)_/¯)
    sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev\
        libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev\
        libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev\
        libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0\
        libxcb-xrm-dev automake i3-wm dmenu i3status i3blocks xbacklight\
        xserver-xorg-input-synaptics xserver-xorg-input-libinput libinput-tools\
        compton feh libxcb-composite0 libxcb-composite0-dev libpam0g-dev

    # Removing i3-wm 
    sudo apt remove i3-wm

    # Actually installing i3 gaps
    git clone https://github.com/Airblader/i3.git
    cd i3
    git checkout gaps && git pull
    autoreconf --force --install
    mkdir build
    cd build
    ../configure --prefix=/usr --sysconfdir=/etc
    make
    sudo make install
    cd ../../
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
}

i_i3lock_color() {
    git clone https://github.com/PandorasFox/i3lock-color.git
    cd i3-lock-color
    git tag -f "git-$(git rev-parse --short HEAD)"
    autoreconf -i
    ./configure
    make
    sudo make install
    cd ..
    rm -rf i3-lock-color
}

i_betterlockscreen() {
    # Add --composite flag to the lock call to avoid problems with compton
    git clone https://github.com/pavanjadhaw/betterlockscreen
    cd betterlockscreen
    mv betterlockscreen ~/.scripts/
    cd ..
    rm -rf betterlockscreen
}

i_tmux() {
    git clone https://github.com/tmux/tmux.git
    cd tmux
    sh autogen.sh
    ./configure && make
    sudo make install
    cd ..
    rm -rf tmux
}

i_scim() {
    git clone https://github.com/jmcnamara/libxlsxwriter.git
    cd libxlsxwriter/
    make
    sudo make install
    cd ..
    rm -rf libxlsxwriter

    git clone https://github.com/andmarti1424/sc-im.git
    cd sc-im/src
    make
    sudo make install
    cd ../..
    rm -rf sc-im
}

i_onedrive() {
    source ~/.dotfiles/onedrive-ubu.sh
}

complete_setup() {
    # Update the repos and upgrade current programs
    sudo add-apt-repository -u ppa:snwh/ppa
    sudo add-apt-repository -u ppa:neovim-ppa/stable
    sudo apt update
    sudo apt upgrade

    i_kitty # Intalling the Kitty terminal
    sudo apt install vim neovim # Vim and Neovim
    sudo apt install htop tree tig # Pretty terminal apps
    sudo apt install redshift # Redshift to avoid frying my eyes in the afternoon

    # Some dependencies that I forgot which program depends on them
    sudo apt install libevent-dev libncurses6-dev bison libncurses5-dev libncursesw5-dev libxml2-dev libzip-dev 
    sudo apt install r-base postgresql # R and Postgres because I'm a Data Scientist
    sudo apt install pass ledger # Password and Spending managers to simplify my life
    i_tmux # Terminal multiplexer
    i_scim # "Excel on the terminal"

    i_ranger # File browser
    i_arc_theme # GTK theme
    i_i3gaps # Window manager
    i_betterlockscreen # Self explainatory

    # Snaps
    sudo snap install mailspring telegram-desktop libreoffice
    sudo snap install --classic skype heroku

    # Symlinking dotfiles
    . ~/.dotfiles/makesymlinks.sh

    # Prepare vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

    # Create home folders
    mkhomefolder .env_vars # Projects' environment variables
    mkhomefolder .venvs    # Projects' virtual environments
}

while test $# -gt 0; do
    case $1 in
        kitty) i_kitty; shift ;;
        ranger) i_ranger; shift ;;
        arc-theme) i_arc_theme; shift ;;
        i3-gaps) i_i3gaps; shift ;;
        i3-lock-color) i_i3lock_color; shift ;;
        betterlockscreen) i_betterlockscreen; shift ;;
        tmux) i_tmux; shift ;;
        scim) i_scim; shift ;;
        onedrive) i_onedrive; shift ;;
        dotfiles) i_dotfiles; shift ;; 
        all) complete_setup; shift ;;
    esac 
done
exit 0
