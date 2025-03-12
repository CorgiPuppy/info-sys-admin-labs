#!/bin/bash

declare TARGET_DIR=/usr/src/
declare OUTPUT_DIR_NAME=outputs/task3
declare OUTPUT_FILE_NAME_1=source_begin.dat
declare OUTPUT_FILE_NAME_2=source_whole.dat
declare OUTPUT_FILE_NAME_3=source_end.dat
declare OUTPUT_FILE_1=$OUTPUT_DIR_NAME/$OUTPUT_FILE_NAME_1
declare OUTPUT_FILE_2=$OUTPUT_DIR_NAME/$OUTPUT_FILE_NAME_2
declare OUTPUT_FILE_3=$OUTPUT_DIR_NAME/$OUTPUT_FILE_NAME_3
declare TEMP_FILE=file.txt

set -v
grep -R -a -E ^source $TARGET_DIR | awk '{counts[$1]++} END{for (c in counts) print c, counts[c]}' > $TEMP_FILE
cat $TEMP_FILE | awk '{sum+=$2} END{print sum}' > $OUTPUT_FILE_1
rm $TEMP_FILE

grep -R -a -E source $TARGET_DIR | awk '{counts[$1]++} END{for (c in counts) print c, counts[c]}' > $TEMP_FILE
cat $TEMP_FILE | awk '{sum+=$2} END{print sum}' > $OUTPUT_FILE_2
rm $TEMP_FILE

grep -R -a -E source$ $TARGET_DIR | awk '{counts[$1]++} END{for (c in counts) print c, counts[c]}' > $TEMP_FILE
cat $TEMP_FILE | awk '{sum+=$2} END{print sum}' > $OUTPUT_FILE_3
rm $TEMP_FILE

scrot -c -d 2 'task3.png' -e 'mv $f ./assets/';
