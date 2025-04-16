#!/bin/bash

declare FOLDER=src/task3
declare MAIN_AWK_FILE_NAME=main.awk
declare MAIN_AWK_FILE=$FOLDER/$MAIN_AWK_FILE_NAME

declare RANDOM_AWK_FILE_NAME=random.awk
declare RANDOM_AWK_FILE=$FOLDER/$RANDOM_AWK_FILE_NAME

declare TARGET_FOLDER=$FOLDER/target
declare TARGET_FILE_NAME=input.txt
declare TARGET_FILE=$TARGET_FOLDER/$TARGET_FILE_NAME
declare -a operations=("+" "*" "/" "-")
declare min_number1=1.0
declare max_number1=5.0
declare min_number2=6.0
declare max_number2=10.0
declare -i AMOUNT_OF_EXPRESSIONS=${#operations[@]}

mkdir $TARGET_FOLDER

echo "#!/bin/awk

BEGIN {
	srand(seed)
	number = min + rand() * (max - min + 1.0)
	print number
}" > $RANDOM_AWK_FILE

for (( i=0; i<$AMOUNT_OF_EXPRESSIONS; i++ ))
do
	number1=`awk -v seed=$RANDOM -v min=$min_number1 -v max=$max_number1 -f $RANDOM_AWK_FILE`
	number2=`awk -v seed=$RANDOM -v min=$min_number2 -v max=$max_number2 -f $RANDOM_AWK_FILE`
	numberOfOperation=$(( $RANDOM % $AMOUNT_OF_EXPRESSIONS ))
	echo "$number1 ${operations[$numberOfOperation]} $number2" >> $TARGET_FILE
done

echo "cat $TARGET_FILE"
cat $TARGET_FILE

echo "#!/bin/awk

NR>=1 {
	switch (\$2) {
		case \"+\":
			answer = \$1 + \$3 
			print \$1, \$2, \$3, \"=\", answer
			break
		case \"*\":
			answer = \$1 * \$3 
			print \$1, \$2, \$3, \"=\", answer
			break
		case \"/\":
			answer = \$1 / \$3 
			print \$1, \$2, \$3, \"=\", answer
			break
		case \"-\":
			answer = \$1 - \$3 
			print \$1, \$2, \$3, \"=\", answer
			break
		default:
			break
	}
}" > $MAIN_AWK_FILE

echo "awk -f $MAIN_AWK_FILE $TARGET_FILE"
awk -f $MAIN_AWK_FILE $TARGET_FILE

rm $TARGET_FILE
rmdir $TARGET_FOLDER

scrot -c -d 2 'task3.png' -e 'mv $f ./assets/';
