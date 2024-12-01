#!/bin/bash

filename="$1"
ext="${filename##*.}"

ffmpeg -i "$filename" -an -c:v copy "$filename.silent.$ext"
