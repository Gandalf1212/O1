#! /usr/bin/env bash
function ERROR_arguments(){
    echo "ERROR ARGUMENTS"
    exit -1
}

function ERROR_rights(){
    echo "$1"
    echo  "This directory is not available for you"
    exit -2
}

function ERROR_exist(){
    echo "$1"
    echo "Directory not exists"
    exit -3
}

function check_correct(){
    if [[ -n $4 || -z $3 || -z $2 ]]
    then ERROR_arguments
    fi
    if ! [[ -e $2 ]]
    then ERROR_exist $2
    fi
    if ! [[ -r $2 ]]
    then ERROR_rights $2
    fi
}

function DO(){
    grep -r -s "$3" "$2"
}

echo "!-search-!"
check_correct $@
DO $@
