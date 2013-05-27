#!/bin/bash 
###############################################
# Simple backup script
# Kevin Walchko
# 11 Nov 2012
###############################################
# Now, put the backup.plist into /Library/LaunchDaemons
# which will run weekly using launchd. A backup.log of when
# it ran is also saved.
###############################################

## Log Function --------------------------------
# saveLog log_message filename
function saveLog {
	touch "$2"
	echo "$1" >> "$2"
}

## Error Function -------------------------------
# printError error_message filename
function errorLog {
	echo "******************************"
	echo "* $1 "
	echo "******************************"
	saveLog "$1" "$2"
}


# Get commandline args, error if none passed
if [[ -z "$1" || -z "$2" ]]; then 
    echo "usage: $0 [user] [password]"
    exit
fi

##########################
# Variables
##########################
SRC1="iTunes"
SRC2="Movies"
DEST="/Volumes/Sonic"
MNT_PT="/Volumes/bkup"
USER=$1
PASSWORD=$2
FILE="/Users/nina/ferb_backup.log"

mkdir -p "$MNT_PT"

# doesn't seem to return an error message????
ERROR_RET=`mount_afp "afp://$USER:$PASSWORD@ferb/Movies" "$MNT_PT"`
#mount_afp "afp://$USER:$PASSWORD@ferb/Movies" "$MNT_PT"

#if [ -z $ERROR_RET ]; then
#	echo "null string"
#fi

#if [ $ERROR_RET -eq 0 ]; then
#	echo "good"
#fi

#if [ $ERROR_RET -ne 0 ]; then
#	echo "bad"
#fi

#echo "$ERROR_RET"

#exit

#if [[ $ERROR_RET != 0 ]]; then
#	MSG="Failed to mount drive: `date`"
#	errorLog "$MSG" "$FILE"
#	exit
#fi	

cd "$MNT_PT"

# Since we are copying movies, they do not change once created,
# therefore not concerned about having the current version
cp -n -R "$SRC1" "$DEST"
cp -n -R "$SRC2" "$DEST"

# Save report
saveLog "Backup Completed: `date`" "$FILE"

#RET= umount "$MNT_PT"
#echo "return $RET"
#if [ $RET ]; then
#    echo true
#else
#    echo false
#fi

#while [ `umount "$MNT_PT"` ]; do
#    sleep 5
#    echo "."
#done

diskutil umount "$MNT_PT"

echo "done!!"
