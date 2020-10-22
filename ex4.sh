#! /usr/bin/env bash
echo " " > ans4.txt
for pid in $(ls /proc/ | grep -E "[0-9]+")
do
ppid=$(grep -s "PPid" /proc/$pid/status | awk '{print $2}')
ser=$(grep -s "sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')
nrs=$(grep -s "nr_switch" /proc/$pid/sched | awk '{print $3}')
art=$(echo "$ser / $nrs" | bc -l)
echo "ProcessorID=$pid : Parent_ProcessorID=$ppid : Average_Running_Time=$art" >> ans4.txt
done
sort -k3 ans4.txt > sans4.txt
