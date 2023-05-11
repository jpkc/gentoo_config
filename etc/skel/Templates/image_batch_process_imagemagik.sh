#!/bin/bash
# input_file="${1?Input file required}"
# output_file="${2?Output file required}"

CONVERTED_PATH="converted"
mkdir -p "$CONVERTED_PATH"
mogrify -resize 480 -quality 70 -format png -path ${CONVERTED_PATH} *.jpg

for f in *.jpg ; do
    jpegtran -rotate 180 -outfile "$f" "$f"
	jpegtran -rotate 90 input.jpg output.jpg 
done


