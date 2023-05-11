#!/bin/bash

# Converts everything to mp3, strips downs tags and cover art and renames to small hash filename

a=0

rm -fr output
mkdir output

for file in *.mp3
do
  new=$(printf "%04X.mp3" "$a")
  ffmpeg -i "$file" -c copy -map 0:a -map_metadata -1 "output/$new"
  let a=a+1
done

for file in *.MP3
do
  new=$(printf "%04X.mp3" "$a")
  ffmpeg -i "$file" -c copy -map 0:a -map_metadata -1 "output/$new"
  let a=a+1
done

for file in *
do
  new=$(printf "%04X.mp3" "$a")
  ffmpeg -i "$file" -map 0:a -map_metadata -1 "output/$new"
  let a=a+1
done


