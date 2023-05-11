#!/bin/bash

ffmpeg_audio_extract () { # file, start time, end time, output file name
#	ffmpeg -i "$ORIGINALS_PATH/${1}" -af "dynaudnorm=f=150:g=15" -ss "${2}" -to "${3}" "$CHAPTER_PATH/${4}.mp3"
	ffmpeg -i "$ORIGINALS_PATH/${1}" -ss "${2}" -to "${3}" "$CHAPTER_PATH/${4}.mp3"
}

FILE_NAME="CD01_themen_aktuell_01.mp3"
ORIGINALS_PATH="../originals"
CHAPTER_PATH="../chapters/Lektion 01"
mkdir -p "$CHAPTER_PATH"
ffmpeg_audio_extract ${FILE_NAME} 00:00:25 00:00:55 "01. Guten Tag"
ffmpeg_audio_extract ${FILE_NAME} 00:00:55 00:01:20 "02. Wie Heißen Sie - Wie heißt du"
ffmpeg_audio_extract ${FILE_NAME} 00:01:20 00:01:40 "03. Wie geht es ihnen"
ffmpeg_audio_extract ${FILE_NAME} 00:01:40 00:02:45 "04. Noch einmal, bitte langsam"
ffmpeg_audio_extract ${FILE_NAME} 00:02:45 00:05:15 "08. Postkarten"
ffmpeg_audio_extract ${FILE_NAME} 00:05:15 00:05:50 "09. Wer is da, bitte"
ffmpeg_audio_extract ${FILE_NAME} 00:05:15 00:07:30 "16. Hören Sie"

