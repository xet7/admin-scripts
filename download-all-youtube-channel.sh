#!/bin/bash

# Clone all videos of one YouTube channel as MP4 videos.
#
# Actual oneliner from somewhere from Internet long time ago.
# 2016-10-18 by Lauri Ojansivu: Added Bash logic. Modified to save as MP4.

function downloadall {

	youtube-dl -citw -v -f mp4 --merge-output-format mp4 https://www.youtube.com/channel/$1/featured

}

# SETTINGS:
# $1 = Channel ID of YouTube channel
# Example used: Download Talent Suomi 2016 360-videos.
channelid=UCjolQH2-G2n1n1aI7Go5qKw

downloadall "$channelid"
