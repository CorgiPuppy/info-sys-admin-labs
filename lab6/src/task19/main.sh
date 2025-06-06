#!/bin/bash

declare TARGET_FOLDER=/
declare TYPE=f
declare USER=u
declare SUID=s

echo "echo \"An amount of files: cut -d ' ' -f 1 <(wc -l <(sudo find $TARGET_FOLDER -type $TYPE -perm -$USER+$SUID 2>/dev/null))"\"
echo "An amount of files: `cut -d ' ' -f 1 <(wc -l <(sudo find $TARGET_FOLDER -type $TYPE -perm -$USER+$SUID 2>/dev/null))`"

scrot -c -d 2 'task19.png' -e 'mv $f ./assets/';
