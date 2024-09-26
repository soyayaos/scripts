#!/bin/bash

mkdir test-dir
fio --rw=write --ioengine=sync --fdatasync=1 --directory=test-dir --size=512m --bs=4k --name=test
rm -rf test-dir
