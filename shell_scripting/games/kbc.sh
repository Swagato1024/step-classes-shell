#! /bin/bash

for LINE_NO in {1..2}
do
  cat question_with_answer.txt | head -n$LINE_NO | tail -n1
  read -n0 -p " Enter for next question"
done
