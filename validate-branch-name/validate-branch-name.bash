#!/bin/bash

CURRENT_BRANCH="$(git symbolic-ref --short HEAD)"
REGEX="^(feature|bug)/[0-9]*$"

#VALIDATE BRANCH REGEX
if [[ $CURRENT_BRANCH =~ "$REGEX" ]]; then
  echo "Correct branch name"
else
  echo "Incorrect branch name"
  exit 1
fi