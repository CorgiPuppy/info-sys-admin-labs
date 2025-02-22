#!/bin/bash

declare FOLDER=src/task1/target
declare FILE=$FOLDER/file1.txt

if [ -f $FILE ]
then
	echo "rm $FILE"
	rm $FILE
	echo "ls $FOLDER"
	ls $FOLDER

	if [ -f $FILE ]
	then
		echo "rm -f $FILE"
		rm -f $FILE
		echo "ls $FOLDER"
		ls $FOLDER
	fi
else
	echo "$FILE doesn't exist!"
fi
