#!/bin/sh

direxist(){
	if [ -d "./$DIR/.git" ]; then
		echo "repo already exists, aborting"
		exit 1
	fi
}

REPO=$(test -z "$*" && echo "." || echo "$*")

IFS='/' read -a array <<< "$REPO"
NAME=${array[0]}
DIR=${array[1]}

if [[ $REPO == [A-Za-z0-9]*\/[A-Za-z0-9]* ]]; 
	then 
		direxist \
		&& git clone https://github.com/$REPO
	else
		echo "Wrong name"
fi
