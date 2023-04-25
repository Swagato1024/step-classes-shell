#!zsh 

MOVIE_FILE=$1
cut -d'|' -f1 $MOVIE_FILE | sort -R | head -n1
