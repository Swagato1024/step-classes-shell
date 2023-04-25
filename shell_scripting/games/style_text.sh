#! /bin/bash

function style() {
  echo -e "\033[${1}m${2}\033[0m"
}

function green() {
  style "32" "$1"
}

function red() {
  style "31" "$1"
}

function underline() {
  style "4" "$1"
}
#green "Step"

#red "Kavita"

#underline "Kavita"
