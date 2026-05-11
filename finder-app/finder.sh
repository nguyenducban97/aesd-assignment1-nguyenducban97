#!/bin/sh
# Declare variables
filesdir=$1
searchstr=$2

if [ -z $filesdir ] || [ -z $searchstr ]
then
    echo "filesdir or searchstr were not specified."
    exit 1
elif [ ! -d $filesdir ]
then
    echo "$filesdir is not file or directory."
    exit 1
else
    matchcount=0
    totalcount=0
    numfiles=0
    numfiles=$(find -L $filesdir -type f | wc -l)
    filenames=$(find -L $filesdir -type f)
    for file in $filenames; do
        matchcount=$(grep -c $searchstr $file)
        totalcount=$((totalcount+$matchcount))
    done

    echo "The number of files are $numfiles and the number of matching lines are $totalcount"
fi
