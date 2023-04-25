#! /bin/bash

function auto_run() {
  COMMAND=$1
  FILE_NAME=$2

  local PREVIOUS_MTIME=$(date -r $FILE_NAME)

  while [ 1 ] 
  do
    local CURRENT_MTIME=$(date -r $FILE_NAME)

    if [ "$CURRENT_MTIME" != "$PREVIOUS_MTIME" ]
    then
      clear
      $COMMAND $FILE_NAME

      PREVIOUS_MTIME="$CURRENT_MTIME"
    fi
    sleep 5
  done

}

auto_run $1 $2
