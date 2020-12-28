@echo off
net start > Serves.txt
net stop dnscache
timeout /T 30
net start > newServes.txt
checkDiff.bat
net start dnscache
