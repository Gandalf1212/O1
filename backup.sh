#!/bin/bash

if [[ ! -d ~/source ]] ;
then
	echo "~/directory does not exist"
	exit 1
fi
 
curDate=$(date +%F)
foundDate=$(find ~ -name "Backup-*" 2> /dev/null | awk -F '/' '{print $4}' | awk -F '-' '{print $2"-"$3"-"$4}')
let date_diff=("$(date -d "$curDate" +%s)"\-"$(date -d "$foundDate" +%s)")/86400
dir_name=$(echo $curDate | awk -F '-' '{print "Backup-"$1"-"$2"-"$3}')

if [[ (-z $foundDate) || ("$date_diff" -gt 7) ]]; then
	echo "Backup has been created in ~/$dir_name"

	echo "Date of the backup:"$curDate >> ~/backup-report
    echo "Folder name:" $dir_name >> ~/backup-report
    ls ~/source >> ~/backup-report
    mkdir ~/$dir_name
    cp ~/source/* ~/$dir_name
else
	echo "Backup has been updated in ~/$dir_name"

	echo "The backup was updated:"$curDate >> ~/backup-report
	for file in $(ls ~/source/); do
		ct=~/$dir_name"/"$file
		if [ ! -f $ct ];
		then
			cp ~/source/$file $ct
			echo "New file "$file" was backed-up" >> ~/backup-report
		else
			source_size=$(stat ~/source/$file -c%s)
			indir_size=$(stat $ct -c%s)
			if [[ "$source_size" -ne "$indir_size" ]]; then
				mv $ct $ct"."$curDate
				cp ~/source/$file $ct
				echo "New version of "$file" was found. Previous version was renamed to "$file"."$curDate >> ~/backup-report
			fi
		fi
	done

fi
