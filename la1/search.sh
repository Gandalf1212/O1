#! /usr/bin/env bash
function ERROR_arguments(){
    echo -e 'ERROR ARGUMENTS'
    exit -1
}

function ERROR_ACCESS(){
    echo "$1"
    echo -e 'ERROR ACCESS'
    exit -2
}

function ERROR_NOTexist(){
    echo $1
    echo -e 'NOT EXISTS'
    exit -3
}

function check_correct(){
    if [[ -n $4 || -z $3 || -z $2 ]]
    then ERROR_arguments
    fi
    if ! [[ -e $2 ]]
    then ERROR_NOTexist
    fi
    if ! [[ -r $2 ]]
    then ERROR_ACCEESS $2
    fi
}

function DO(){
    grep -r -s "$3" "$2"
}

check_correct $@
DO $@
