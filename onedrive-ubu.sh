#!/bin/sh

# onedrive-ubu.sh
# A BASH script to set up OneDrive integration with GNOME on Ubuntu
# Copyright (C) 2018 Garrett Mills (garrett@glmdev.tech)
# This software is licensed under the MIT License.
# This sofware is provided without warranty or even any implied intent of purpose.
#
# OnedriveD: https://github.com/xybu/onedrived-dev
#
# NOTE: This script downloads the NGROK binary from http://glmdev.tech/ngrok
#       You can replace the download URL with your own, or install it manually from the NGROK website.

clear
echo "Setting up OneDrive for Ubuntu GNOME..."
sleep 1
echo "Authorize sudo..."
sudo echo "Success!"
echo "Verifying dependencies..."
sleep 1
sudo apt update > /dev/null
sudo apt install -y git build-essential python3-dev libssl-dev inotify-tools python3-pip python3-dbus > /dev/null

echo "Removing any old versions of onedrived..."
sudo pip3 uninstall -y onedrive_d onedrived > /dev/null
sudo rm -rf ~/.onedrive ~/.onedrived ~/.odd

echo "Downloading onedrived..."
git clone --quiet https://github.com/xybu/onedrived-dev.git ~/.odd > /dev/null
cd ~/.odd

echo "Installing onedrived..."
sudo python3 ./setup.py install > /dev/null

echo "Configuring onedrived..."
echo "Configuring account..."
onedrived-pref account add

echo "Configuring drive..."
onedrived-pref drive set

echo "Checking for ngrok..."
if ! which ngrok ; then
  echo "Downloading ngrok... (this may take a while)"
  cd /tmp
  wget --quiet http://glmdev.tech/ngrok > /dev/null
  sudo mv ngrok /usr/bin/ngrok
  sudo chmod +x /usr/bin/ngrok
echo done

echo "Starting OneDrive daemon..."
onedrived start

echo "Creating auto-start entry..."
echo "
[Desktop Entry]
Name=OneDrive Daemon Autostart
Exec=onedrived start
Type=Application
X-GNOME-Autostart-enabled=true
" > ~/.config/onedrive_daemon.desktop

echo "Success!"
