#! /usr/bin/env bash


function FILE_FOUND(){
    echo "File: $1.sh"
    exit -2
}

function ACCESS_ERROR(){
    echo "File: $1.sh"
    exit -3
}
function ERROR_main(){
    if [[ $1 = '' ]]
    then 
    echo -e 'EMPTY'
    exit -4
    fi
}


function checkFile(){
    if ! [ -a $1.sh ] 
    then
    FILE_FOUND $1
    fi
    if ! [ -r $1.sh ]
    then 
    Acces_ERROR
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
