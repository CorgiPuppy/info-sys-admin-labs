#!/bin/bash

function listFile {
	echo "ls -l $1"
	ls -l $1
}

declare FOLDER_NAME=$HOME
declare FILE_NAME=example.txt
declare FILE=$FOLDER_NAME/$FILE_NAME
declare -i RIGHTS=644

echo "touch $FILE"
touch $FILE

listFile $FILE

echo "chmod $RIGHTS $FILE"
chmod $RIGHTS $FILE

listFile $FILE
