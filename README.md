
---

# NeutronSec


- NeutronSec is a Basic Tool which does most of our Recon Hassle.

-  It Uses [Mohd Shibli's](https://twitter.com/_d3f4u17_) recon scripts
as its core component.

- It uses multiple bash scripts and executes them through python.
  
- It Also does some Post reconnaissance stuff.

- Consider using this Tool mostly for Medium/Large Scope Targets !

---
## Features 


- Gather Subdomains through Amass, subfinder and assetfinder.

- Gather JS files.

- Check For Any Reflected domain in response (Using Additional X-Header).

- Extract Endpoints with relative url extractor.

- Curate a Common wordlist for gathered enpoints.

- Perform Waybackurls and Gau.

- Grep gf patterns for XSS, SSRF, RCE, SQLi, etc.

- Find Open S3 Buckets using S3Scanner.py

- Perform Subdomain Takeover checks using Subjack.

- Perform Eyewitness for visual Recon.

- Perfom Nmap for port Scanning

- Finally perform Nuclei on Subdomains.

---

### Dependencies :

- [Golang / go](https://golang.org/doc/install)

- [Amass](https://github.com/OWASP/Amass)

- [Subfinder](https://github.com/projectdiscovery/subfinder)

- [AssetFinder](https://github.com/tomnomnom/assetfinder)

- [httpx](https://github.com/projectdiscovery/httpx)

- [relative-url-extractor](https://github.com/jobertabma/relative-url-extractor)

- [Waybackurls](https://github.com/tomnomnom/waybackurls)

- [Gau](https://github.com/lc/gau)

- [gf](https://github.com/tomnomnom/gf)

- [gf-patterns](https://github.com/1ndianl33t/Gf-Patterns)

- [S3Scanner](https://github.com/sa7mon/S3Scanner)

- [Subjack](https://github.com/haccer/subjack)

- [Nuclei](https://github.com/projectdiscovery/nuclei)

- ```pip3 install eyewitness```

- ```pip3 install coloredlogs```

- ```pip3 install requests```

- ```pip3 install awscli```

---

## Extras


- Here is [Mohd Shibli's](https://twitter.com/_d3f4u17_) Github [Repository](https://github.com/shibli2700) 

- To Run the script, Just use ``` > python3 main.py  ``` and relax!


### Thank You


This Mini Project was developed by [@Neutron__](https://twitter.com/Neutron__)

If you are facing any problem getting things right, feel free to ping me :)

#### Future Updates


Possibility of Replacing Nmap with any other fast Port Scanner.

Active BruteForcing of Subdomains (Permutations) for VPS.

Adding more features like Checking sor SSTI, SSRF, etc.

