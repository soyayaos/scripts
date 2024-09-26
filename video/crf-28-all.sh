#!/bin/bash

for file in *.mp4; do
    stat $file
    ffmpeg -i $file -c:v libx265 -crf 28 -preset slow -c:a copy $file.min.mp4
    rm $file
    stat $file.min.mp4
    echo "--------"
done

echo "done"