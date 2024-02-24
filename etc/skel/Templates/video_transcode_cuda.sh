#!/bin/bash
# from https://docs.nvidia.com/video-technologies/video-codec-sdk/12.0/ffmpeg-with-nvidia-gpu/index.html

mkdir converted

for file in *
do
	# Hardware transcode to H264:
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=1280:720  -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 1M -bufsize 5M -maxrate 10M -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 converted/"$file"_cuda_h264_HD.mp4

	# Hardware transcode to HEVC:
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -vf scale_cuda=1920:1080 -c:a aac -c:v hevc_nvenc -preset p6 -tune hq -b:v 5M -bufsize 5M -maxrate 10M -qmin 0 -g 250                                         -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 converted/"$file"_cuda_hevc_FullHD.mp4

	# Hardware transcode from HEVC to H264: (Need to fix bad quality)
	# ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -c:v hevc_cuvid -resize 1920x1080 -i GX010010.MP4 -an -c:v h264_nvenc -b:v 750k test.mp4

	# Hardware upscale with RealESRGAN:
	/home/shared/Downloads/git/Real-ESRGAN/.venv/bin/python /home/shared/Downloads/git/Real-ESRGAN/inference_realesrgan_video.py -s 2 --face_enhance -i "${file}" -o converted/"${file}.AI_upscaled.mp4"
done

# List of available codecs: ffmpeg --codecs
# Relevant ones: 

# DEV.LS h264   H.264 / AVC / MPEG-4 AVC / MPEG-4 part 10
# (decoders: h264_cuvid )
# (encoders: h264_nvenc nvenc nvenc_h264 )

# DEV.L. hevc   H.265 / HEVC (High Efficiency Video Coding)
# (decoders: hevc_cuvid )
# (encoders: nvenc_hevc hevc_nvenc )

#Detailed info: (https://developer.nvidia.com/blog/nvidia-ffmpeg-transcoding-guide/)
# ffmpeg -h encoder=h264_nvenc
# ffmpeg -h encoder=hevc_nvenc

#Detailed info: (https://docs.nvidia.com/video-technologies/video-codec-sdk/12.0/ffmpeg-with-nvidia-gpu/index.html)

# Medium Preset
#   Use -preset p4 instead of -preset p6 in the command lines below.

# Fast Preset
#   Use -preset p2 instead of -preset p6 in the command lines below.

# High latency:
#  ffmpeg -y -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i input.mp4 -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 5M -bufsize 5M -maxrate 10M -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 output.mp4

# Low latency:
#  ffmpeg -y -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i input.mp4 -c:a copy -c:v h264_nvenc -preset p6 -tune ll -b:v 5M -bufsize 5M -maxrate 10M -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 output.mp4
