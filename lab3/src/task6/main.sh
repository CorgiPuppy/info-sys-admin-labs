#!/bin/bash

declare FOLDER=src/task1/target
declare FILE_NAME=djan.conf
declare FILE=$FOLDER/$FILE_NAME

declare TARGET_FOLDER=/usr/share

if [ -f $FILE ]
then
	echo "mv $FILE $TARGET_FOLDER"
	mv $FILE $TARGET_FOLDER

	echo "sudo mv $FILE $TARGET_FOLDER"
	sudo mv $FILE $TARGET_FOLDER
	
	echo "sudo find $TARGET_FOLDER -name "$FILE_NAME""
	sudo find $TARGET_FOLDER -name "$FILE_NAME"
else
	echo "$FILE doesn't exist!"
fi
