#/bin/bash                                                                                 

declare FOLDER=src/task1/target

declare -i rand_numb=$(( 0 + $RANDOM % 1 ))
declare FILE=$FOLDER/file$rand_numb.txt

if [ -f $FILE ]
then 
	rm $FILE
	ls $FOLDER
else
	echo "$FILE doesn't exist!"
fi
