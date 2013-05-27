# Syncing Two Folders Over A Network

This setup uses rsync, ssh, and launchctl to schedule backup syncs. 

##Backup

The backup script uses **rsync** to compare a remote folder (source) to a local folder (destination) and copy the changes over.

**Todo:** Need to use caffeinate so the computer doesn't go to sleep during a long backup.

## Setup
First place a link to *plist* in our **LaunchAgents** folder with

    ln -s /path_to_file/com.kevin.backup-weekly.plist .

By default, the script runs once a week, but you can change when it runs by editing the plist. To load the plist, run:

    launchctl load /Users/user_name/LibraryAgents/com.kevin.backup-weekly.plist 

