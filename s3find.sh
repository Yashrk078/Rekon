#!/bin/bash
while getopts d: flag
do
	case "${flag}" in
		d) domn=${OPTARG};;
		*) echo "invalid";;
	esac
done

s3(){
python3 ~/Desktop/Neutron/S3Scanner/s3scanner.py ~/Desktop/Neutron/NeutronSec/$domn/domains.txt -o ~/Desktop/Neutron/NeutronSec/$domn/s3Scan.txt
}
s3

