#/bin/bash                                                                                 

declare FOLDER=src/task1/target

declare FILE=$FOLDER/file2.txt

if [ -f $FILE ]
then 
	chown root:root $FILE 
else
	echo "$FILE doesn't exist!"
fi
