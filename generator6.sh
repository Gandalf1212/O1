#! /usr/bin/env bash
while true
do
      read line
      case $line in
      "+")
            kill -USR1 $(cat pipe6)
      ;;
      "*")
           kill -USR2 $(cat pipe6)
      ;;
            "TERM")
             kill -SIGTERM $(cat pipe6)
             exit
      ;;
      esac
done
