#!/bin/bash
# Renames whatever sequentially
OUTPUT_FILE_PREFIX="${1?Output file prefix required}"

a=0

for file in *.jpg
do
  new=$(printf "${OUTPUT_FILE_PREFIX}%04d.jpg" "$a")
  mv "${file}" "${new}"
  let a=a+1
done

