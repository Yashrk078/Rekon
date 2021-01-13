#!/bin/bash
while getopts d: flag
do
	case "${flag}" in
		d) domn=${OPTARG};;
		*) echo "invalid";;
	esac
done
subjack -w $domn/domains.txt -ssl -a -timeout 30 -v -o $domn/sto_res.txt
