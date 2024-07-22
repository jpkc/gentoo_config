#!/bin/bash
# from https://docs.nvidia.com/video-technologies/video-codec-sdk/12.0/ffmpeg-with-nvidia-gpu/index.html

mkdir converted
for file in *
do
	# Hardware transcode to H264:
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=360:640  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 192k -bufsize 5M -maxrate 192k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 converted/"$file"_cuda_h264_HD.mp4
done

