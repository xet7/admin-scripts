#!/bin/bash

# Clone all repos of GitHub account.
# Both Organization accounts and User accounts supported.
#
# Actual Python oneliner from somewhere from Internet long time ago.
# 2016-10-18 by Lauri Ojansivu: Added Bash logic.

function cloneall {

	python -c "import json, urllib, os; [os.system('git clone ' + r['$1_url']) for r in json.load(urllib.urlopen('https://api.github.com/$2/$3/repos?per_page=200'))]"

}

# SETTINGS:
# $1 = clonetype: clone (=https) or ssh (=ssh)
clonetype=clone
# $2 = orgs / users (as Organization or Username )
usertype=users
# $3 = organization name or username
username=xet7

cloneall "$clonetype" "$usertype" "$username"
