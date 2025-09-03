#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 input_mp4"
    exit 1
fi

file=$1
filename=$(basename -- "$file")
filename_no_ext="${filename%.*}"
output_file="$filename_no_ext.m4a"
echo "Converting $file to $output_file"
ffmpeg -i "$file" -vn -c:a copy "$output_file"
echo "Conversion complete."
