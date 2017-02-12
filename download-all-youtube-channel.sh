#!/bin/bash

# Download all videos of one YouTube channel as MP4 videos.
# License: MIT
#
# Actual oneliner from somewhere from Internet long time ago.
# 2017-02-12 by Lauri Ojansivu (xet7): Cleanup some text.
# 2016-10-18 by Lauri Ojansivu (xet7): Added Bash logic. Modified to save as MP4.

function downloadall {

	youtube-dl -citw -v -f mp4 --merge-output-format mp4 https://www.youtube.com/channel/$1/featured

}

# SETTINGS:
# $1 = Channel ID of YouTube channel, looks like random letters and numbers
#      Change below text YOUR-CHANNEL-ID-HERE to your Channel ID.
channelid=YOUR-CHANNEL-ID-HERE

downloadall "$channelid"
