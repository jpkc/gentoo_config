#!/bin/bash
# from https://docs.nvidia.com/video-technologies/video-codec-sdk/12.0/ffmpeg-with-nvidia-gpu/index.html

mkdir converted
for file in *
do
	# Hardware transcode to H264:
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=720:1280  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 256k -bufsize 5M -maxrate 256k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1         -to  30 converted/"$file"_cuda_h264_HD_a.mp4
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=720:1280  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 256k -bufsize 5M -maxrate 256k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 -ss  30 -to  60 converted/"$file"_cuda_h264_HD_b.mp4
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=720:1280  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 256k -bufsize 5M -maxrate 256k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 -ss  60 -to  90 converted/"$file"_cuda_h264_HD_c.mp4
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=720:1280  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 256k -bufsize 5M -maxrate 256k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 -ss  90 -to 120 converted/"$file"_cuda_h264_HD_d.mp4
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=720:1280  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 256k -bufsize 5M -maxrate 256k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 -ss 120 -to 150 converted/"$file"_cuda_h264_HD_e.mp4
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=720:1280  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 256k -bufsize 5M -maxrate 256k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 -ss 150 -to 180 converted/"$file"_cuda_h264_HD_f.mp4
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=720:1280  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 256k -bufsize 5M -maxrate 256k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 -ss 180 -to 210 converted/"$file"_cuda_h264_HD_g.mp4
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=720:1280  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 256k -bufsize 5M -maxrate 256k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 -ss 210 -to 240 converted/"$file"_cuda_h264_HD_h.mp4
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=720:1280  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 256k -bufsize 5M -maxrate 256k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 -ss 240 -to 270 converted/"$file"_cuda_h264_HD_i.mp4
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=720:1280  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 256k -bufsize 5M -maxrate 256k -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 -ss 270 -to 300 converted/"$file"_cuda_h264_HD_j.mp4
done

