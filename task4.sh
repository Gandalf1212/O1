#! /usr/bin/env bash

./taska4.sh & FirstPID=$!
./taska4.sh & SecondPID=$!
./taska4.sh & ThirdPID=$!
echo "1st PID" $FirstPID
echo "2nd PID" $SecondPID
echo "3d PID" $ThirdPID
renice +10 -p $FirstPID
kill $ThirdPID
