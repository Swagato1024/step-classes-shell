#! /bin/zsh

# Restore archive from backup location
# Default restore from ~/backup
# Default restore to pwd

RESTORE_FROM=$1
RESTORE_TO=$2

# Set default parameter
if [ ! $RESTORE_TO ]
then 
  RESTORE_TO=$PWD
fi

tar xfvz $RESTORE_FROM -C $RESTORE_TO
