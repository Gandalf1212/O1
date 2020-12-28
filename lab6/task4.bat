@echo off
driverquery /FO TABLE > Drivers.txt
sort /R driverslist.txt /O SortDrivers.txt
