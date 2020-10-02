#! /usr/bin/env bash
function ERROR_arguments(){
    echo "ERROR ARGUMENTS"
    exit -1
}

function FILE_ERROR(){
    echo "File: $1.sh  -  FILE ERROR"
    exit -2
}

function Access_ERROR(){
    echo "File: $1.sh  -  ACCESS ERROR"
    exit -3
}

function empty_main(){
    if [[ $1 = '' ]]
    then 
    echo "YOU ENTER EMTY ARGUMENT, TAB 'HELP' TO USE CLOSSARY"
    exit -4
    fi
}

function checkFile(){
    if ! [ -a $1.sh ] 
    then
    File_ERROR $1
    fi
    if ! [ -r $1.sh ]
    then 
    Access_ERROR
    fi
}

function DO(){
    case $1 in
    calc)      
        ./calc.sh $@
        ;;
    search)
        ./search.sh $@
        ;;
    reverse)
        ./reverse.sh $@
        ;;
    log)
        ./log.sh $@
        ;;
    exit)
        ./exit.sh $@
        ;;
    help)
        ./help.sh $@
        ;;
    interactive)
        ./interactive.sh $@
        ;;
    esac
}

empty_main $1
checkFile $1
if [ $1 = "strlen" ]
then 
    if ! [[ $3 = "int" ]]
    then
        if ! [[ $# -eq 2 ]]
        then 
        ERROR_arguments
        fi
        ./strlen.sh "$2"
        exit 0
    fi
./strlen.sh "$2" $3
fi
DO $@
