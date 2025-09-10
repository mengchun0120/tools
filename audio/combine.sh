#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 folder output_file"
    exit 1
fi

folder=$1
output_file=$2
> list.txt
for f in ${folder}/*.m4a; do echo "file '$f'" >> mylist.txt; done
ffmpeg -f concat -safe 0 -i mylist.txt -c copy "$output_file"
