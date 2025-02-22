#!/bin/bash

declare CURRENT_DIR=$PWD
declare TARGET_FOLDER=/usr/share
declare FILE_NAME=.djan.conf
declare FILE=$TARGET_FOLDER/$FILE_NAME

if [ -f $FILE ]
then
	echo "cd ~"
	cd ~

	echo "ls -la $TARGET_FOLDER/$FILE_NAME"
	ls -la $TARGET_FOLDER/$FILE_NAME

	cd $CURRENT_DIR
else
	echo "$FILE doesn't exists!"
fi
