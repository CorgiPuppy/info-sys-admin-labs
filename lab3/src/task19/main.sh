#!/bin/bash

declare FOLDER_NAME=$HOME/bin
declare FILE_NAME=bubble
declare FILE=$FOLDER_NAME/$FILE_NAME
declare BASH_SCRIPT="#!/bin/bash\nls"
declare PATH_STRING="PATH=$PATH:$FILE"

echo "mkdir $FOLDER_NAME"
mkdir $FOLDER_NAME

echo "touch $FILE"
touch $FILE

echo "sudo chmod 744 $FILE"
sudo chmod 744 $FILE

echo "echo -e $BASH_SCRIPT > $FILE"
echo -e $BASH_SCRIPT > $FILE

echo "cd $FOLDER_NAME"
cd $FOLDER_NAME
echo "./$FILE_NAME"
./$FILE_NAME

echo "bubble"
bubble

echo "export PATH=$PATH:$FOLDER_NAME"
export PATH=$PATH:$FOLDER_NAME

echo "cd $FOLDER_NAME"
cd $FOLDER_NAME
echo "bubble"
bubble
