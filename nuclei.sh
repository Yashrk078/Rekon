while getopts d: flag
do
	case "${flag}" in
		d) domain=${OPTARG};;
		*) echo "invalid";;
	esac
done

nuc(){
		cat $domain/alive.txt | nuclei -t ~/nuclei-templates -o $domain/recon/nuclei/nuc.txt
		}
nuc
