#!/bin/sh
frame=0

digit=$(echo $2 | sed 's/^0*//')
filenamep1=$(echo $1)
filenamep2=$(echo $3)

audioname=$($filenamep1$digit$filenamep2 | cut -d. -f1)


while(true); do
	if [ -f $(pwd)/.video_in/$filenamep1$digit$filenamep2 ]; then
		ffmpeg -i $(pwd)/.video_in/$filenamep1$digit$filenamep2 $(pwd)/.audio_out/$filenamep1$digit$audioname.mp3
		rm $(pwd)/.video_in/$filenamep1$digit$filenamep2
	fi
	digit=$(expr $digit + 1)
done

echo $filename
