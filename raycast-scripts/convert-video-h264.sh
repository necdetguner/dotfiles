#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Convert a video to h264 format
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 📹
# @raycast.argument1 { "type": "text", "placeholder": "file name" }

# Check the name of input file
if [ -z "$1" ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="$1"
# Create name of output file (input.mp4 --> input_output.mp4)
output_file="${input_file%.*}_output.mp4"

# Convert video by using FFmpeg
ffmpeg -i "$input_file" -c:v libx264 -preset medium -crf 23 -c:a aac -strict experimental -b:a 192k "$output_file"

# Return success message
echo "Conversion completed. Output file: $output_file"