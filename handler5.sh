#! /usr/bin/env bash

>pipe
n=1
cmd="+"
tail -f pipe | while true; do
	read LINE
	case "$LINE" in
		"m")
			cmd="m"
			echo Command is "*"
			;;
		"+")
			cmd="+"
			echo Command is +
			;;
		"QUIT")
			echo "Finished by QUIT command"
			killall tail
			exit 0
			;;
		[0-9]*)
                        case $cmd in
                                "m")
                                        echo "Multiplying" $n and $LINE
                                        let "n = $n * $LINE"
                                        echo Result: $n
                                        ;;
                                "+")
                                        echo Adding $n and $LINE
                                        let "n = $n + $LINE"
                                        echo Result: $n
                                        ;;
                        esac
                        ;;
		*)
                        echo "error input"
                        killall tail
                        exit 1
                        ;;

	esac
done 
