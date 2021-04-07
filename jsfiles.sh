#!/bin/bash
while getopts d: flag
do
	case "${flag}" in
		d) domn=${OPTARG};;
		*) echo "Invalid "
	esac
done
mkdir $domn/scripts
mkdir $domn/scriptsresponse

RED='\033[0;31m'
NC='\033[0m'
CUR_PATH=$domn

for x in $(ls "$CUR_PATH/responsebody")
do
	printf "\n\n${RED}$x${NC}\n\n"
	END_POINTS=$(cat "$CUR_PATH/responsebody/$x" | grep -Eoi "src=\"[^>]+></script>" | cut -d '"' -f 2)
	for end_point in $END_POINTS
	do
		len=$(echo $end_point | grep "http" | wc -c)
		mkdir "$CUR_PATH/scriptsresponse/$x/"
		URL=$end_point
		if [ $len == 0 ]
		then
			URL="https://$x$end_point"
		fi
		file=$(basename $end_point)
                curl -X GET $URL -L > "$CUR_PATH/scriptsresponse/$x/$file"
		echo $URL >> "$CUR_PATH/scripts/$x"
	done
done
