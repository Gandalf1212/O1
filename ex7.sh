for src in $(ps -a -u root o pid,command | awk '{print $1 "." $2}')
do
pid=$(echo $src | cut -d "." -f 1)
name=$(echo $src | cut -d "." -f 2)
mem=$(grep -s "read_bytes" /proc/$pid/io | cut -d ":" -f 2)
if [[ -n $mem ]]
then
echo $pid $name $mem >> ans7.txt
fi
done
sleep 60
for src in $(ps -a -u root o pid,command | awk '{print $1 "." $2}')
do
pid2=$(echo $src | cut -d "." -f 1)
name2=$(echo $src | cut -d "." -f 2)
mem2=$(grep -s "read_bytes" /proc/$pid2/io | cut -d ":" -f 2)
mem=$(grep $pid2 ans7.txt | awk '{print $3}')
if [[ -n $mem && -n $mem2 ]]
then
memory=$(($mem2 - $mem))
echo "PID=$pid2 name=$name2 Memory=$memory"
fi
done | sort -n -t '=' -k 3 | head -3 > answ7.txt
rm ans7.txt
