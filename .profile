# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# XDG Directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DESKTOP_DIR=$(xdg-user-dir DESKTOP)
export XDG_DESKTOP_DIR=$(xdg-user-dir DESKTOP)
export XDG_DOWNLOAD_DIR=$(xdg-user-dir DOWNLOAD)
export XDG_TEMPLATES_DIR=$(xdg-user-dir TEMPLATES)
export XDG_PUBLICSHARE_DIR=$(xdg-user-dir PUBLICSHARE)
export XDG_DOCUMENTS_DIR=$(xdg-user-dir DOCUMENTS)
export XDG_MUSIC_DIR=$(xdg-user-dir MUSIC)
export XDG_PICTURES_DIR=$(xdg-user-dir PICTURES)
export XDG_VIDEOS_DIR=$(xdg-user-dir VIDEOS)

# R files
export R_ENVIRON_USER=$XDG_CONFIG_HOME/R/environ
export R_PROFILE_USER=$XDG_CONFIG_HOME/R/profile

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/work/Jesus/scripts" ] ; then
    PATH="$HOME/work/Jesus/scripts:$PATH"
fi

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR="nvim"
export BROWSER="surf"
export MPD_HOST="/tmp/mpd"

