#!/bin/bash

function listDir {
	echo "ls -ld $1"
	ls -ld $1
}

declare FOLDER_NAME=$HOME
declare TARGET_DIR_NAME=mydir
declare TARGET_DIR=$FOLDER_NAME/$TARGET_DIR_NAME
declare TARGET_FILE_NAME=file3.txt
declare TARGET_FILE=$TARGET_DIR/$TARGET_FILE_NAME
declare HELLO_TEXT="Hello, World!"
declare BYE_TEXT="Bye, World!"
declare -i RIGHTS_DIR=600

echo "mkdir $TARGET_DIR"
mkdir $TARGET_DIR

echo "echo \"$HELLO_TEXT\" > $TARGET_FILE"
echo "$HELLO_TEXT" > $TARGET_FILE

listDir $TARGET_DIR

echo "chmod $RIGHTS_DIR $TARGET_DIR"
chmod $RIGHTS_DIR $TARGET_DIR

listDir $TARGET_DIR

echo "rm $TARGET_FILE"
rm $TARGET_FILE
echo "I can't remove the file because of access rights of the dir."

echo "echo \"$BYE_TEXT\" > $TARGET_FILE"
echo "$BYE_TEXT" > $TARGET_FILE
echo "I can't write to the file because of access rights of the dir."

chmod 755 $TARGET_DIR
rm $TARGET_FILE
rmdir $TARGET_DIR
