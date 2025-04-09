#!/bin/bash

function listFile {
	echo "ls -l $1"
	ls -l $1
}

declare FOLDER_NAME=$HOME
declare FILE_NAME=example.txt
declare FILE=$FOLDER_NAME/$FILE_NAME
declare -i RIGHTS=600

touch $FILE

listFile $FILE

echo "chmod $RIGHTS $FILE"
chmod $RIGHTS $FILE

listFile $FILE

rm $FILE

scrot -c -d 2 'task2.png' -e 'mv $f ./assets/';
