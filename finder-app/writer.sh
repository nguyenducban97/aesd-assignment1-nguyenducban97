#!/bin/sh
# Declare variables
writefile=$1
writestr=$2
dirname=$(dirname "$writefile")

if [ -z $writefile ] || [ -z $writestr ]
then
    echo "writefile or writestr were not specified."
    exit 1
fi

if [ ! -d $dirname ]
then
    mkdir -p $dirname
    touch $writefile
    if [ $? -ne 0 ]
    then
        echo "The file could not be created"
        exit 1
    fi
fi
echo $writestr > $writefile
