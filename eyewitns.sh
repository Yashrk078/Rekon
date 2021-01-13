while getopts d: flag
do
	case "${flag}" in
		d) domain=${OPTARG};;
		*) echo "invalid";;
	esac
done

eyewitness -f $domain/alive.txt -d $domain/Screens --no-prompt 	

		 
