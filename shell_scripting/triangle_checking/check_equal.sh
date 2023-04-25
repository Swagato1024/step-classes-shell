#! zsh

ANGLE1=$1
ANGLE2=$2

if [ $ANGLE1 -eq $ANGLE2 ]; then 
  echo 1

else
  echo 0
fi
