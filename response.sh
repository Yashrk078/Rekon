#!/bin/bash
while getopts d: flag
do
	case "${flag}" in
		d) domn=${OPTARG};;
		*) echo "Invalid"
	esac
done
mkdir $domn/headers
mkdir $domn/responsebody

CURRENT_PATH=$domn

for x in $(cat $domn/alive.txt)
do
	NAME=$(echo $x | awk -F/ '{print $3}')
	curl -X GET -H "X-Forwarded-For: evil.com" $x -I > "$CURRENT_PATH/headers/$NAME"
	curl -s -X GET -H "X-Forwarded-For: evil.com" -L $x > "$CURRENT_PATH/responsebody/$NAME"
done
