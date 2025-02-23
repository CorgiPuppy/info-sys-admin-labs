#!/bin/bash

declare USER=student
declare BASH=/bin/bash

echo "sudo useradd --create-home --shell $BASH --user-group $USER"
sudo useradd --create-home --shell $BASH --user-group $USER

echo "sudo passwd $USER"
sudo passwd $USER

echo "sudo --user $USER"
sudo --user $USER bash -c '
	echo "sudo pacman -S gnuplot"
	sudo pacman -S gnuplot	
'
