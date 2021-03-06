#!/bin/bash
while getopts d: flag
do
	case "${flag}" in
		d) domain=${OPTARG};;
		*) echo " :/"
	esac
done
mkdir -p $domain/

#starting sublist3r
#sublist3r -d $1 -v -o domains.txt
subfinder -d $domain -o $domain/subfin.txt

#running assetfinder
assetfinder -subs-only $domain | tee $domain/ast_fin.txt

#Amass mfs

amass enum -passive -d $domain -o $domain/ams_pas.txt #-config /path/to/./config.ini

#remove dupes :)

cat $domain/*.txt | sort -u >> $domain/domains.txt

#checking for alive domains

echo "\n\n[+] Checking for alive domains..\n"
cat $domain/domains.txt | httpx -threads 11 -o $domain/alive.txt

