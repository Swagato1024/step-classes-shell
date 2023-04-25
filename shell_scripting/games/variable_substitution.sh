#! /bin/bash

SCRIPT=$1

for MATCH  in $(cat $SCRIPT | grep -o "\$[A-Z][A-Z]*[^ ]*")
do
  VAR=$(echo $MATCH | tr -d "$")
  NEW_NAME="{$VAR}"

  echo  "%s/$VAR/$NEW_NAME/g"
done


