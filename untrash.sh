#!/bin/bash
line=""
while read line; do
	if  ! grep -q $1 <<< $line; then
		continue
	fi

    untrashDest=$(echo $line | cut -d " " -f 1)
    deleteName=$(echo $line | cut -d " " -f 2)
    echo "Was deleted with unique name: " $deleteName

    echo "Do you want to restore $untrashDest ? (y/n)"
    read input < /dev/tty
    if [[ "$input" == "y" ]]; then
        dest="$untrashDest"
        if [[ ! -d "$(dirname "$untrashDest")" ]]; then
        	echo "No previous directory. Restoring at ~"
        	dest="~/$1"
        fi
    	ln -s "~/.trash/$deleteName" $dest &&
        rm ~/.trash/$deleteName &&
        {
      	sed -i "/$deleteName/d" ./.trash.log
        echo "Restored $untrashDest"
        }
    fi
done < ./.trash.log
