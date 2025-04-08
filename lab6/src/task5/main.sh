#!/bin/bash

function listDir {
	echo "ls -ld $1"
	ls -ld $1
}

declare FOLDER_NAME=$HOME
declare DIR_NAME=mydir
declare DIR=$FOLDER_NAME/$DIR_NAME
declare TARGET_DIR_NAME=subdir
declare TARGET_DIR=$DIR/$TARGET_DIR_NAME
declare -i RIGHTS_DIR=700

echo "mkdir -p $TARGET_DIR"
mkdir -p $TARGET_DIR

listDir $TARGET_DIR

echo "chmod $RIGHTS_DIR $TARGET_DIR"
chmod $RIGHTS_DIR $TARGET_DIR

listDir $TARGET_DIR

rmdir $TARGET_DIR
rmdir $DIR
