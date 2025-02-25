#!/bin/bash

declare BASHRC_FILE=~/.bashrc
declare HISTSIZE_VALUE=$(grep -E "^HISTSIZE=" $BASHRC_FILE | cut -d '=' -f 2)
declare HISTFILESIZE_VALUE=$(grep -E "^HISTFILESIZE=" $BASHRC_FILE | cut -d '=' -f 2)

if [[ -n $HISTSIZE_VALUE ]]
then
	declare HISTSIZE=$(expr 10 \* $HISTSIZE_VALUE)
else
	declare HISTSIZE=1000
fi

if [[ -n $HISTFILESIZE_VALUE ]]
then
	declare HISTFILESIZE=$(expr 10 \* $HISTFILESIZE_VALUE)
else
	declare HISTFILESIZE=1000
fi

if grep -q "^HISTSIZE=" $BASHRC_FILE
then
	echo "sed -i "s/^HISTSIZE=.*/HISTSIZE=$HISTSIZE/" $BASHRC_FILE"
	sed -i "s/^HISTSIZE=.*/HISTSIZE=$HISTSIZE/" $BASHRC_FILE
else
	echo "echo "HISTSIZE=$HISTSIZE" >> $BASHRC_FILE"
	echo "HISTSIZE=$HISTSIZE" >> $BASHRC_FILE
fi

if grep -q "^HISTFILESIZE=" $BASHRC_FILE
then
	echo "sed -i "s/^HISTFILESIZE=.*/HISTFILESIZE=$HISTFILESIZE/" $BASHRC_FILE"
	sed -i "s/^HISTFILESIZE=.*/HISTFILESIZE=$HISTFILESIZE/" $BASHRC_FILE
else
	echo "echo "HISTFILESIZE=$HISTFILESIZE" >> $BASHRC_FILE"
	echo "HISTFILESIZE=$HISTFILESIZE" >> $BASHRC_FILE
fi

if grep -q "^export HISTSIZE=" $BASHRC_FILE
then
	echo "sed -i "s/^export HISTSIZE=.*/export HISTSIZE=$HISTSIZE/" $BASHRC_FILE"
	sed -i "s/^export HISTSIZE=.*/export HISTSIZE=$HISTSIZE/" $BASHRC_FILE
else
	echo "echo "export HISTSIZE=$HISTSIZE" >> $BASHRC_FILE"
    echo "export HISTSIZE=$HISTSIZE" >> $BASHRC_FILE
fi

if grep -q "^export HISTFILESIZE=" $BASHRC_FILE
then
	echo "sed -i "s/^export HISTFILESIZE=.*/export HISTFILESIZE=$HISTFILESIZE/" $BASHRC_FILE"
	sed -i "s/^export HISTFILESIZE=.*/export HISTFILESIZE=$HISTFILESIZE/" $BASHRC_FILE
else
	echo "echo "export HISTFILESIZE=$HISTFILESIZE" >> $BASHRC_FILE"	
    echo "export HISTFILESIZE=$HISTFILESIZE" >> $BASHRC_FILE
fi

echo "source $BASHRC_FILE"
source $BASHRC_FILE

echo "tail -4 $BASHRC_FILE"
tail -4 $BASHRC_FILE
