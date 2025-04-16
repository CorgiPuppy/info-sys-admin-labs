#!/bin/bash

showFile() {
	echo "cat $1"
	cat $1
}

declare FOLDER=src/task1
declare SED_FILE_NAME=main.sed
declare SED_FILE=$FOLDER/$SED_FILE_NAME

declare TARGET_FOLDER=$FOLDER/target
declare -a FILES

declare -a content=("<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<div>
			<h2>This is a heading in a div element</h2>
			<p>This is some text in a div element.</p>
		</div>
	</body>
</html>" "<!DOCTYPE html>
<html>
	<head>
		<style>
			div {
				color: white;
				background-color: 009900;
				margin: 2px;
				font-size: 25px;
			}
		</style>
	</head>
	<body>
		<div> div tag </div>
		<div> div tag </div>
		<div> div tag </div>
		<div> div tag </div>
	</body>
</html>" "<!DOCTYPE html>
<html>
	<head>
		<link rel='stylesheet' href='color.css'>
	</head>
	<body>
		<center>
			<div>
				<caption>
					<h3>GEEKSFORGEEKS</h3>
				</caption>
				<h3>
					Inline CSS is not USED in THIS method.
				</h3>
			</div>
		</center>
	</body>
</html>")
declare -i AMOUNT_OF_FILES=${#content[@]}

declare SEARCH_REGEX_BEGIN_DIV="<div>"
declare REPLACEMENT="<p>"
declare SEARCH_REGEX_END_DIV="<\/div>"

mkdir $TARGET_FOLDER
for (( i=0; i<$AMOUNT_OF_FILES; i++))
do
	FILES[i]=$TARGET_FOLDER/file$i.html
	touch ${FILES[i]}
done

for (( i=0; i<$AMOUNT_OF_FILES; i++ ))
do
	index=$(( $RANDOM % $AMOUNT_OF_FILES ))
cat > "${FILES[i]}" << EOF
	${content[$index]}	
EOF
done

echo -e "s|$SEARCH_REGEX_BEGIN_DIV|$REPLACEMENT|g\ns|$SEARCH_REGEX_END_DIV||g" > $SED_FILE
for (( i=0; i<$AMOUNT_OF_FILES; i++ ))
do
	showFile ${FILES[i]}

	echo "sed -i -f $SED_FILE ${FILES[i]}"
	sed -i -f $SED_FILE ${FILES[i]}

	showFile ${FILES[i]}
done

for (( i=0; i<$AMOUNT_OF_FILES; i++ ))
do
	rm ${FILES[i]}
done
rmdir $TARGET_FOLDER

scrot -c -d 2 'task1.png' -e 'mv $f ./assets/';
