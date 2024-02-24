#!/bin/bash
MP3_FILE_WITH_ARTWORK="${1?MP3 file with artwork required}"

mkdir new_artwork
for file in *
do
	ffmpeg -y -i "${MP3_FILE_WITH_ARTWORK}" -i "${file}" -map 1 -codec copy -map 0:1 -map_metadata 0 -id3v2_version 3 new_artwork/${file}
done

