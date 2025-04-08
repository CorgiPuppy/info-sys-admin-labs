#!/bin/bash

declare INPUT_FILE=src/task2/input.txt
declare -i var=`cut -d ' ' -f 1 <(wc -l $INPUT_FILE)`
declare -i randomLine
declare -a answerReal
declare -a answerSuggested
usingLetters=""

if test -e $INPUT_FILE
then
	varTemp="t"
	varExit="q"

	while [ "$varTemp" != "$varExit" ]
	do
		randomLine=$(($RANDOM % $var + 1))
		answerRealString=`cut -d '|' -f 1 <(tail -1 <(head -n $randomLine <(cat $INPUT_FILE)))`
		task=`cut -d '|' -f 2 <(tail -1 <(head -n $randomLine <(cat $INPUT_FILE)))`
		echo "Task: $task."

		for (( i=0; i<${#answerRealString}; i++ ))
		do	
			answerReal[$i]=${answerRealString:i:1}
			answerSuggested[$i]="_"
		done

		echo "1. Amount of characters: ${answerSuggested[@]}."	

		while [[ "${answerSuggested[@]}" != "${answerReal[@]}" ]]
		do
			read -p "2. Suggest your letter: " suggestedLetter
			if [[ ${#suggestedLetter} -eq 1 ]]
			then
				if [[ $usingLetters != *$suggestedLetter* ]]
				then
					usingLetters="${usingLetters}${suggestedLetter:0:1}"

					if [[ ${answerReal[@]} =~ $suggestedLetter ]]
					then
						echo "'$suggestedLetter' was found."
						for index in `seq ${#answerReal[@]}`
						do
							char="${answerRealString:(( index - 1 )):1}"
							[[ "$char" != "$suggestedLetter" ]] && continue || answerSuggested[index - 1]=$char
						done
					else
						echo "'$suggestedLetter' wasn't not found."
					fi

					echo ${answerSuggested[@]}
				else
					echo "You have already called '$suggestedLetter'!"
				fi
			else
				echo "You've called too much letters!"
			fi
		done

		while [[ -n ${answerSuggested[@]} ]]
		do
			answerSuggested=("${answerSuggested[@]:1}")	
		done	
		while [[ -n ${answerReal[@]} ]]
		do
			answerReal=("${answerReal[@]:1}")	
		done	
		usingLetters=""	

		echo "3. If you want to exit you can enter 'q':"
		read varTemp
	done
else
	echo "$INPUT_FILE doesn't exist!"
fi
