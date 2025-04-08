#!/bin/bash

function listFile {
	echo "ls -l $1"
	ls -l $1
}

function listDir {
	echo "ls -ld $1"
	ls -ld $1
}

declare FOLDER_NAME=$HOME
declare TARGET_DIR_NAME=mydir
declare TARGET_DIR=$FOLDER_NAME/$TARGET_DIR_NAME
declare -i RIGHTS_DIR=755
declare TARGET_FILE_NAME=file2.txt
declare TARGET_FILE=$TARGET_DIR/$TARGET_FILE_NAME
declare HELLO_TEXT="Hello, World!"
declare	BYE_TEXT="Bye, World!" 
declare -i RIGHTS_FILE=400

echo "mkdir $TARGET_DIR"
mkdir $TARGET_DIR

listDir $TARGET_DIR

echo "chmod $RIGHTS_DIR $TARGET_DIR"
chmod $RIGHTS_DIR $TARGET_DIR

listDir $TARGET_DIR

echo "echo \"$HELLO_TEXT\" > $TARGET_FILE"
echo $HELLO_TEXT > $TARGET_FILE

echo "cat $TARGET_FILE"
cat $TARGET_FILE

listFile $TARGET_FILE

echo "echo \"$BYE_TEXT\" > $TARGET_FILE"
echo $BYE_TEXT > $TARGET_FILE
echo "cat $TARGET_FILE"
cat $TARGET_FILE
echo "I can write to the file because of access rights."

echo "chmod $RIGHTS_FILE $TARGET_FILE"
chmod $RIGHTS_FILE $TARGET_FILE

listFile $TARGET_FILE

echo "echo \"$HELLO_TEXT\" > $TARGET_FILE"
echo $HELLO_TEXT > $TARGET_FILE
echo "I can't write to the file because of access rights."

echo "rm $TARGET_FILE"
rm $TARGET_FILE
echo "I can't remove the file by using simple 'rm' command as it's a read-only file with means it's write-protected."

chmod 644 $TARGET_FILE
rm $TARGET_FILE
rmdir $TARGET_DIR
