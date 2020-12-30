#! /usr/bin/env bash
while true
	do
	read -r line
	echo "$line" >> pipe
	[[ "$line" == "QUIT" ]] && then exit 0
	[[ "$line" != "+" && "$line" != "*" && ! "$line" =~ [0-9]+ ]] && {
		echo "error input"
		exit 1;
	}
done
