#! /usr/bin/env bash
function ERROR_inquiry(){
    echo "INCORRECT REQUEST"
    exit -1
}

function ERROR_arguments(){
    echo "ERROR ARGUMENTS"
    exit -2
}

function ERROR_string(){
    echo "ARGUMENT IS NOT INTEGER"
    exit -3
}

function ERROR_null_div(){
    echo "DIV ON ZERO"
    exit -4
}

function check_zero(){
    if [[ "$3" = "+0" || "$3" = "-0" ]]
    then $2 0 $4
    exit 0
    fi
    if [[ "$4" = "+0" || "$4" = "-0" ]]
    then $2 $3 0
    exit 0
    fi
    if [[ "$3" = "+0" || "$3" = "-0" && "$4" = "+0" || "$4" = "-0" ]]
    then $2 0 0
    exit 0
    fi
}

function check_correct(){
    if [[ -n $5 || -z $4 || -z $3 ]]
    then ERROR_arguments
    fi
    re='^-?[0-9]+$'
    if ! [[ "$3" =~ $re && "$4" =~ $re ]]
    then ERROR_string
    fi
    if [[ $4 -eq '0' && $2 = 'div' ]]
    then ERROR_null_div
    fi
}

function sum(){
 echo $1 + $2 = $(( $1 + $2 ))
}

function sub(){
 echo $1 - $2 = $(( $1 - $2 )) 
}

function mul(){
 echo $1 '*' $2 = $(( $1 * $2 ))
}

function div(){
 echo $1 / $2 = $(( $1 / $2 )) 
}

function DO(){
    case $2 in
sum)
    check_zero $@
    check_correct $@
    sum $3 $4
    ;;
sub)
    check_zero $@
    check_correct $@
    sub $3 $4
    ;;
mul)   
    check_zero $@
    check_correct $@
    mul $3 $4
    ;;
div)
    check_zero $@
    check_correct $@
    div $3 $4
    ;;
*)
    ERROR_inquiry
    ;;
esac
}

echo "!-calc-!"
DO $@
