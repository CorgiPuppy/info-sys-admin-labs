#!/bin/bash

declare -i max_cd=4

for (( i=0; i<$max_cd; i++ ))
do
	echo "cd -"
	cd -
done
