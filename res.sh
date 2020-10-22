#! /usr/bin/env bash
echo " " > ans4.txt
for pid in $(ls /proc/ | grep -E "[0-9]+")
do
ser=$(grep -s "sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')
echo "sum_ex_runt=$ser"
nrs=$(grep -s "nr_switch" /proc/$pid/sched | awk '{print $3}')
echo "nr_sw=$nrs"
art=$(echo "$ser / $nrs" | bc -l)
echo -e "Average_Running_Time=$art"
echo "next"
done
