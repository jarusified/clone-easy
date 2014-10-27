#!/bin/sh

dirExist(){
	if [ -d "./$DIR/.git" ]; then
		echo "Repository already exists, aborting"
		exit 1
	fi
}

repoExist(){
	cmd=$(git ls-remote git@github.com:$USER/$DIR.git 2> /dev/null)	
	if [[ $cmd ]]; then
		echo "FATAL : No such repository exists"
		exit 1
	fi
}

REPO=$(test -z "$*" && echo "." || echo "$*")

IFS='/' read -a array <<< "$REPO"
NAME=${array[0]}
DIR=${array[1]}

if [[ $REPO == [A-Za-z0-9]*\/[A-Za-z0-9]* ]]; 
	then 
		dirExist \
		&& repoExist \
		&& $(git clone https://github.com/$REPO 2> /dev/null)
		echo "git :: $NAME/$DIR has been cloned"
	else
		echo "Error"
fi
