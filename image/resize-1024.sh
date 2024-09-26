#!/bin/bash

for file in *.jpg; do
    convert $file -resize 1024 $file.min.jpg
    echo $file
    rm $file
done

echo "done"