#! /bin/zsh

N=$1
echo "$N 1 + p "| tr "-" "_" | dc
