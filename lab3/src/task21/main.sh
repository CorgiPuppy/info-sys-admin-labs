#!/bin/bash

declare ARCHIVE_FOLDER=src/task20/target
declare ARCHIVE_NAME=tarball
declare ARCHIVE=$ARCHIVE_FOLDER/$ARCHIVE_NAME
declare CURRENT_FOLDER=src/task21/target
declare TARGET_FOLDER_NAME=PAPKA3
declare TARGET_FOLDER=$CURRENT_FOLDER/$TARGET_FOLDER_NAME

echo "mkdir -p $TARGET_FOLDER"
mkdir -p $TARGET_FOLDER

echo "tar --strip-components=3 -xjvf $ARCHIVE -C $TARGET_FOLDER"
tar --strip-components=3 -xjvf "$ARCHIVE" -C "$TARGET_FOLDER"

echo "ls -l $TARGET_FOLDER"
ls -l $TARGET_FOLDER
