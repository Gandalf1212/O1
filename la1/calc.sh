#! /usr/bin/env bash

function INCORRECT_request(){
    echo -e '    \INCORRECT '
    exit -1
}

function ERROR_arguments(){
    echo -e '    \INCORRECT arguments'
    exit -2
}

function ERROR_string(){
    echo -e '    \ERROR string'
    exit -3
}

function ERROR_null_div(){
    echo -e ' div on null'
    exit -4
}

function checkZero(){
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
 echo Task: $1 + $2
 echo Answer: $(( $1 + $2 ))
}

function sub(){
 echo Task: $1 - $2
 echo Answer: $(( $1 - $2 ))
}

function mul(){
 echo Task: $1 '*' $2
 echo Answer: $(( $1 * $2 ))
}

function div(){
 echo Task: $1 / $2
 echo Answer: $(( $1 / $2 ))
}

function DO(){
    case $2 in
sum)
    checkZero $@
    check_correct $@
    sum $3 $4
    ;;
sub)
    checkZero $@
    check_correct $@
    sub $3 $4
    ;;
mul)   
    checkZero $@
    check_correct $@
    mul $3 $4
    ;;
div)
    checkZero $@
    check_correctness $@
    div $3 $4
    ;;
*)
    INCORRECT_request
    ;;
esac
}
DO $@
