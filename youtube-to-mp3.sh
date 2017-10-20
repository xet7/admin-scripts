#!/bin/bash

# Source:
# https://askubuntu.com/questions/178481/how-to-download-an-mp3-track-from-a-youtube-video
#
# Usage: ./youtube-to-mp3.sh YOUTUBE-VIDEO-URL 

youtube-dl --extract-audio --audio-format mp3 $1
