#!/usr/bin/env bash

## Create variables for the script
BASHRC=~/.bashrc
RCKEY=JWL
BACKUPDIR=~/zz_backups/
NEWRC=~/linux_tools/kickoff/assets/dot_bashrc


# check to see if this .bashrc has already been updated
if [ -f ~/.bashrc ] &&  grep -q $RCKEY $BASHRC; then
    echo "$RCKEY was found in $BASHRC.
Exiting with Status 0.
Have a nice day!"
    exit 0
else
	echo "$RCKEY was not in $BASHRC... executing next set of commands"
fi


# check to see if the backup folder exists
echo "Beginning check for backup folder -- $BACKUPDIR"

if [ -d ~/zz_backups ]; then
    echo "$BACKUPDIR folder exists!"

else
    echo "$BACKUPDIR was not there! Creating directory!"
    mkdir $BACKUPDIR
fi


# Move existing user .bashrc to the backup directory
echo "Copying the existing user .bashrc to the backup directory"
cp $BASHRC $BACKUPDIR


# Move preferred bashrc into user home directory & Check work!
echo "Copying preferred bashrc into home directory."
cp $NEWRC $BASHRC
if grep -q $RCKEY $BASHRC; then
    echo "The copy appeared to be successful!
Please note any open terminal windows will need to be closed to update."
    source $BASHRC
else
    echo "There was apparently an error with the copy command!
Exiting script with error status 1"
    exit 1
fi


# This is the end!
echo "Looks like we're all done here!"
exit 0
