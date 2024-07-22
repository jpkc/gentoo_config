#!/bin/bash
# from https://docs.nvidia.com/video-technologies/video-codec-sdk/12.0/ffmpeg-with-nvidia-gpu/index.html

mkdir converted

for file in *.mp4
do
	a=0
	c=0
	startvalue=0
	stopvalue=60
	for((c=$startvalue;c<=$stopvalue;++c))
	do
		let b=a+30
	  	new_file=$(printf "converted/${file}_cuda_h264_HD_%04d.mp4" "$c")
		ffmpeg -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -c:a aac -c:v h264_nvenc -preset p6 -tune hq -b:v 1M -bufsize 5M -maxrate 3M -qmin 0 -g 250 -bf 3 -b_ref_mode middle -temporal-aq 1 -rc-lookahead 20 -i_qfactor 0.75 -b_qfactor 1.1 -ss  "${a}" -to "${b}" "${new_file}"
		let a=b
	done
done
