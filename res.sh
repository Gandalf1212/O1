#! /usr/bin/env bash
for src in $(ps -u root o pid,command | awk '{print $1 "." $2}')
do
pid=$(echo $src | cut -d "." -f 1)
comm=$(echo $src | cut -d "." -f 2)
mem=$(grep -s "read_bytes" /proc/$pid/io | cut -d ":" -f 2)
if [[ -n $mem ]]
then
echo $pid $comm $mem >> ans7.txt
fi
done

