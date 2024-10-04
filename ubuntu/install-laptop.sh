#!/bin/bash

sudo apt -y install \
    audacity \
    fbreader \
    flameshot \
    gitk \
    iw \
    keepassxc \
    libplist-utils \
    qimgv \
    smplayer \
    tilix \
    xfce4-power-manager \
    xfce4-terminal \
    xfce4-weather-plugin \
    xfce4-xkb-plugin

#
# ibus
#
im-config -n none

#
# flacon
#
cd /tmp
wget https://github.com/flacon/flacon/releases/download/v11.4.0/flacon-11.4.0-x86_64.AppImage
chmod +x flacon-11.4.0-x86_64.AppImage
mv flacon-11.4.0-x86_64.AppImage $HOME/.local/bin/flacon

#
# nasm
#
sudo apt -y install nasm



#
# rust
#
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
