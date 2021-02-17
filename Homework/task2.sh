#!/bin/bash
# Backup script ---------------------------------------------------------------------

# TODO: Call functions TODO: check variables in functions/out functions
# TODO: Better control on parameters
# TODO: Better control during the execution *

#Variables
OLDEST=$(date -d "now - ${1} days" +"%Y-%m-%d")
TODAY=$(date +"%Y-%m-%d")
#Location to backup
SOURCE="/root/src"
#Backup destination
DEST="backup"

# Functions --------------------
# Cleanup old backup function
cleanup(){
	cd $DEST
        echo "Deleting backups older than: "$1" days"
        echo "Oldest backup to keep: " $OLDEST
	# Iterate backup folder ls -d * | while read d
	for d in $(ls -d */); do
		#If backup is older than $1 days - remove it
		if [ `dateutils.ddiff $d $TODAY` -gt $1 ] ; then
			echo "Deleting backup: " $d
			# rm -rf $d
		fi
	done
}

#Backup function
backup_folder(){
	echo "Creating backup: " $TODAY
	rsync -av --delete-during $SOURCE $DEST/$TODAY > /dev/null
	echo "Backup done"
}

#Checking parameter
checkparm(){
	if [ $# -eq 0 ]; then
		echo "No arguments supplied"
		exit 1 
	elif [ $1 -lt 1 ]; then
		echo "Invalid parameter - must be integer greater than 0"
		exit 2
	fi
}

# Exectution -----------------
checkparm $1
backup_folder $1
cleanup $1
