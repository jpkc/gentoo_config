#!/bin/bash
# Adds many chapters to metadata files
MP3_FILE="${1?MP3 filename required}"
NUMBER_OF_CHAPTERS="${2?Number of chapters required}"

for (( i=1; i<=NUMBER_OF_CHAPTERS; i++ ))
do 
  let START=(i-1)*10000
  let END=i*10000-1
echo "
[CHAPTER]
TIMEBASE=1/1000
START=${START}
END=${END}
title=chapter ${i}" >> chapter-metadata.txt
done

ffmpeg -i "${MP3_FILE}" -i chapter-metadata.txt -map_metadata 1 -codec copy "chapters-${MP3_FILE}"

rm chapter-metadata.txt

