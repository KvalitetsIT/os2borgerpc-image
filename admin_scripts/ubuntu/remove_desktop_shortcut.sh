#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo "This script takes exactly one parameter"
    exit -1

fi

FILENAME=$1
FILEPATH="/home/.skjult/Skrivebord/$FILENAME"

if [ -f $FILEPATH ]
then
    rm -f "/home/.skjult/Skrivebord/$FILENAME"
else
    echo "File does not exist"
    exit -1
fi



exit 0
