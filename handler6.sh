#! /usr/bin/env bash
echo $$ > pipe6 

answer=1
cmd="+"

sigterm()
{
     echo "exit"
     exit
}

user1()
{
     cmd="+"
}

user2()
{
     cmd="*"
}

trap 'sigterm' SIGTERM
trap 'user1' USR1
trap 'user2' USR2

while true
do 
      case $command in 
      "+")
          let answer=$answer+2
          echo $answer
      ;;
      "*")
          let answer=$answer*2
          echo $answer
      ;;
      esac
sleep 2
done
