#!/bin/bash

function catUser {
	echo "grep $1 <(cat $FOLDER_USERS)"
	grep $1 <(cat $FOLDER_USERS) 
}

declare USER1=user1
declare SHELL_USER1=/sbin/nologin
declare CATALOG_USER1=/home/test1
declare USER2=user2
declare SHELL_USER2=/bin/bash
declare CATALOG_USER2=/home/user2
declare FOLDER_USERS=/etc/passwd

echo "sudo useradd -s $SHELL_USER1 -m -d $CATALOG_USER1 $USER1"
sudo useradd -s $SHELL_USER1 -m -d $CATALOG_USER1 $USER1

catUser $USER1

echo "sudo useradd -s $SHELL_USER2 -m -d $CATALOG_USER2 $USER2"
sudo useradd -s $SHELL_USER2 -m -d $CATALOG_USER2 $USER2

catUser $USER2

sudo userdel -r 2>/dev/null $USER1
sudo userdel -r 2>/dev/null $USER2
