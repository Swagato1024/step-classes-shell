#! /bin/zsh

# backup.sh

# Archive the given file or directory
# Backing up a directory
# Creating a backup file of given name with timestamp
# Archive file name format : archive_name_ddmmyyyy_HHMM.tar.gz


# parameters
ARCHIVE_NAME=$1
LOCATION_TO_ARCHIVE=$2
# ARCHIVE_LOCATION=$3
TIMESTAMP=$(date "+%d%m%Y_%H%m")


ARCHIVE_LOCATION=~/backup
ARCHIVE=$ARCHIVE_NAME\_$TIMESTAMP



tar cfvz $ARCHIVE_LOCATION/$ARCHIVE.tar.gz -C $LOCATION_TO_ARCHIVE . 
