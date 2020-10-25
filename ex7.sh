#! /usr/bin/env bash
for src in $(ps -u root o pid,command | awk '{print $1 "." $2}')

