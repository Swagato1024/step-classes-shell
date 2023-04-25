#! /bin/bash

function show_board() {
  local  BOARD=$1
  echo -e "$BOARD"
}

function winning_pattern_matched(){
  local MARKED_POSITIONS=$1
  local LIST_OF_WINNING_PATTERNS="123 147 159 258 369 456 789 357"

  for PATTERN in $LIST_OF_WINNING_PATTERNS
  do
    local WINNING_POSITION1=$(echo "$PATTERN" | cut -c1)
    local WINNING_POSITION2=$(echo "$PATTERN" |  cut -c2)
    local WINNING_POSITION3=$(echo "$PATTERN" | cut -c3)

    local ALL_WINNING_POSITION_PRESENT=$(echo $MARKED_POSITIONS | grep "$WINNING_POSITION1" | grep "$WINNING_POSITION2" | grep "$WINNING_POSITION3")

    if [ $ALL_WINNING_POSITION_PRESENT ]
    then
      return 0 
    fi
  done
  return 1
}

function add_new_mark_to_board(){
  local BOARD=$1
  local NEW_MARK_POSITION=$2
  local SYMBOL_OF_PLAYER=$3

  echo -e "$BOARD" | tr "$NEW_MARK_POSITION" "$SYMBOL_OF_PLAYER"
}

function add_new_mark_to_player_marked_positions(){
  local  MARKED_POSITIONS=$1
  local  NEW_MARK_POSITION=$2

  echo "$MARKED_POSITIONS$NEW_MARK_POSITION"
}

function take_turn_to_mark() {
  local PLAYER_NAME=$1
  local BOARD=$2
  read -p "Player$PLAYER_NAME turn : " NEW_MARK_POSITION
  echo  $NEW_MARK_POSITION
}


function play_tic_tac_toe(){

  local NO_OF_ROUNDS_SO_FAR=$1
  local BOARD=$2
  local PLAYER1_MARKED_POSITIONS=$3
  local PLAYER2_MARKED_POSITIONS=$4
  local GAME_OVER=4 

  local PLAYER_NAME=1
  show_board "$BOARD"
  NEW_MARK_POSITION=$(take_turn_to_mark "$PLAYER_NAME" "$BOARD")
  PLAYER1_MARKED_POSITIONS=$(add_new_mark_to_player_marked_positions "$PLAYER1_MARKED_POSITIONS"  "$NEW_MARK_POSITION")
  BOARD=$(add_new_mark_to_board "$BOARD" "$NEW_MARK_POSITION" "O")

  if winning_pattern_matched  "$PLAYER1_MARKED_POSITIONS" ;
  then 
    show_board "$BOARD" 
    return $PLAYER_NAME 
  fi

  local PLAYER_NAME=2
  show_board "$BOARD"
  NEW_MARK_POSITION=$(take_turn_to_mark "$PLAYER_NAME" "$BOARD")
  PLAYER2_MARKED_POSITIONS=$(add_new_mark_to_player_marked_positions "$PLAYER2_MARKED_POSITIONS"  "$NEW_MARK_POSITION")
  BOARD=$(add_new_mark_to_board "$BOARD" "$NEW_MARK_POSITION" "X")

  if winning_pattern_matched  "$PLAYER2_MARKED_POSITIONS" ;
  then 
    show_board  "$BOARD" 
    return $PLAYER_NAME 
  fi

# increment number of moves
NO_OF_ROUNDS_SO_FAR=$(dc -e "$NO_OF_ROUNDS_SO_FAR 1 + p ")

play_tic_tac_toe $NO_OF_ROUNDS_SO_FAR "$BOARD" "$PLAYER1_MARKED_POSITIONS" "$PLAYER2_MARKED_POSITIONS"
}


function main() {
  local BOARD=$(echo " 1 2 3 \n 4 5 6 \n 7 8 9 ")
  play_tic_tac_toe 0 "$BOARD" 

}

main
