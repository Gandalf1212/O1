#! /usr/bin/env bash
function ERROR_arguments(){
    echo "ERROR ARGUMENTS"
    exit -1
}

function ERROR_of_rights(){
    echo "FIRST FILE IS NOT AVAILABLE"
    exit -2
}

function ERROR_exist(){
    echo "FIRST FILE IS NOT EXISTS"
    exit -2
}

function ERROR_diraccess(){
    echo "SECOND FILE DIRECTORY IS NOT AVAILABLE"
    exit -3
}

function ERROR_creating_access(){
    echo "ERROR CREATING DIRECTORY"
    exit -4
}

function ERROR_access(){
    echo "ERROR ACCESS"
    exit -5
}

function check_correct(){
    if [[ -n $4 || -z $3 || -z $2 ]]
    then ERROR_arguments
    fi
    if ! [[ -e $2 ]]
    then ERROR_exist
    fi 
    if ! [[ -r $2 ]]
    then ERROR_of_rights
    fi
    if ! [[ -r "$(dirname $3)" ]]
    then ERROR_diraccess
    fi
    if ! [[ -w "$(dirname $3)" ]] && ! [[ -f "$3" ]]
    then ERROR_creating_access
    fi
    if [[ -f $3 ]] && ! [[ -w $3 ]]
    then ERROR_diraccess
    fi
}

function DO(){
        tac $2 > reverse2.txt
        echo > $3
        rev reverse2.txt > $3
        rm reverse2.txt
        echo "-SUCCESS-"
}

echo  "!-revers-!"
check_correct $@
DO $@
