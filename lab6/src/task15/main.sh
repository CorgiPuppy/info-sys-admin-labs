#!/bin/bash

function getfaclDir {
	echo "getfacl 2>/dev/null $1"
	getfacl 2>/dev/null $1
}

declare FOLDER_NAME=$HOME
declare TARGET_DIR_NAME=test_dir
declare TARGET_DIR=$FOLDER_NAME/$TARGET_DIR_NAME
declare TARGET_FILE_NAME=file1.txt
declare TARGET_FILE=$TARGET_DIR/$TARGET_FILE_NAME
declare USER1=user1
declare SHELL_USER1=/sbin/nologin
declare CATALOG_USER1=/home/test1
declare USER2=user2
declare SHELL_USER2=/bin/bash
declare CATALOG_USER2=/home/user2
declare FOLDER_GROUPS=/etc/group
declare GROUP_NAME=mygroup
declare GROUP=g
declare RIGHTS_DIR=rx
declare DEFAULT_RIGHTS_DIR=rw

mkdir $TARGET_DIR
sudo useradd -s $SHELL_USER1 -m -d $CATALOG_USER1 $USER1
sudo useradd -s $SHELL_USER2 -m -d $CATALOG_USER2 $USER2
chmod 700 $TARGET_DIR
touch $TARGET_FILE
chmod u+rw,g=r $TARGET_FILE
setfacl -m u:$USER2:w $TARGET_FILE
setfacl -x u:$USER2 $TARGET_FILE
sudo groupadd $GROUP_NAME
sudo gpasswd -a $USER1 $GROUP_NAME
sudo gpasswd -a $USER2 $GROUP_NAME
setfacl -m $GROUP:$GROUP_NAME:$RIGHTS_DIR $TARGET_DIR

getfaclDir $TARGET_DIR
echo "setfacl -d -m $GROUP:$GROUP_NAME:$DEFAULT_RIGHTS_DIR $TARGET_DIR"
setfacl -d -m $GROUP:$GROUP_NAME:$DEFAULT_RIGHTS_DIR $TARGET_DIR
getfaclDir $TARGET_DIR

rm $TARGET_FILE
rmdir $TARGET_DIR
sudo userdel -r 2>/dev/null $USER1
sudo userdel -r 2>/dev/null $USER2
sudo groupdel $GROUP_NAME
