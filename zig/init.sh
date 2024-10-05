#!/bin/bash

echo ".zig-cache/" >> .gitignore && \
echo "zig-out/" >> .gitignore && \
zig init && \
tee Makefile <<EOF
.SILENT:

build:
	zig build

build-fast:
	zig build --release=fast

build-safe:
	zig build --release=safe

build-small:
	zig build --release=small

clean:
	zig build clean

run:
	zig build run

EOF
