#! /usr/bin/env bash
Maxmemory=0
Thispid=0
for pid in $(ps -u root o pid)
do 
memory=$(grep -s "VmSize" /proc/$pid/status | awk '{print $2}')
if [[ $memory -gt $Maxmemory ]]
then
Maxmemory=$memory
Thispid=$pid
fi
done
top -p $Thispid -b -n 1 > ans6.txt
topmemory=$(cat ans6.txt | grep $Thispid | awk '{print $5}')
echo "PID=$Thispid memory_by_status=$Maxmemory memory_by_top=$topmemory"
