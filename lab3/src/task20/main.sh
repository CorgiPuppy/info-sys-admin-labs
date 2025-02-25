#!/bin/bash

declare CURRENT_FOLDER=src/task20/target
declare -i LEN=3
declare -a FILES
declare TARGET_FOLDER_NAME=tarball
declare TARGET_FOLDER=$CURRENT_FOLDER/$TARGET_FOLDER_NAME

for (( i=0; i<$LEN; i++ ))
do
	FILES[i]=$CURRENT_FOLDER/file$i
	echo "touch ${FILES[$i]}"
	touch ${FILES[$i]}
done

echo "tar --totals -cvjf $TARGET_FOLDER ${FILES[0]} ${FILES[1]} ${FILES[2]}"
tar --totals -cvjf $TARGET_FOLDER ${FILES[0]} ${FILES[1]} ${FILES[2]}

echo "ls -l $TARGET_FOLDER"
ls -l $CURRENT_FOLDER
