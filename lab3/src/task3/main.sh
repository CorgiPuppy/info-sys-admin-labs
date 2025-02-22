#!/bin/bash                                                                                 

declare -f list_file
list_file () {
	declare file=$1
	echo "ls -l $file"
	ls -l $file
}

declare FOLDER=src/task1/target
declare FILE=$FOLDER/file1.txt

if [ -f $FILE ]
then 
	list_file $FILE
	echo "sudo chown root:root $FILE"
	sudo chown root:root $FILE
	list_file $FILE
	echo "sudo chmod 700 $FILE"
	sudo chmod 700 $FILE
	list_file $FILE
else
	echo "$FILE doesn't exist!"
fi
