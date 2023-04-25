#! /bin/bash

function show_board() {
  local  BOARD=$1
  echo -e "$BOARD"
}

function is_game_over() {
  local NO_OF_ROUNDS=$1
  [ $NO_OF_ROUNDS -eq 4 ]
}

function increment() {
  dc -e " $1 1 + p"
}

function has_won(){
  local PLAYER_POSITIONS=$1
  local LIST_OF_WINNING_PATTERNS="123 147 159 258 369 456 789 357"

  for PATTERN in $LIST_OF_WINNING_PATTERNS
  do
    local WINNING_POSITION1=$(echo "$PATTERN" | cut -c1)
    local WINNING_POSITION2=$(echo "$PATTERN" |  cut -c2)
    local WINNING_POSITION3=$(echo "$PATTERN" | cut -c3)

    local WINNING_SEQUENCE=$(echo $PLAYER_POSITIONS | grep "$WINNING_POSITION1" | grep "$WINNING_POSITION2" | grep "$WINNING_POSITION3")

    if [ $WINNING_SEQUENCE ]
    then
      return 0 
    fi
  done
  return 1
}

function add_mark_to_board(){
  local BOARD=$1
  local NEW_POSITION=$2
  local SYMBOL_OF_PLAYER=$3

  echo -e "$BOARD" | tr "$NEW_POSITION" "$SYMBOL_OF_PLAYER"
}

function add_position_to_player(){
  local  MARKED_POSITIONS=$1
  local  NEW_POSITION=$2

  echo "$MARKED_POSITIONS$NEW_POSITION"
}

function take_turn_to_mark() {
  local PLAYER_NAME=$1
  local BOARD=$2
  read -p "Player$PLAYER_NAME turn : " NEW_POSITION
  echo  $NEW_POSITION
}



function play_tic_tac_toe(){

  local NO_OF_ROUNDS=$1
  local BOARD=$2
  local PLAYER1_POSITIONS=$3
  local PLAYER2_POSITIONS=$4

  local PLAYER_NAME=1
  show_board "$BOARD"

  NEW_POSITION=$(take_turn_to_mark "$PLAYER_NAME" "$BOARD")
  PLAYER1_POSITIONS=$(add_position_to_player "$PLAYER1_POSITIONS"  "$NEW_POSITION")
  BOARD=$(add_mark_to_board "$BOARD" "$NEW_POSITION" "O")

  if has_won  "$PLAYER1_POSITIONS" ; then 
    show_board "$BOARD" 
    return $PLAYER_NAME 
  fi

  if is_game_over $NO_OF_ROUNDS ; then
    return 0
  fi

  local PLAYER_NAME=2
  show_board "$BOARD"

  NEW_POSITION=$(take_turn_to_mark "$PLAYER_NAME" "$BOARD")
  PLAYER2_POSITIONS=$(add_position_to_player "$PLAYER2_POSITIONS"  "$NEW_POSITION")

  BOARD=$(add_mark_to_board "$BOARD" "$NEW_POSITION" "X")


  if has_won "$PLAYER2_POSITIONS" ; then 
    show_board  "$BOARD" 
    return $PLAYER_NAME 
  fi

  NO_OF_ROUNDS=$(increment $NO_OF_ROUNDS)

  play_tic_tac_toe $NO_OF_ROUNDS "$BOARD" "$PLAYER1_POSITIONS" "$PLAYER2_POSITIONS"
}


function main() {
  local BOARD=$(echo " 1 2 3 \n 4 5 6 \n 7 8 9 ")
  NO_OF_ROUNDS=0
  play_tic_tac_toe $NO_OF_ROUNDS "$BOARD" 
}

main


