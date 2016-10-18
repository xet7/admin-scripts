#!/bin/bash
# Move files older than 6 months to another directory
# 2016-05-20 First version by Lauri Ojansivu <x@xet7.org>

## Cronjob for this command:
##Move old irclogs at first day of the month.
#0 0 1 * * /path/to/move-old-irclogs.sh > /dev/null 2>&1

# Moveold function parameters:
# $1 = since date that is in filename
# $2 = original path
# $3 = destination path
# $4 = log of successfully moved files
# $5 = log or files that did not copy successfully, so original file not removed
function moveold {
    # Create destination directory if it does not exist yet
    mkdir -p "$3"
    # List original files
    for file in `ls -1 --color=none $2`
    do
        # If filename string value is smaller than 6 months ago
        if [[ "$file" < "$1" ]]
        then
                # Preserve file date when copying
                cp -p "$2$file" "$3$file"
                # Check if files are the same.
                # In awk part, $1 means result hash of sha256sum command.
                orig_sum=$(sha256sum "$2$file" | awk '{print $1}')
                dest_sum=$(sha256sum "$3$file" | awk '{print $1}')
                if [ "$orig_sum" != "$dest_sum" ]
                then
                    echo "sha256 of file $file does not match" >> "$5"
                else
                    echo "$file copied successfully, removing original." >> "$4"
                    rm $2$file
                fi
        fi
    done
}

# STEP 1: Move htmllogs
since=$(date --date="6 months ago" +%Y-%m-01.log.html)
origpath=/.../htmllogs/
destpath=/...archive/htmllogs/
successlog=/...archive/copyhtml-success.log
errorlog=/...archive/copyhtml-error.log

moveold "$since" "$origpath" "$destpath" "$successlog" "$errorlog"

# STEP 2: Move plainlogs
since2=$(date --date="6 months ago" +%Y-%m-01.log)
origpath2=/.../plainlogs/
destpath2=/...archive/plainlogs/
successlog2=/...archive/copyplain-success.log
errorlog2=/...archive/copyplain-error.log

moveold "$since2" "$origpath2" "$destpath2" "$successlog2" "$errorlog2"
