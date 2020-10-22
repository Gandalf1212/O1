#! /usr/bin/env bash
ps -u | grep -E "/sbin/" | awk '{print $2}' > c.txt

