#!/bin/bash

function listFile {
	echo "ls -l $1"
	ls -l $1
}

declare -f listDir
listDir() {
	echo "ls -ld $1"
	ls -ld $1
}

declare FOLDER_NAME=$HOME
declare TARGET_DIR_NAME=test_dir
declare TARGET_DIR=$FOLDER_NAME/$TARGET_DIR_NAME
declare TARGET_FILE_NAME=file1.txt
declare TARGET_FILE=$TARGET_DIR/$TARGET_FILE_NAME
declare USER=u
declare GROUP_OTHER=go
declare -i RIGHTS_DIR=700
declare RIGHTS_FILE_USER=rw
declare RIGHTS_FILE_GROUP_OTHER=r

echo "mkdir $TARGET_DIR"
mkdir $TARGET_DIR

listDir $TARGET_DIR

echo "chmod $RIGHTS_DIR $TARGET_DIR"
chmod $RIGHTS_DIR $TARGET_DIR

listDir $TARGET_DIR

echo "touch $TARGET_FILE"
touch $TARGET_FILE

listFile $TARGET_FILE

echo "chmod $USER+$RIGHTS_FILE_USER,$GROUP_OTHER=$RIGHTS_FILE_GROUP_OTHER $TARGET_FILE"
chmod $USER+$RIGHTS_FILE_USER,$GROUP_OTHER=$RIGHTS_FILE_GROUP_OTHER $TARGET_FILE

listFile $TARGET_FILE

rm $TARGET_FILE
rmdir $TARGET_DIR

scrot -c -d 2 'task10.png' -e 'mv $f ./assets/';
