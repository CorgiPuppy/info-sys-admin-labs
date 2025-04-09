#!/bin/bash

declare TARGET_FOLDER=/
declare USR_FOLDER=/usr/
declare BIN_FOLDER=/bin/
declare TYPE=f
declare USER=u
declare SUID=s

echo "echo \"An amount of files: cut -d ' ' -f 1 <(wc -l <(sudo find $USR_FOLDER -type $TYPE -perm -$USER+$SUID 2>/dev/null))"\"
echo "An amount of files: `cut -d ' ' -f 1 <(wc -l <(sudo find $USR_FOLDER -type $TYPE -perm -$USER+$SUID 2>/dev/null))`"

echo "echo \"An amount of files: cut -d ' ' -f 1 <(wc -l <(sudo find $BIN_FOLDER -type $TYPE -perm -$USER+$SUID 2>/dev/null))"\"
echo "An amount of files: `cut -d ' ' -f 1 <(wc -l <(sudo find $BIN_FOLDER -type $TYPE -perm -$USER+$SUID 2>/dev/null))`"

echo "echo \"An amount of files: cut -d ' ' -f 1 <(wc -l <(sudo find $TARGET_FOLDER -type $TYPE -perm -$USER+$SUID 2>/dev/null))"\"
echo "An amount of files: `cut -d ' ' -f 1 <(wc -l <(sudo find $TARGET_FOLDER -type $TYPE -perm -$USER+$SUID 2>/dev/null))`"
