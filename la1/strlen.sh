#! /usr/bin/env bash

function check_correct(){
    if [ "$1" = "" ]
    then 
    echo String size = 0
    exit 0
    fi
}

function DO(){
    echo "String: '$1'"
    var="$1"
    size=${#var}
    if [ -z $2 ]
    then
    echo String size is "$size"
    exit 0
    fi
    echo String size is $(( $size - 2 ))
}

check_correct "$1"
DO "$1" $2
