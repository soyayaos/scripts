#!/bin/bash

for file in *.flac; do 
    echo $file
    ffmpeg -hide_banner -loglevel quiet -i "$file" -b:a 256k "${file%.flac}.mp3" && rm -f "$file"
done

echo "done"