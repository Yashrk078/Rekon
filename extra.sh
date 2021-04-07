#!/bin/bash
while getopts d: flag
do
	case "${flag}" in
		d) domain=${OPTARG};;
		*) echo "Invalid"
	esac
done

	mkdir -p $domain/recon $domain/recon/nuclei $domain/recon/wayback $domain/recon/gf $domain/Screens
	
waybac(){
	echo "--Running Wayback--"
	cat $domain/alive.txt | waybackurls | sort -u >> $domain/recon/wayback/tmp.txt
	echo "--Running gau--"	
	cat $domain/alive.txt | gau | sort -u >> $domain/recon/wayback/tmp.txt
	cat $domain/recon/wayback/tmp.txt | egrep -v "\.woff|\.ttf|\.svg|\.eot|\.png|\.jpeg|\.jpg|\.css|\.ico" | sed 's/:80//g;s/:443//g' | sort -u >> $domain/recon/wayback/wayback.txt
	}
	waybac
	rm $domain/recon/wayback/tmp.txt
	
	cat $domain/recon/wayback/wayback.txt | httpx -o $domain/recon/wayback/live.txt > /dev/null
rm $domain/recon/wayback/wayback.txt

	

	gf_pat(){
	gf xss $domain/recon/wayback/live.txt | sort -u >> $domain/recon/gf/xss.txt
	gf ssrf $domain/recon/wayback/live.txt | sort -u >> $domain/recon/gf/ssrf.txt
	gf rce $domain/recon/wayback/live.txt | sort -u >> $domain/recon/gf/rce.txt
	gf sqli $domain/recon/wayback/live.txt | sort -u >> $domain/recon/gf/sqli.txt
	gf lfi $domain/recon/wayback/live.txt | sort -u >> $domain/recon/gf/lfi.txt
	gf redirect $domain/recon/wayback/live.txt | sort -u >> $domain/recon/gf/redirect.txt
	gf takovers $domain/recon/wayback/live.txt | sort -u >> $domain/recon/gf/takeover.txt
	gf s3-buckets $domain/recon/wayback/live.txt | sort -u >> $domain/recon/gf/s3-bucket.txt
	gf interestingsubs $domain/recon/wayback/live.txt |sort -u >> $domain/recon/gf/intsubs.txt
	gf interestingparams $domain/recon/wayback/live.txt | sort -u >> $domain/recon/gf/params.txt
	}
	gf_pat

	
