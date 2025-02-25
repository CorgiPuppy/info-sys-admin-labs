#!/bin/bash

declare USER=student
declare FOLDER_NAME=/tmp
declare FIRST_FILE_NAME=PAPKA1
declare SECOND_FILE_NAME=PAPKA2
declare TARGET_FIRST_FILE=$FOLDER_NAME/$FIRST_FILE_NAME
declare TARGET_SECOND_FILE=$FOLDER_NAME/$FIRST_SECOND_NAME

echo "sudo --user $USER" 
sudo --user $USER bash << EOF
	echo "find 2>/dev/null $FOLDER_NAME -name $FIRST_FILE_NAME"
	find 2>/dev/null $FOLDER_NAME -name $FIRST_FILE_NAME

	echo "find 2>/dev/null $FOLDER_NAME -name $SECOND_FILE_NAME"
	find 2>/dev/null /tmp -name $SECOND_FILE_NAME

	echo "rm $TARGET_FIRST_FILE $TARGET_SECOND_FILE"
	rm $TARGET_FIRST_FILE $TARGET_SECOND_FILE

	echo "rm $TARGET_FIRST_FILE"
	rm $TARGET_FIRST_FILE

	echo "rm $TARGET_SECOND_FILE"
	rm $TARGET_SECOND_FILE
EOF
