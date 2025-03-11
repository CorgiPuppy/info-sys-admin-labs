#!/bin bash

declare OUTPUT_FILE=task2.csv

set -v
find $HOME -type f -mmin -60 -ls | awk '{printf "%s,%s,%s,%s\n", $8, $9, $10, $11}' > $OUTPUT_FILE
scrot -c -d 9 'task2.png' -e 'mv $f ./assets/';
