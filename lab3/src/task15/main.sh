#!/bin/bash

declare USER=student
declare FILE_NAME="4!!4.txt"
declare DIR=/tmp
declare FOLDER_NAME=PAPKA1
declare TARGET_FOLDER=$DIR/$FOLDER_NAME
declare TARGET_FILE=$TARGET_FOLDER/$FILE_NAME
declare BASHRC="~/.bashrc"
declare -i LINES=10

echo "sudo --user $USER"
sudo --user $USER bash << EOF
	echo "tail --lines=$LINES $BASHRC > $TARGET_FILE"
	tail --lines=$LINES $BASHRC > $TARGET_FILE

	echo "cat $TARGET_FILE"
	cat $TARGET_FILE

	echo "find $TARGET_FOLDER -name "$FILE_NAME""
 	find $TARGET_FOLDER -name "$FILE_NAME"

	echo "tail --lines=$LINES $BASHRC >> $TARGET_FILE"
	head --lines=$LINES $BASHRC >> $TARGET_FILE

	echo "cat $TARGET_FILE"
	cat $TARGET_FILE
EOF
