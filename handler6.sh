#! /usr/bin/env bash
echo $$ > pipe6 

answer=1
cmd="+"

user1()
{
     cmd="+"
}

user2()
{
     cmd="*"
}

sigterm()
{
     echo "exit"
     exit
}

trap 'sigterm' SIGTERM
trap 'user1' USR1
trap 'user2' USR2

while true
do 
      case $command in 
      "+")
          let answer=$answer+2
      ;;
      "*")
          let answer=$answer*2
      ;;
      esac
sleep 1
echo $answer
done
