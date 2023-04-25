#! /bin/bash
source is_equal.sh

if $(is_equal 2 3)
then
  echo "equal"
else
  echo "not equal"
fi

