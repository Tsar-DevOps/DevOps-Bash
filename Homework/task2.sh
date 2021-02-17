#!/bin/bash
# Backup EPRT
# ---------------------------------------------------------------------
if [ $# -eq 0 ] ; then
	echo "No arguments supplied"
	exit 1
fi
echo $1
if [ $1 -lt 1 ] ; then
#if (( d < 1 )) ; then
        echo "Invalid parameter - must be integer greater than 0"
	exit 2
fi

OLDEST=$(date -d "now - ${1} days" +"%Y-%m-%d")
TODAY=$(date +"%Y-%m-%d")
SOURCE="/root/src"
DEST="backup"
[ -d $DEST ] || mkdir -p $DEST
[ -d $DEST/$TODAY ] || mkdir -p $DEST/$TODAY
echo "Creating backup: " $TODAY
rsync -av --delete-during $SOURCE $DEST/$TODAY
echo "Deleting backups older than: " $1 " days"
echo "Oldest backup to keep: " $OLDEST
cd $DEST
# Iterate backup folder
ls -d * | while read d
do
	if [ `dateutils.ddiff $d $TODAY` -gt $1 ] ; then
		echo "Deleting backup: " $d
		# rm -rf $d
	fi
done

#!/bin/bash
# Backup EPRT ---------------------------------------------------------------------
backup_folder(){
 SRC="$1"
 DEST="$2"
 echo "Creating backup: " $TODAY
 rsync -av --delete-during $SOURCE $DEST/$TODAY
 echo "Deleting backups older than: " $1 " days"
 echo "Oldest backup to keep: " $OLDEST
}
cleanup(){
 cd $DEST
 # Iterate backup folder ls -d * | while read d
 for find in ...; do
 if [ `dateutils.ddiff $d $TODAY` -gt $1 ] ; then
 echo "Deleting backup: " $d
 # rm -rf $d
 fi
 done
}
if [ $# -eq 0 ] ; then
 echo "No arguments supplied"
 exit 1 fi echo $1 if [ $1 -lt 1 ] ; then
#if (( d < 1 )) ; then
 echo "Invalid parameter - must be integer greater than 0"
 exit 2 fi OLDEST=$(date -d "now - ${1} days" +"%Y-%m-%d") TODAY=$(date +"%Y-%m-%d") SOURCE="/root/src" DEST="backup"
# [ -d $DEST ] || mkdir -p $DEST
[ -d $DEST/$TODAY ] || mkdir -p $DEST/$TODAY test ! -d "$DEST/$TODAY" && mkdir -p "$DEST/$TODAY"
# TODO: Call functions TODO: check variables in functions/out functions 
# TODO: Better control on parameters
# TODO: Better control during the execution *
