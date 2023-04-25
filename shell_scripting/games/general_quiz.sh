#! /bin/bash
source is_equal.sh
source style_text.sh

function get_shuffled_index() {
  RANGE_BEGIN=$1
  RANGE_END=$2
  seq $RANGE_BEGIN $RANGE_END | sort -R
}


function congratulate(){
  green "Hurray ! Correct Ans"
}

function correct_constestant() {
  local CORRECT_ANS=$1
  red "You are wrong"
  green "Correct ans is $(underline "$CORRECT_ANS")" 
}

function print_welcome_msg() {
  echo -e "...........Quiz Started .............."
  echo
  echo
}

function get_a_mcq() {
  local INDEX=$1

  cat question_with_answer.txt | head -n$INDEX | tail -n1
}

function print_choices() {
  local QUESTION_ANS=$1

  for CHOICE in $(get_shuffled_index 2 5)
  do
    echo $QUESTION_ANS | cut -d"," -f"$CHOICE" | cut -d":" -f1
  done
}

function print_question() {
  local QUESTION_ANS=$1
  local QUESTION_FIELD=1

  echo 
  echo  $QUESTION_ANS | cut -d"," -f$QUESTION_FIELD

  print_choices "$QUESTION_ANS"
}

function get_correct_ans() {
  local QUESTION_ANS=$1

  local CORRECT_ANS=$(echo  $QUESTION_ANS | cut -d"," -f"2-5" | grep -o "[^,]*:" | tr -d ":")

  echo "$CORRECT_ANS"
}

function get_contestant_ans() {
  read CONTESTANT_ANS
  echo "$CONTESTANT_ANS"
}

function play_kbr() {
  NO_OF_QUESTIONS=$1

  print_welcome_msg
  for INDEX in $(get_shuffled_index 1 $NO_OF_QUESTIONS)
  do
    QUESTION_ANS=$(get_a_mcq $INDEX)
    print_question "$QUESTION_ANS"
    CONTESTANT_ANS=$(get_contestant_ans)
    CORRECT_ANS=$(get_correct_ans "$QUESTION_ANS") 

    if $(is_equal "$CONTESTANT_ANS" "$CORRECT_ANS")
    then
      congratulate 
    else
      correct_constestant "$CORRECT_ANS" 
    fi
  done
}

function main() {
  play_kbr 4
}

main
