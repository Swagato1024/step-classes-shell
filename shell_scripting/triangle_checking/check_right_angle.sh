#! /bin/zsh 

# check if any angle is right angle

ANGLE1=$1
ANGLE2=$2
ANGLE3=$3

if [ $ANGLE1 -eq 90 -o $ANGLE2 -eq 90 -o $ANGLE3 -eq 90 ]; then
  echo 1

else 
 echo 0

fi


