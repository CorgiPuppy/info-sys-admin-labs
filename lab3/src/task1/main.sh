#/bin/bash                                                                                 

declare FOLDER=src/task1/target
declare -i LEN=3
declare -a FILES

for (( i=0; i<$LEN; i++ ))
do
	FILES[i]=$FOLDER/file$i.txt
done

touch ${FILES[0]} && > ${FILES[1]} && nano ${FILES[2]} 

for (( i=0; i<$LEN; i++ ))
do
	echo -e "Welcome"'!'"\nThis is the file$i." > ${FILES[i]}
	cat ${FILES[i]}
done
