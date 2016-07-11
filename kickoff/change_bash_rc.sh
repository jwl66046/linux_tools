#!/usr/bin/env bash

# check to see if this script has run already and the .bashrc has my initials

if grep -q 'JWL' ~/.bashrc; then
	echo JWL was in .bashrc
else
	echo JWL was not in .bashrc
fi


# check to see if the backup folder exists


# if all is well, move .bashrc

# return exit code?


## LEAVE THIS OUT FOR NOW ## cp ~/.bashrc ~/zz_dot_bashrc




cp ~/linux_tools/dot_bashrc ~/.bashrc
source ~/.bashrc

