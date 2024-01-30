#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title download best and convert [codec:h264]
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ⬇️
# @raycast.argument1 { "type": "text", "placeholder": "url" }

# Documentation:
# @raycast.author necdet
# @raycast.authorURL https://raycast.com/necdet

URL="$1"
download_dir="/Users/necdet/Movies/videos"

if yt-dlp -f "bv*+ba/b" "$URL" -o "$download_dir/%(title)s.%(ext)s"; then
    # Define input and output file paths
    input_file="$(yt-dlp --get-filename -o "$download_dir/%(title)s.%(ext)s" "$URL")"
    output_file="${input_file%.*}_h264.mp4"

    # Convert the downloaded video to H.264 using FFmpeg
    ffmpeg -i "$input_file" -c:v libx264 -preset medium -crf 23 -c:a aac -strict experimental -b:a 192k "$output_file"

    # Delete the non-H.264 video
    rm "$input_file"

    exit 0
else
    # If download fails, print an error message
    echo "Error: Unable to download the video."
    exit 1
fi
