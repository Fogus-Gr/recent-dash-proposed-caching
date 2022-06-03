#!/bin/bash

# This script performs the following 2 procedures.
# Step 1: Encodes the every MP4 video in the current directory and generates 6 distinct MP4 videos of 6 distinct resolutions (2160p, 1440p, 1080p, 720p, 480p, 360p).
# Step 2: Splits the generated MP4 videos into segments with duration 10 seconds and generates all the additional files that are required (manifest.mpd, etc.) so that it can be streamed using MPEG DASH.


if [[ "$#" -lt 1 || ! "$1" -ge 1 ]] ; then
    echo "This script requires a DASH segment duration of at least 1 sec"
    exit 1
fi

# Check programs
if [ -z "$(which ffmpeg)" ]; then
	echo "Error: ffmpeg is not installed"
	exit 1
fi

if [ -z "$(which MP4Box)" ]; then
	echo "Error: MP4Box is not installed"
	exit 1
fi

MYDIR=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
SAVEDIR=$(pwd)

cd "$MYDIR"

TARGET_FILES=$(find ./ -maxdepth 1 -type f \( -name "*.mov" -or -name "*.mp4" \))

for f in $TARGET_FILES
do
	
	# file name
	fe=$(basename "$f")
	# file name without extension
	f="${fe%.*}"
	
	if [ ! -d "${f}" ]; then #if directory does not exist, convert
		
		echo "Converting \"$f\" to multi-bitrate video in MPEG-DASH"
		
		ffmpeg -i "${fe}" -vn -c:a copy "${f}_audio.mp4" -async 1 -vsync 1
		
		ffmpeg -i "${fe}" -an -c:v libx264 -crf 23 -vf 'scale=-1:2160' "${f}_2160.mp4" -async 1 -vsync 1    
		ffmpeg -i "${fe}" -an -c:v libx264 -crf 23 -vf 'scale=-1:1440' "${f}_1440.mp4" -async 1 -vsync 1
		ffmpeg -i "${fe}" -an -c:v libx264 -crf 23 -vf 'scale=-1:1080' "${f}_1080.mp4" -async 1 -vsync 1
		ffmpeg -i "${fe}" -an -c:v libx264 -crf 23 -vf 'scale=-1:720' "${f}_720.mp4" -async 1 -vsync 1 
		ffmpeg -i "${fe}" -an -c:v libx264 -crf 23 -vf 'scale=-1:478' "${f}_480.mp4" -async 1 -vsync 1
		ffmpeg -i "${fe}" -an -c:v libx264 -crf 23 -vf 'scale=-1:360' "${f}_360.mp4" -async 1 -vsync 1
		
		rm -f ffmpeg*log*
		
		# Conver segment duration from seconds to milliseconds
		d=$(( $1 * 1000 ))
		
		# if audio stream does not exist, ignore it
		if [ -e "${f}_audio.mp4" ]; then
		
			MP4Box -dash $d -segment-name %s_ "video_2160.mp4" "video_1440.mp4" "video_1080.mp4" "video_720.mp4" "video_480.mp4" "video_360.mp4" "video_audio.mp4" -out "manifest.mpd"
		
		fi
		
		# create a jpg for poster. Use imagemagick or just save the frame directly from ffmpeg is you don't have cjpeg installed.
		ffmpeg -i "${fe}" -ss 00:00:00 -vframes 1 -qscale:v 10 -n -f image2 - | cjpeg -progressive -quality 75 -outfile "${f}"/"${f}".jpg
		
	fi

done

cd "$SAVEDIR"
