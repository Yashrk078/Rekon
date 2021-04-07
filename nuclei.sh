while getopts d: flag
do
	case "${flag}" in
		d) domain=${OPTARG};;
		*) echo "invalid";;
	esac
done

nuc(){
		cat $domain/alive.txt | nuclei -t ~/nuclei-templates/cves/ -o $domain/recon/nuclei/cves.txt
		cat $domain/alive.txt | nuclei -t ~/nuclei-templates/exposures/ -o $domain/recon/nuclei/exposures.txt
		cat $domain/alive.txt | nuclei -t ~/nuclei-templates/vulnerabilities/ -o $domain/recon/nuclei/vulns.txt
		cat $domain/alive.txt | nuclei -t ~/nuclei-templates/misconfiguration/ -o $domain/recon/nuclei/misconfig.txt
		cat $domain/alive.txt | nuclei -t ~/nuclei-templates/exposed-panels/ -o $domain/recon/nuclei/panels.txt
		cat $domain/alive.txt | nuclei -t ~/nuclei-templates/takeovers/ -o $domain/recon/nuclei/takeovers.txt
		cat $domain/alive.txt | nuclei -t ~/nuclei-templates/workflows/ -o $domain/recon/nuclei/workflows.txt
		}
nuc
