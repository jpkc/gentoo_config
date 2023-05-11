#!/bin/bash

ffmpeg_nvidia_encode () { # file, start time, end time, output file name
	ffmpeg -vsync 0 -hwaccel_output_format cuda -c:v h264_cuvid -resize 1280x720 -i "$ORIGINALS_PATH/${1}" -ss "${2}" -to "${3}" -c:a aac -c:v h264_nvenc -b:v 750k "$CHAPTER_PATH/${4}.mp4"
}


ORIGINALS_PATH="../originals"
CHAPTER_PATH="../chapters/17. Practical Residual Networks in PyTorch"
mkdir -p "$CHAPTER_PATH"
ffmpeg_nvidia_encode "140-145.mp4" 00:08:35 00:31:20 "142. Practical ResNet Part 1"
ffmpeg_nvidia_encode "140-145.mp4" 00:31:20 00:42:56 "143. Practical ResNet Part 2"
ffmpeg_nvidia_encode "140-145.mp4" 00:42:56 00:54:59 "144. Practical ResNet Part 3"
ffmpeg_nvidia_encode "140-145.mp4" 00:54:59 01:07:40 "145. Practical ResNet Part 4"
# 01:07:40 "intermission"

