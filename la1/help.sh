#! /usr/bin/env bash
function ERROR_arguments(){
    echo "ERROR ARGUMENT"
    exit -1
}

function check_correct(){
    if [[ -n $2 ]]
    then ERROR_arguments
    fi
}

function DO(){
  echo "calc is Calculator. operation: sum/sub/mul/div and needs two integers"
  echo "search is Searching in directory. Print directory"
  echo "reverse is Reverse printing file in other file. Print names of this files"
  echo "strlen is counting of the words in string"
  echo "log is Printing logs from: /var/log/anaconda/X.log"
  echo "exit is Exit with your code"
  echo "help is Helping you with this add"
  echo "interactive is Interactive mode"
  echo "Код ошибки -1 Incorrect argument or their numbers"
  echo "Код ошибки -2 Incorrect inquiry"
  echo "Код ошибки -3 Incorrect type of arguments"
  echo "Код ошибки -4 Calculating error"
  echo "Код ошибки -5 Access error"
}
 
check_correct $@
DO
