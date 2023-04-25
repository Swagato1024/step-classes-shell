#! /bin/bash
function append_letters() {
  SET_OF_LETTERS1="$1"
  SET_OF_LETTERS2=$2
  echo $SET_OF_LETTERS1
  echo $SET_OF_LETTERS2
  #echo "$SET_OF_LETTERS1$SET_OF_LETTERS2"
}


function is_secret_message_revealed() {

  SECRET_MESSAGE=$1
  MATCHED_MESSAGE=$2
  SET_OF_GUESSED_LETTER=$3

  if [ "$SECRET_MESSAGE" = "$MATCHED_MESSAGE" ]
  then
    echo "$MATCHED_MESSAGE"
    return 0
  fi
 
  echo "$MATCHED_MESSAGE"
  read -p "Guess a letter : " GUESSED_LETTER

  SET_OF_GUESSED_LETTER=$(append_letters "$SET_OF_GUESSED_LETTER" "$GUESSED_LETTER")
 
  MATCHED_MESSAGE=$( echo "$SECRET_MESSAGE" | tr -C "$SET_OF_GUESSED_LETTER" "_")

  is_secret_message_revealed "$SECRET_MESSAGE" "$MATCHED_MESSAGE" "$SET_OF_GUESSED_LETTER"
}

SET1="abc"
SET2="d"
append_letters $SET1 $SET2


#$is_secret_message_revealed "hello" "_____"
