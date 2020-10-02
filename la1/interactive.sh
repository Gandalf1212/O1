#! /usr/bin/env bash
check_var
function check_sym(){
    word="$1";
    size=${#word}
    s=$(( $size - 1 ))
    if ! [[ ${word:0:1} = '"' && ${word:$s:$size} = '"' ]]
    then 
    echo 'Incorrect string! Please, write string in ""'
    exit -5
    fi
}

function ERROR_inquiry(){
    echo "ERROR INQUIRY"
    exit -1
}

function ERROR_value(){
    echo "ERROR VALUE IT SHOLD BE -256<x<256"
    exit -2
}

function Acces_ERROR(){
    echo "ACCESS ERROR TO ""($1)"
    exit -3
}

function File_ERROR(){
    echo "FILE NOT FOUND" "($1)"
    exit -4
}

function Enter_string(){
    echo 'Enter your string in ""'
}
#ошибки
function checkFile(){
    if ! [ -e $1 ] 
    then
    File_ERROR $1
    check_var=1
    fi
    if ! [ -r $1 ]
    then 
    Acces_ERROR $1
    check_var=1
    fi
}

function checkALLFiles(){
    clear
    checkFile calc.sh
    checkFile search.sh 
    checkFile reverse.sh 
    checkFile strlen.sh 
    checkFile log.sh 
    checkFile help.sh 
    checkFile exit.sh  
    if [[ check_var -eq 1 ]]
    then 
    echo -e '\033[1;5mPlease, enter...\033[0m'
    read
    fi
}
function Head_request(){
    echo "ENTER YOUR COMMAND"
    echo 
    echo "Use calculator (calc)"
    echo "Find word (search)"
    echo "Reverse one file (revers)"
    echo "Long of string (strlen)"
    echo " Read /var/log/anaconda/X.log (log)"
    echo "Glossary (help)"
    echo "Exit"
    echo "Write A,B,C..."
}

function Arguments_request(){
    echo "ENTER your arguments"
}

function DO(){
    for ((;;))
    do
    clear
    Head_request

    for ((;;))
    do
    read answer
        case $answer in
    A)      
        req='calc'
        break
        ;;
    B)
        req='search'
        break
        ;;
    C)
        req='reverse'
        break
        ;;
    D)
        req='strlen'
        break
        ;;
    E)
        req='log'
        break
        ;;
    G)
        clear
        echo "Enter your code: "
        read codeeeee
        re='^-?[0-9]+$'
        if ! [[ "$codeeeee" =~ $re || "$codeeeee" =~ $re && "$codeeeee" -gt 256 || "$codeeeee" =~ $re && "$codeeeee" -lt -256 ]]
        then ERROR_value
        fi
        if [ -z $codeeeee ]
        then 
        exit 0
        fi
        exit $codeeeee
        ;;
    F)
        req='help'
        break
        ;;
    *)
        echo "Incorrect inquiry! Please, write A,B,C"
        ;;
    esac
    done

    clear
    if [[ $answer = 'D' ]]
    then
    Enter_string
    read arg1 
    check_sym "$arg1"
    clear
    ./main.sh $req "$arg1" "int"
    echo "ENTER..."
    read
    continue
    fi

    if ! [[ $answer = 'F' || $answer = 'E' ]]
    then 
    Arguments_request
    read arg1 arg2 arg3
    fi

    clear
    ./main.sh $req $arg1 $arg2 $arg3

    echo "ENTER ..."
    read
    done 
}


echo !-interactive-!
checkALLFiles
DO
