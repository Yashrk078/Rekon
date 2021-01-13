#!/bin/bash
while getopts d: flag
do
	case "${flag}" in
		d) domn=${OPTARG};;
		*) echo "Invalid Hai Bhaimyaa :/"
	esac
done
#looping through the scriptsresponse directory

mkdir $domn/endpoints

CUR_DIR=$domn

for domain in $(ls $domn/scriptsresponse)
do
	#looping through files in each domain
	mkdir $CUR_DIR/endpoints/$domain
	for file in $(ls $domn/scriptsresponse/$domain)
	do
		cat $domn/scriptsresponse/$domain/$file | ruby ~/relative-url-extractor/extract.rb  >> $domn/endpoints/$domain/$file 
	done
done

find $domn/endpoints/ -empty -type f -delete
