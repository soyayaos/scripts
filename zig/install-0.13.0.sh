#!/bin/bash

cd /tmp && \
rm -f zig-linux-x86_64-0.13.0.tar.xz && \
rm -rf zig-linux-x86_64-0.13.0 && \
wget https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz && \
tar -xf zig-linux-x86_64-0.13.0.tar.xz && \
mv zig-linux-x86_64-0.13.0 ~/.local/bin/zig-linux-x86_64-0.13.0 && \
echo "export PATH=\"$HOME/.local/bin/zig-linux-x86_64-0.13.0:\$PATH\"" | sudo tee -a ~/.bashrc && \
source ~/.bashrc
