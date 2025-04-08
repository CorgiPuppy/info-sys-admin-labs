#!/bin/bash

function listFile {
	echo "ls -l $1"
	ls -l $1
}

declare -f getfaclFile 
getfaclFile() {
	echo "getfacl 2>/dev/null $1"
	getfacl 2>/dev/null $1
}

declare FOLDER_NAME=$HOME
declare TARGET_DIR_NAME=test_dir
declare TARGET_DIR=$FOLDER_NAME/$TARGET_DIR_NAME
declare TARGET_FILE_NAME=file1.txt
declare TARGET_FILE=$TARGET_DIR/$TARGET_FILE_NAME
declare USER2=user2
declare SHELL_USER2=/bin/bash
declare CATALOG_USER2=/home/user2
declare FOLDER_USERS=/etc/passwd
declare USER=u
declare RIGHTS=w

mkdir $TARGET_DIR
sudo useradd -s $SHELL_USER2 -m -d $CATALOG_USER2 $USER2
chmod 700 $TARGET_DIR
touch $TARGET_FILE
chmod u+rw,g=r $TARGET_FILE

listFile $TARGET_FILE
getfaclFile $TARGET_FILE

echo "setfacl -m $USER:$USER2:$RIGHTS $TARGET_FILE"
setfacl -m $USER:$USER2:$RIGHTS $TARGET_FILE

listFile $TARGET_FILE
getfaclFile $TARGET_FILE

rm $TARGET_FILE
rmdir $TARGET_DIR
sudo userdel -r 2>/dev/null $USER1
sudo userdel -r 2>/dev/null $USER2
