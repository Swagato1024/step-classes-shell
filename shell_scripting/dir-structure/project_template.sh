#! /bin/bash

function create_template () {
  FILE_NAME=$1
  mkdir src test lib
  cat ~/bin/testing.js > $PWD/lib/testing.js

  echo "one = 1 " > $PWD/src/$FILE_NAME
  echo "exports.one = one" >>$PWD/src/$FILE_NAME

}

create_template $
