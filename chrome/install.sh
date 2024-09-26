#!/bin/bash

cd /tmp
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb
