#!/bin/bash


# Captura tela
ffmpeg -vaapi_device /dev/dri/renderD128 -f x11grab -video_size 1920x1080 -i :0 -vf 'format=nv12,hwupload' -c:v h264_vaapi o.mp4

# Converte
ffmpeg -vaapi_device /dev/dri/renderD128 -f matroska -i 2022.08.04\ Residence\ Permit\ extension\ super\ bloom\ festival\ and\ 1972\ massacre\ memorial_HEVC_Original_30fps.mkv -vf 'format=nv12,hwupload,scale_vaapi=w=1920:h=1080' -threads 12 -c:v h264_vaapi o.mp4

# formatos: -f podem ser matroska, mp4, x11grab, etc
# Encoders podem ser h264_vaapi hevc_vaapi
# mais aqui:
# https://wiki.gentoo.org/wiki/VAAPI
# https://gist.github.com/Brainiarc7/95c9338a737aa36d9bb2931bed379219
# https://wiki.archlinux.org/title/Hardware_video_acceleration
# # Ferramentas úteis: vainfo, vdpauinfo, radeontop, 

