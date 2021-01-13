#!/bin/bash
while getopts d: flag
do
	case "${flag}" in
		d) domn=${OPTARG};;
		*) echo "invalid";;
	esac
done

mkdir $domn/nmapscans

for domain in $(cat $domn/domains.txt)
do
	nmap -sC -sV $domain | tee $domn/nmapscans/$domain
done
