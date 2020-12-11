#! /usr/bin/env bash
dataT=$(date "+%d.%m.%y_%T")
mkdir ~/test && echo "catalog test was created successfully" > ~/report && touch ~/test/$dataT.txt
ping www.net_nikogo.ru || echo "$dataT ERROR" >> ~/report
