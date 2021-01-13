while getopts d: flag
do
	case "${flag}" in
		d) domain=${OPTARG};;
		*) echo "Invalid lul";;
	esac
done
mkdir $domain/wordlist
for dom in $(ls $domain/endpoints)
do
	for file in $(ls $domain/endpoints/$dom)
	do
		cat $domain/endpoints/$dom/$file >> $domain/wordlist/temp
	done
done

cat $domain/wordlist/temp | sort -u >> $domain/wordlist/fuzz.txt
#| tr "/" "\n" | sed '/^[[:space:]]*$/d' >> fuzz.txt
cat $domain/wordlist/fuzz.txt | tr "/" "\n"| egrep -v "\.js|\.css|\.woff|\.ttf|\.svg|\.eot|\.png|\.jpeg|\.jpg|\.css|\.ico" | sed '/^[[:space:]]*$/d' | sort -u >> $domain/wordlist/final.txt
rm $domain/wordlist/temp
rm $domain/wordlist/fuzz.txt
