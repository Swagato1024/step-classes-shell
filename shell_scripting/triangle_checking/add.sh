#! /bin/zsh

NUM1=$1
NUM2=$2

dc -e "$NUM1 $NUM2 + p"
