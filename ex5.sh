#! /usr/bin/env bash
prevPPID=-1
sum=0
count=0
while read src
do
ppid=$(echo $src | cut -d ":" -f 2 | cut -d "=" -f 2)
art=$(echo $src | cut -d ":" -f 3 | cut -d "=" -f 2)
if [[ $prevPPID -eq -1 ]]
then
prevPPID=$ppid
count=1
continue
fi
if [[ $prevPPID -eq $ppid ]]
then
echo $src
count=$(( $count + 1 ))
sum=$(echo "$sum + $art" | bc -l)
else
arts=$(echo "$sum / $count" | bc -l)
echo "Avearge_Sleeping_Children_of_ParentID=$prevPPID is $arts"
echo $src
prevPPID=$ppid
sum=$art
count=1
fi
done <sans4.txt> ans5.txt
