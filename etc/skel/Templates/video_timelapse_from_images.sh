#!/bin/bash
# Começando do frame ${1}
ffmpeg -framerate 30 -start_number ${1} -i G%07d.JPG -vf scale=1920:1080 -c:v libx264 -pix_fmt yuv420p dusk_h264_1080.mp4
ffmpeg -framerate 30 -start_number ${1} -i G%07d.JPG -c:v libx264 dusk_h264.mp4
ffmpeg -framerate 30 -start_number ${1} -i G%07d.JPG -c:v libx265 dusk_h265.mkv

# https://stackoverflow.com/questions/30832248/is-there-a-way-to-remove-gopro-fisheye-using-ffmpeg
# lensfun looks way better
for file in *
do
#	ffmpeg -i "$file" -c:v libx264 -c:a aac -vf lenscorrection=0.5:0.5:-0.335:0.097 lenscorrection-Hero3-"$file"
#	ffmpeg -i "$file" -c:v libx264 -c:a aac -vf lenscorrection=k1=-0.18:k2=0.006 lenscorrection-Hero5-Hero6-"$file"
	ffmpeg -i "$file" -c:v libx264 -c:a aac -vf 'lensfun=make=GoPro:model=HD2:lens_model=fixed lens:mode=geometry:target_geometry=rectilinear' lensfun-HERO2-"$file"
done

