#!/bin/bash
# Split files in folders with up to ${stop_value} files
file_extension="${1?missing File extension to be sorter}"
stop_value="${2?Number of files per folder needed}"
# stop_value=1000

current_file=1
current_folder=0
folder="000000"
let current_file=stop_value+1

for file in *.${file_extension}
do
	if ((current_file > stop_value))
	then
		let current_folder=current_folder+1
		folder=$(printf "%06d" "$current_folder")
		mkdir "${folder}"
		let current_file=1
	fi
	mv "${file}" "${folder}"
	let current_file=current_file+1
done



