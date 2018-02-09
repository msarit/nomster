#!/bin/bash

# This script executes the Git Workflow

echo "Type your commit message:"
echo "(no quotation marks)"
read commitmsg

if [ -z "$commitmsg" ]; then
	echo "You did not include a commit message"
	sleep 1
	echo "Exiting script now..."
	sleep 1
	exit
else
	git add --all
	git commit -am "$commitmsg"
	git push

fi
