#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 input_dir output_dir"
    exit 1
fi


# Define source and destination directories
SOURCE_DIR=$1
DEST_DIR=$2

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Loop through all MP4 files in the source directory
for file in "$SOURCE_DIR"/*.mp4; do
    # Check if the file exists to handle the case of no matching files
    [ -e "$file" ] || continue

    # Get the filename without the path and extension
    filename=$(basename -- "$file")
    filename_no_ext="${filename%.*}"

    # Construct the output path
    output_file="$DEST_DIR/$filename_no_ext.m4a"

    # Run the FFmpeg command
    echo "Converting $file to $output_file"
    ffmpeg -i "$file" -vn -c:a copy "$output_file"
done

echo "Conversion complete."
