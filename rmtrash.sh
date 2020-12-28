#!/bin/bash
if [[ ! -f "./$1" ]] ; then
	echo "$1 - no such file in this directory"
	exit 1
fi
if [[ ! -d "~/.trash" ]] ; then
	mkdir ~/.trash
fi
i=0
while [[ -e "./.trash/$1$i" ]] ; do
    let "i = i++"
done
ln ./$1 ~/.trash/$1$i &&
rm $1 && echo "$(realpath $1) $1$i" >> ./.trash.log
