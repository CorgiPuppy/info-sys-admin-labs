#!/bin/bash                                                                                 

declare FOLDER=src/task1/target

declare FILE=$FOLDER/file0.txt

if [ -f $FILE ]
then 
	echo ls $FOLDER
	ls $FOLDER

	echo "rm $FILE"
	rm $FILE

	echo ls $FOLDER
	ls $FOLDER
else
	echo "$FILE doesn't exist!"
fi
