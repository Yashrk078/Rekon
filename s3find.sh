#!/bin/bash
while getopts d: flag
do
	case "${flag}" in
		d) domn=${OPTARG};;
		*) echo "invalid";;
	esac
done

s3(){
python3 ~/path/to/S3Scanner/s3scanner.py ~/path/to/NeutronSec/$domn/domains.txt -o ~/path/to/NeutronSec/$domn/s3Scan.txt
}
s3

