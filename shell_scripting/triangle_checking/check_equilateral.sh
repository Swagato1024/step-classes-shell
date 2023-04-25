#! /bin/zsh

#check equilateral

ANGLE1=$1
ANGLE2=$2
ANGLE3=$3

IS_FIRST_TWO_ANGLE_EQUAL=$(./check_equal.sh $ANGLE1 $ANGLE2)
IS_SEC_TWO_ANGLE_EQUAL=$(./check_equal.sh $ANGLE2 $ANGLE3)

if [ $IS_FIRST_TWO_ANGLE_EQUAL -eq 1 -a $IS_SEC_TWO_ANGLE_EQUAL -eq 1 ]; then
  echo 1

else 
  echo 0

fi



