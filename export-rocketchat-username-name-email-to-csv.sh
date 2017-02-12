#!/bin/bash
# 2017-02-11 by Lauri Ojansivu (xet7)
# License: MIT

echo "1) Exporting Rocket.Chat username,name and email from MongoDB to users-temp.csv"
mongoexport --db rocketchat --collection users --type=csv --out=users-temp.csv --fields 'username,name,emails.0.address'

echo "2) Copying only those with email address from users-temp.csv to users.csv, because there's guest users etc."
cat users-temp.csv | grep @ > users.csv

echo "3) Removing temporary file users-temp.csv"
rm users-temp.csv

echo "3) Total count of exported users:"
wc -l users.csv

echo "4) Export Done."
