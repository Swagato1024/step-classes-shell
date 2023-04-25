#! /bin/zsh

COMMAND=$1
#PATHS=$(echo $PATH | tr ":" "\n")

for CURRENT_PATH in $(echo $PATH | tr ":" "\n")
do

  ABS_PATH=$CURRENT_PATH/$COMMAND 

  if [ -x $ABS_PATH ]
  then
   echo "$CURRENT_PATH/$COMMAND"
   exit
  fi

done

echo "$COMMAND not found"

exit
