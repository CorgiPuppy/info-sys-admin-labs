#!/bin/bash

declare FOLDER_NAME=/tmp
declare FILE_NAME=.X0-lock
declare FILE=$FOLDER_NAME/$FILE_NAME
declare TARGET_FOLDER_NAME=$HOME
declare TARGET_FILE=$TARGET_FOLDER_NAME/$FILE_NAME

set -x
ln -s $FILE $TARGET_FILE
cat $TARGET_FILE
rm $TARGET_FILE

scrot -c -d 2 'task4.png' -e 'mv $f ./assets/';
