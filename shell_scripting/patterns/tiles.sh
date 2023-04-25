#! /bin/bash

function generate_sequence() {
  jot -r 10 1 2 | tr -d "\n"
}

function row() {
  #  echo $1 | sed -e "s/1/$2/g" -e "s/2/$3/g" | tr "12" "/\\"
  local SEQUENCE=$1
  local TILE_PART1=$2
  local TILE_PART2=$3

  echo $SEQUENCE | sed -e "s/1/$2/g" -e "s/2/$3/g" | tr "12" "/\\"
}

function generate_pattern() {
  for BLOCK in {1..10}
  do
    local SEQUENCE=$(generate_sequence)
    row $SEQUENCE "1 " " 2"
    row $SEQUENCE " 1" "2 "
  done
}

generate_pattern
