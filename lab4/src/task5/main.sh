#!/bin/bash

declare FOLDER_NAME=/usr/lib
declare TARGET_FOLDER_NAME=outputs/task5
declare TARGET_FILE_NAME=superdebug
declare TARGET_FILE=$TARGET_FOLDER_NAME/$TARGET_FILE_NAME

set -v
find $FOLDER_NAME -type f -name '????????????' -exec cat {} + > $TARGET_FILE
wc -l $TARGET_FILE

scrot -c -d 2 'task5.png' -e 'mv $f ./assets/';
