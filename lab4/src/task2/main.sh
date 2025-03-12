#!/bin bash

declare OUTPUT_DIR_NAME=outputs/task2
declare OUTPUT_FILE_NAME=output.csv
declare OUTPUT_FILE=$OUTPUT_DIR_NAME/$OUTPUT_FILE_NAME

set -v
pv $OUTPUT_FILE | find $HOME -type f -mmin -60 -ls | awk '{printf "%s,%s,%s,%s\n", $8, $9, $10, $11}' > $OUTPUT_FILE

scrot -c -d 2 'task2.png' -e 'mv $f ./assets/';
