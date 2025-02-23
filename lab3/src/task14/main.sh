#!/bin/bash

declare USER=root
declare FOLDER_NAME=PAPKA2/PAPKA3
declare FOLDER=/tmp
declare TARGET_FOLDER=$FOLDER/$FOLDER_NAME
declare FILE_NAME=file.txt
declare FROM_FOLDER=/etc/hosts
declare TARGET_FILE=$TARGET_FOLDER/$FILE_NAME
declare -i LINES=10

echo "sudo --user $USER"
sudo --user $USER bash << EOF
	echo "mkdir -p $TARGET_FOLDER"
	mkdir -p $TARGET_FOLDER

	echo "tail --lines=$LINES $FROM_FOLDER > $TARGET_FILE"
	tail --lines=$LINES $FROM_FOLDER > $TARGET_FILE
	
	echo "cat $TARGET_FILE"
	cat $TARGET_FILE

	echo "exit"
	exit
EOF
