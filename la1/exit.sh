#! /usr/bin/env bash
function ERROR_arguments(){
    echo "ERROR ARGUMENTS"
    exit -1
}

function ERROR_value(){
    echo "ERROR VALUE IT SHOLD BE -256<x<256"
    exit -2
}

function check_correct(){
    if [[ -n $3 ]]
    then ERROR_arguments
    fi
    if [[ -n $2 ]]
    then 
        re='^-?[0-9]+$'
        if ! [[ "$2" =~ $re || "$2" =~ $re && "$2" -gt 256 || "$2" =~ $re && "$2" -lt -256 ]]
        then ERROR_value
        fi
    fi
}

function DO(){
    if [[ -n $2 ]]
    then 
        exit $2
    else
        exit 0
    fi
}

echo !-exit-!
check_correct $@
DO $@
