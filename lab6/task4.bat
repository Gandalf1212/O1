@echo off
driverquery /FO TABLE > Drivers.txt
sort /R Drivers.txt /O SortDrivers.txt
