#!/bin/bash

function listFile {
	echo "ls -l $1"
	ls -l $1
}

declare -f getfaclFile 
getfaclFile() {
	echo "getfacl $1"
	getfacl 2>/dev/null $1
}

declare FOLDER_NAME=$HOME
declare TARGET_FILE_NAME=file1.txt
declare TARGET_FILE=$FOLDER_NAME/$TARGET_FILE_NAME
declare USER2=user2
declare SHELL_USER2=/bin/bash
declare CATALOG_USER2=/home/user2
declare FOLDER_USERS=/etc/passwd
declare USER=u
declare RIGHTS=w

sudo useradd -s $SHELL_USER2 -m -d $CATALOG_USER2 $USER2

echo "touch $TARGET_FILE"
touch $TARGET_FILE

listFile $TARGET_FILE
getfaclFile $TARGET_FILE

echo "setfacl -m $USER:$USER2:$RIGHTS $TARGET_FILE"
setfacl -m $USER:$USER2:$RIGHTS $TARGET_FILE

listFile $TARGET_FILE
getfaclFile $TARGET_FILE

rm $TARGET_FILE
sudo userdel -r 2>/dev/null $USER1
sudo userdel -r 2>/dev/null $USER2
