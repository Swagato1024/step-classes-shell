#! /bin/zsh

# script to test ./increment.sh
# assert_increment assert ./increment.sh 1 is 2 ....yes 
# assert_increment assert ./increment.sh 0 is 1 ....yes 
# assert_increment assert ./increment.sh 2 is 3 ....yes 
# assert_increment assert ./increment.sh -1 is 0 ....yes 
# assert_increment assert ./increment.sh -2 is -1 ....yes 

function assert_increment(){

  EXIT_CODE=1
  RESULT=no
  N=$1
  EXPECTED_OUTPUT=$2

  ACTUAL_OUTPUT=$(./increment.sh $N)

  if [ $ACTUAL_OUTPUT = $EXPECTED_OUTPUT ]
  then
    EXIT_CODE=0
    RESULT=yes
  fi

echo "assert_increment assert ./increment.sh $N is $EXPECTED_OUTPUT ....$RESULT"

return $EXIT_CODE

}

assert_increment 1 2
assert_increment 0 1
assert_increment 2 3
assert_increment -1 0
assert_increment -2 -1
