#!/bin/bash

# Download all repos of GitHub account.
# Both Organization accounts and User accounts are supported.
# License: MIT
#
# Actual Python oneliner from somewhere from Internet long time ago.
# 2017-02-12 by Lauri Ojansivu (xet7): Clarified text. Updated example.
# 2016-10-18 by Lauri Ojansivu (xet7): Added Bash logic.
# 2022-01-03 by Lauri Ojansivu (xet7): Converted to Python3 using online converter.


function cloneall {
	#python2 -c "import json, urllib, os; [os.system('git clone ' + r['$1_url']) for r in json.load(urllib.urlopen('https://api.github.com/$2/$3/repos?per_page=200'))]"
        python3 -c "import json, urllib.request, urllib.parse, urllib.error, os; [os.system('git clone ' + r['$1_url']) for r in json.load(urllib.request.urlopen('https://api.github.com/$2/$3/repos?per_page=200'))]"
}

# SETTINGS:
# $1 = clonetype: clone (=https) or ssh (=ssh)
clonetype=clone
# $2 = orgs / users (as Organization or Username )
usertype=orgs
# $3 = organization name or username
username=wekan

cloneall "$clonetype" "$usertype" "$username"
