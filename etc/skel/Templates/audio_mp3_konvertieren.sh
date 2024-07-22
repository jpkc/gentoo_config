#!/bin/bash

mkdir mp3

for file in *
do
#	ffmpeg -i "$file" -af "dynaudnorm=f=150:g=15" mp3/"$file".mp3
	ffmpeg -i "$file" mp3/"$file".mp3
#	rm "$file"
done

