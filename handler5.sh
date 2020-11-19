#! /usr/bin/env bash
command="+"
number=1
(tail -f pipe5) |
while true 
do
    read line
    case $line in 
              "+")
                   command="+"
                   echo "Plus"
;;

esac
done
