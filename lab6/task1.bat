@echo off
md LAB6
cd LAB6
ver > SystemVers.txt
wmic logicaldisk get Size, FreeSpace > SizeMemory.txt
wmic logicaldisk list brief > disks.txt
md TEST
copy *.txt TEST
cd TEST 
dir /B > files.txt
cd ..
del "SystemVers.txt" "SizeMemory.txt" "disks.txt"
