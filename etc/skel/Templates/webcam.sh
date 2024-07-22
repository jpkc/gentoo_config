#!/bin/bash
ffplay -video_size  432x240 -framerate 120 /dev/video0
ffplay -video_size 1280x720 -framerate  30 /dev/video0
ffmpeg -i /dev/video0 -c:v rawvideo -pix_fmt yuv420p -f sdl "SDL output"
ffmpeg -i /dev/video0 -c:v rawvideo -pix_fmt yuv420p recording.mp4

