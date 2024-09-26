#!/bin/bash

cd /tmp && \
rm -f zls-x86_64-linux.tar.xz && \
rm -f zls && \
wget https://github.com/zigtools/zls/releases/download/0.13.0/zls-x86_64-linux.tar.xz && \
tar -xf zls-x86_64-linux.tar.xz && \
sudo mv zls ~/.local/bin && \
zls --version
