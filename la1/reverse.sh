#! /usr/bin/env bash
function ERROR_arguments(){
    echo -e '\ERROR_arguments'
    exit -1
}

function ERROR_ACCESS(){
    echo -e 'ERROR_ACCESS'
    exit -2
}

function ERROR_NOTexist(){
    echo -e 'NOT EXISTS'
    exit -2
}

function ERROR_diraccess(){
    echo -e 'ERROR DIR ACCESS'
    exit -3
}

function ERROR_Caccess(){
    echo -e 'ERROR C ACCESS'
    exit -4
}

function ERROR_access(){
    echo -e 'ERROR ACCEESS -5'
    echo -en "\007"
    exit -5
}

function check_correct(){
    if [[ -n $4 || -z $3 || -z $2 ]]
    then ERROR_arguments
    fi
    if ! [[ -e $2 ]]
    then ERROR_NOTexist
    fi 
    if ! [[ -r $2 ]]
    then ERROR_ACCESS
    fi
    if ! [[ -r "$(dirname $3)" ]]
    then ERROR_diraccess
    fi
    if ! [[ -w "$(dirname $3)" ]] && ! [[ -f "$3" ]]
    then ERROR_Caccess
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
        echo SUCCESS
}
