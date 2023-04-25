#! /bin/bash
CASES="1_,_1:_2,2_"

function row_of_tiles() {
  for TILE_NO in {1..5}
  do
    RANDOM_INDEX=$(jot -r 1 1 2)
    TILE="$TILE"$(echo $CASES | cut -f$RANDOM_INDEX -d":" | tr "\n" ":")
  done
  echo "$TILE"
}

function generate_pattern() {
  echo
  for ROW in {1..15}
  do
    echo $(row_of_tiles) | grep -o "..," | tr -d ",\\n" | tr "_12" " /\\"
    echo
    echo $(row_of_tiles) | grep -o ",.." | tr -d ",\\n" | tr "_12" " /\\"
    echo
  done
}

row_of_tiles

