#!/bin/bash

#MODIFY MESSAGE COMMIT FILE
write_file () {
	FILE_PATH=$1
	COMMIT_CONTENT=$(cat $FILE_PATH)
	MODIFIED_COMMIT_STRING="[$NUMBER] $COMMIT_CONTENT"
	echo $MODIFIED_COMMIT_STRING > $FILE_PATH
	COMMIT_NEW_CONTENT=$(cat $FILE_PATH)
}

#COMMIT FILE PATH
FILE_PATH=$1
#GIT OPERATIONS
CURRENT_BRANCH="$(git symbolic-ref --short HEAD)"
#FEATURE NUMBER
NUMBER=$(echo $CURRENT_BRANCH  | cut -d '/' -f 2)

#RENAME COMMIT
write_file $FILE_PATH