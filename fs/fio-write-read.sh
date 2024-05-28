#!/bin/bash

rm -f temp.file
fio test-write.fio
fio test-read.fio
rm -f temp.file
