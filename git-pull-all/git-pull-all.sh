#!/usr/bin/bash

if [ $# -lt 1 ]; then
	dir=`pwd`
else
	dir=$1
fi

for f in "$dir"/*; do
	echo "||| Check $f"
	if [ -d "$f" ]; then
		if [ -d "$f/.git" ]; then
			cd "$f"
			git pull
			#cd ..
		else
			echo "$f is not a git repository, aborting"
		fi
	else
		echo "skip $f - not a directory"
	fi
	echo "||| Finish checking $f"
done
