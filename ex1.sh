#! /usr/bin/env bash
ps -u | sed 1d | wc -l > ans1.txt
ps -u | sed 1d | awk '{print $2 ":" $11}' >> ans1.txt
