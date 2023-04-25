#! /bin/bash

#  play_math_quiz gives quiz contestant a arithmetic expression to solve
#  Contestant will give a solution as an input
#  Our program asserts whether contestant's solution is Correct or Incorrect 
#  Also displays  time taken by the  Contestant to answer

function generate_random_number() {
  jot -r 1 $1 $2
}

function generate_random_operator() {
  echo "x / % - +" | tr "[:space:]" "\n" | sort -R | head -n1
}

function is_correct_solution() {
  local EXPRESSION=$1
  local SOLUTION_OF_CONTESTANT=$2
     
  local CORRECT_SOLUTION=$(echo "$ARITHMETIC_EXPRESSION p" | tr "x" "*" | dc)

  [ $SOLUTION_OF_CONTESTANT -eq $CORRECT_SOLUTION ]
}

function generate_arithmetic_expression(){
  local  OPERAND1=$(generate_random_number 1 10)
  local  OPERAND2=$(generate_random_number 3 20) 
  local  OPERATOR=$(generate_random_operator)

  echo "$OPERAND1 $OPERAND2 $OPERATOR "
}

function want_to_quit_quiz() {
  QUIT=1
  read -p "press 0 to play, 1 to quit  : " INTERESTED_IN_PLAYING

  [ $INTERESTED_IN_PLAYING = $QUIT ]
}

function play_math_quiz() {
  if want_to_quit_quiz
  then
    return 1
  fi

  local OPERAND1=$(generate_random_number 1 10)
  local  OPERAND2=$(generate_random_number 3 20) 
  local  OPERATOR=$(generate_random_operator)

  local ARITHMETIC_EXPRESSION=$(generate_arithmetic_expression )

  echo " Solve $ARITHMETIC_EXPRESSION "
  
  local START_TIME=$(date "+%S")
  read -p "Enter your solution : " SOLUTION_OF_CONTESTANT
  local END_TIME=$(date "+%S")
  
  TIME_TAKEN=$(dc -e "$END_TIME $START_TIME - p") 

# default value in RESULT
  local RESULT="Incorrect" 

  if is_correct_solution "$ARITHMETIC_EXPRESSION" $SOLUTION_OF_CONTESTANT ;
  then
    RESULT="Correct"
  fi
 
  echo "$RESULT result in  $TIME_TAKEN seconds"
  
  play_math_quiz
}

function main(){
  play_math_quiz
}


main
