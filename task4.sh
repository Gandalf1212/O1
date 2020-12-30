#! /usr/bin/env bash

./taska4.sh & FirstPID=$!
cpulimit -p $FirstPID -l 5 -b -z
./taska4.sh & SecondPID=$!
./taska4.sh & ThirdPID=$!
echo "1st PID" $FirstPID
echo "2nd PID" $SecondPID
echo "3d PID" $ThirdPID
kill $ThirdPID
