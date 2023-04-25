#! /bin/zsh

# test cases format
# sl_no,input,expected_output

TEST_CASE_FILE=$1
PROGRAM_FILE=$2

for ENTRY in $(cat $TEST_CASE_FILE)
do
  SERIAL_NUMBER=$(echo "$ENTRY" | cut -d"," -f1)
  CUSTOM_INPUT=$(echo "$ENTRY" | cut -d"," -f2)
  EXPECTED_OUTPUT=$(echo "$ENTRY" | cut -d"," -f3)

  PROGRAM_OUTPUT=$($PROGRAM_FILE $CUSTOM_INPUT)

  if [ "$EXPECTED_OUTPUT" = "$PROGRAM_OUTPUT" ]
  then
    echo "TEST CASE:$SERIAL_NUMBER PASSED"
  else
    echo "TEST CASE:$SERIAL_NUMBER FAILED"
  fi

done

exit
