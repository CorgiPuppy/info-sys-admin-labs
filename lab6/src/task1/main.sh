#!/bin/bash

function showFile {
	echo "ls -l $1"
	ls -l $1
}

declare FOLDER_NAME=$HOME
declare FILE_NAME=example.txt
declare FILE=$FOLDER_NAME/$FILE_NAME

echo "touch $FILE"
touch $FILE

showFile $FILE

echo "chmod 644 $FILE"
chmod 644 $FILE

showFile $FILE

echo "rm $FILE"
rm $FILE
