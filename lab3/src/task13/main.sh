#!/bin/bash

declare USER=student
declare FOLDER_NAME=PAPKA1
declare FOLDER=/tmp
declare TARGET_FOLDER=$FOLDER/$FOLDER_NAME

echo "sudo --user $USER"
sudo --user $USER bash << EOF
	echo "mkdir "$TARGET_FOLDER""
	mkdir $TARGET_FOLDER

	echo "ls -l $FOLDER"
	ls -l $FOLDER
EOF
