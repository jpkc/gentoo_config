#!/bin/bash

mkdir converted

for file in *
do
	ffmpeg -i "${file}" -c:a aac -c:v libx264 -vf "scale=1920:1080:flags=neighbor; fps=30" "${file}.mp4"
	python inference_realesrgan_video.py -i "${file}" -o "${file}.AI_upscaled.mp4"

#	ffmpeg -i in.mp4 -filter:v "crop=out_w:out_h:x:y" out.mp4
	ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -c:v h264_cuvid -resize 1920x1080 -i "$file" -an -c:v h264_nvenc -b:v 750k converted/"$file"_FullHD.mp4
#	ffmpeg -vsync 0 -c:v hevc_cuvid -resize 1600x1200 -i "$file" -an -c:v converted/"$file"_scaled_1600x1200.mp4
#	ffmpeg -i input.mp4 -map 0:v -c:v copy -bsf:v h264_mp4toannexb raw.h264

#	rm raw.h264
#	ffmpeg -i converted/"$file"_scaled_1600x1200.mp4 -map 0:v -c:v copy -bsf:v h264_mp4toannexb raw.h264
#	ffmpeg -fflags +genpts -r 60 -i raw.h264 -c:v copy converted/"$file"_scaled_1600x1200_60fps.mp4
#	rm "$file"
done


# h264 and h265 compression rate: (Constant Rate Factor - CRF)
# -c:v libx264 -crf 28 (The lower the CRF, the higher the bitrate)
# -c:v libx265 -crf 28 (The lower the CRF, the higher the bitrate)

# List of available codecs: ffmpeg --codecs
# Relevant ones: 

# DEV.LS h264   H.264 / AVC / MPEG-4 AVC / MPEG-4 part 10
# (decoders: h264 h264_v4l2m2m h264_cuvid )
# (encoders: libx264 libx264rgb h264_nvenc h264_v4l2m2m h264_vaapi nvenc nvenc_h264 )

# DEV.L. hevc   H.265 / HEVC (High Efficiency Video Coding)
# (decoders: hevc hevc_v4l2m2m hevc_cuvid )
# (encoders: libx265 nvenc_hevc hevc_nvenc hevc_v4l2m2m hevc_vaapi )

#Detailed info: (https://developer.nvidia.com/blog/nvidia-ffmpeg-transcoding-guide/)
# ffmpeg -h encoder=libx264
# ffmpeg -h encoder=libx265 
# ffmpeg -h encoder=h264_nvenc
# ffmpeg -h encoder=hevc_nvenc


# Other codec Names: https://gist.github.com/garoto/54b46513fa893f48875a89bee0056d63
# (a).h263_cuvid: Nvidia CUVID H263 decoder (codec h263) (b).h264_cuvid: Nvidia CUVID H264 decoder (codec h264) (c).hevc_cuvid: Nvidia CUVID HEVC decoder (codec hevc) (d).mjpeg_cuvid: Nvidia CUVID MJPEG decoder (codec mjpeg) (e).mpeg1_cuvid: Nvidia CUVID MPEG1VIDEO decoder (codec mpeg1video) (f).mpeg2_cuvid: Nvidia CUVID MPEG2VIDEO decoder (codec mpeg2video) (g).mpeg4_cuvid: Nvidia CUVID MPEG4 decoder (codec mpeg4) (h).vc1_cuvid: Nvidia CUVID VC1 decoder (codec vc1) (i).vp8_cuvid: Nvidia CUVID VP8 decoder (codec vp8) (j).vp9_cuvid: Nvidia CUVID VP9 decoder (codec vp9)

# Hardware transcode from HEVC to H264: (Need to fix bad quality)
# ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -c:v hevc_cuvid -resize 1920x1080 -i GX010010.MP4 -an -c:v h264_nvenc -b:v 750k test.mp4

# Software transcode from HEVC to H264:
# ffmpeg -vsync 0 -c:v hevc_cuvid -resize 1920x1080 -i GX010010.MP4 -an -c:v libx264 test_7__software_preset_slow.mp4

# Framerate change on metadata:
# 	For H.264:
# 		ffmpeg -i input.mp4 -map 0:v -c:v copy -bsf:v h264_mp4toannexb raw.h264
# 	For H.265:
# 		ffmpeg -i input.mp4 -map 0:v -c:v copy -bsf:v hevc_mp4toannexb raw.h265
# 	Then generate new timestamps while muxing to a container:
#		ffmpeg -fflags +genpts -r 30 -i raw.h264 -c:v copy output.mp4


# rotate on metadata: 
# ffmpeg -i GP030215.MP4 -ss 6:15 -to 12:12 -c copy -metadata:s:v:0 rotate=180 munich_to_feringasee.mp4

# Video Stabilization with VidStab: https://www.paulirish.com/2021/video-stabilization-with-ffmpeg-and-vidstab/
## The first pass ('detect') generates stabilization data and saves to `transforms.trf`
## The `-f null -` tells ffmpeg there's no output video file
#ffmpeg -i clip.mkv -vf vidstabdetect -f null -

## The second pass ('transform') uses the .trf and creates the new stabilized video.
#ffmpeg -i clip.mkv -vf vidstabtransform clip-stabilized.mkv

## Comparison video:
## vertically stacked
#ffmpeg -i clip.mkv -i clip-stabilized.mkv  -filter_complex vstack clips-stacked.mkv
## side-by-side
#ffmpeg -i clip.mkv -i clip-stabilized.mkv  -filter_complex hstack clips-sxs.mkv

#One Liner:
#export vid="sourcevid.mkv"
#ffmpeg -i "$vid" -vf vidstabdetect -f null -; ffmpeg -i "$vid" -vf vidstabtransform "$vid.stab.mkv"; ffmpeg -i "$vid" -i "$vid.stab.mkv"  -filter_complex vstack "$vid.stacked.mkv"

