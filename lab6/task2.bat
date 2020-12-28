@echo off
echo %computername%
md IEWIN7
cd IEWIN7
md temp
cd ..
NET SHARE temp="C:\IEWIN7\temp"
copy.bat
schtasks /Create /SC ONCE /TN copying /TR copy.bat /ST 8:06
schtasks /Query /TN copying
taskkill /TM copy.bat
fc C:\Windows\explorer.exe C:\IEWIN7\temp\explorer.exe > difference.txt
type difference.txt
copy.bat
