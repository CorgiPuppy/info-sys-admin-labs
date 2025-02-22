#!/bin/bash

declare FOLDER=/usr/share
declare FILE_NAME=djan.conf
declare FILE=$FOLDER/$FILE_NAME

if [ -f $FILE ]
then
	echo "sudo find $FOLDER -name "$FILE_NAME""
	sudo find $FOLDER -name "$FILE_NAME"
	
	echo "sudo mv $FILE $FOLDER/.$FILE_NAME"
	sudo mv $FILE $FOLDER/.$FILE_NAME 

	echo "sudo find $FOLDER -name ".$FILE_NAME""
	sudo find $FOLDER -name ".$FILE_NAME"
else
	echo "$FILE doesn't exist!"
fi
