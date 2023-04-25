#! /bin/zsh

# script to test ./increment.sh
# assert_increment assert ./increment.sh 1 is 2 ....yes 
# assert_increment assert ./increment.sh 0 is 1 ....yes 
# assert_increment assert ./increment.sh 2 is 3 ....yes 
# assert_increment assert ./increment.sh -1 is 0 ....yes 
# assert_increment assert ./increment.sh -2 is -1 ....yes 

function assert_increment(){

  EXIT_CODE=no
  RESULT=no
  N=$1


  echo " ACTUAL_OUTPUT=$(./increment.sh $N)"

  echo "$ACTUAL_OUTPUT"

  return 0
  if [ 




  }

  assert_increment 1 2
  assert_increment 0 1
  assert_increment 2 3
  assert_increment -1 0
  assert_increment -2 -1


