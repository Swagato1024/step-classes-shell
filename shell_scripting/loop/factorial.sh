#! /bin/zsh

TERM=$1
FACTORIAL=1

if [ $TERM -le 1 ]
then
  echo "$FACTORIAL"
  exit
fi

for CURRENT_TERM in {1..$TERM}
do
  FACTORIAL=$(dc -e "$FACTORIAL $CURRENT_TERM * p")
done

echo "$FACTORIAL"

exit
