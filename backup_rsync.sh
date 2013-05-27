#!/bin/bash 
###############################################
# Simple backup script
# Kevin Walchko
# 19 May 2013
###############################################
# Now, put the backup.plist into /Library/LaunchDaemons
# which will run weekly using launchd. A backup.log of when
# it ran is also saved.
#
# This script assumes you have setup ssh login
# without passwords, but using keys instead.
#
# Look into caffeinate -s [rsync ags] so the 
# computer doesn't go to sleep during a long
# backup.
###############################################

SERVER="kids@ferb.local"
FILE="/Users/nina/iTunesBackup.log"
SRC="/Volumes/Movies/iTunes"
DEST="/Volumes/Sonic"

# rsync - copies files between 2 places
# a - archive
# z - compress
# v - verbose
# r - recursive
# h - human readable
# --delete - remove files in destination that don't exist in source
# e - specify ssh for remote shell
# --rsh - remote shell" --rsh-ssh
# --stats - gives some file-transfer stats
# --log-file=NAME - log what rsync is doing
# --itemize-changes - change summary
#rsync -avzrh --stats --rsh=ssh "$SERVER":"$SRC" "$DEST" >> "$FILE" 2>&1
echo "--------------------------------------------" >> "$FILE"
rsync -azrvh --delete --stats --rsh=ssh --log-file="$FILE" "$SERVER":"$SRC" "$DEST"

# check the return codes
RET=$?
echo "Done $RET"

if [ "$RET" -eq 0 ]; then
	echo "------------------ Success Above ------------------------" >> "$FILE"
else
	echo "<<<<<<<<<<<< Error Above for Rsync Exit Value $RET >>>>>>>>>>>>>" >> "$FILE"
fi
