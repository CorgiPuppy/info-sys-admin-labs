#!/bin/bash

declare -i YEAR=2025
declare -i MONTH=3
declare -i FIRST_LINE=1
declare -i LAST_LINE=4

set -v
cal -m $MONTH $YEAR | awk -v first_line="$FIRST_LINE" -v last_line="$LAST_LINE" 'NR>=first_line && NR<=last_line'

scrot -c -d 2 'task1.png' -e 'mv $f ./assets/';
