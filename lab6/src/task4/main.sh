#!/bin/bash

function listFile {
	echo "ls -l $1"
	ls -l $1
}

declare FOLDER_NAME=$HOME
declare TARGET_DIR_NAME=mydir
declare TARGET_DIR=$FOLDER_NAME/$TARGET_DIR_NAME
declare TARGET_FILE_NAME=script.sh
declare TARGET_FILE=$TARGET_DIR/$TARGET_FILE_NAME
declare USER=u
declare GROUP_OTHER=go
declare RIGHTS_FILE=rwx

echo "mkdir $TARGET_DIR"
mkdir $TARGET_DIR

echo "touch $TARGET_FILE"
touch $TARGET_FILE

listFile $TARGET_FILE

echo "chmod $USER+$RIGHTS_FILE,$GROUP_OTHER-$RIGHTS_FILE $TARGET_FILE"
chmod $USER+$RIGHTS_FILE,$GROUP_OTHER-$RIGHTS_FILE $TARGET_FILE

listFile $TARGET_FILE

rm $TARGET_FILE
rmdir $TARGET_DIR
