#! /usr/bin/env bash

function FILE_FOUND(){
	
}
case $1 in
	calc*)
		./calc.sh $@
		;;
	search*)
		echo "searh is nice"
		;;
	*)
		echo "ERROR COMMAND"
		;;
esac	
	
