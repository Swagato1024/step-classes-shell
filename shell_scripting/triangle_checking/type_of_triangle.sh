#! /bin/zsh
  
ANGLE1=$1
ANGLE2=$2
ANGLE3=$3
 

IS_EQUILATERAL=$(./check_equilateral.sh $ANGLE1 $ANGLE2 $ANGLE3 )

IS_RIGHT_ANGLE=$(./check_right_angle.sh $ANGLE1 $ANGLE2 $ANGLE3 )

IS_ISOSCELES=$(./check_isosceles.sh $ANGLE1 $ANGLE2 $ANGLE3 )

IS_ACUTE=$(./check_acute.sh $ANGLE1 $ANGLE2 $ANGLE3 )

IS_SCALENE=$(./check_scelene.sh $ANGLE1 $ANGLE2 $ANGLE3 )



if [ $IS_EQUILATERAL -eq 1 ]; then
  echo " Equilateral Triangle "
  exit 0
fi


if [ $IS_RIGHT_ANGLE -eq 1 ]; then
  echo " Right angle Triangle "
fi


if [ $IS_ISOSCELES -eq 1 ]; then
  echo " Isosceles Triangle "
  exit 0
fi


if [ $IS_ACUTE -eq 1 ]; then
  echo " Actue Triangle "
fi


if [ $IS_SCALENE -eq 1 ]; then
  echo " Scalene Triangle "
fi


exit 0
