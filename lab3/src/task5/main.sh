#!/bin/bash

declare FOLDER=src/task1/target
declare FILE=$FOLDER/file2.txt
declare TARGET_FILE=djan.conf

if [ -f $FILE ]
then	
	echo "ls $FOLDER"
	ls $FOLDER

	mv $FILE $FOLDER/$TARGET_FILE

	echo "ls $FOLDER"
	ls $FOLDER
else
	echo "$FILE doesn't exist!"
fi
