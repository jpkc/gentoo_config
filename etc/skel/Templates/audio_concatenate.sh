#!/bin/bash
ffmpeg -i Shattered\ Steel\ -\ track\ 09.mp3 -i 04\ Cold\ Comfort\ 1.mp3 -i Haunted\ \(Instrumental\ Re-Remix\).mp3 -i Vampire\ Killer.mp3 -i Bloody\ tears.mp3 -i Beginning.mp3 -i Ninja\ Gaiden\ 2\ Trance\ OC\ ReMix.mp3 -i Firefight\ 2.mp3 -i Knightmare.mp3 -filter_complex '[0:0][1:0][2:0][3:0][4:0][5:0][6:0][7:0][8:0]concat=n=9:v=0:a=1[out]' -map '[out]'  SOUND.BIN.mp3

