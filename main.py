import subprocess

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

print(bcolors.OKCYAN+bcolors.UNDERLINE+""" 
███╗   ██╗███████╗██╗   ██╗████████╗██████╗  ██████╗ ███╗   ██╗███████╗███████╗ ██████╗
████╗  ██║██╔════╝██║   ██║╚══██╔══╝██╔══██╗██╔═══██╗████╗  ██║██╔════╝██╔════╝██╔════╝
██╔██╗ ██║█████╗  ██║   ██║   ██║   ██████╔╝██║   ██║██╔██╗ ██║███████╗█████╗  ██║
██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██╔══██╗██║   ██║██║╚██╗██║╚════██║██╔══╝  ██║
██║ ╚████║███████╗╚██████╔╝   ██║   ██║  ██║╚██████╔╝██║ ╚████║███████║███████╗╚██████╗
╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝ ╚═════╝ 

                        --v0.2-- 
"""+bcolors.ENDC) 


dom = input(bcolors.BOLD+bcolors.FAIL+"Enter Domain:-)"+bcolors.ENDC)
print(bcolors.BOLD+bcolors.OKBLUE+"Now Starting"+bcolors.ENDC)
print(bcolors.BOLD+bcolors.OKCYAN+"Gathering Subdomains"+bcolors.ENDC)
subprocess.call("./enum.sh -d "+dom, shell=True)
subprocess.call("./response.sh -d "+dom, shell=True)
print(bcolors.BOLD+bcolors.OKCYAN+"Gathering JS Files"+bcolors.ENDC)
subprocess.call("./jsfiles.sh -d "+dom, shell=True)
print(bcolors.BOLD+bcolors.OKCYAN+"Extracting Endpoints"+bcolors.ENDC)
subprocess.call("./endpoints.sh -d "+dom, shell=True)
print(bcolors.BOLD+bcolors.OKCYAN+"Performing Wayback|GAU|GF Patterns"+bcolors.ENDC)
subprocess.call("./extra.sh -d "+dom, shell=True)
print(bcolors.BOLD+bcolors.OKCYAN+"Checking S3 Buckets"+bcolors.ENDC)
subprocess.call("./s3find.sh -d "+dom, shell=True)
print(bcolors.BOLD+bcolors.OKCYAN+"Checking for Possible Subdomain Takeovers"+bcolors.ENDC)
subprocess.call("./sto.sh -d "+dom, shell=True)
print(bcolors.BOLD+bcolors.OKCYAN+"Creating a Custom Wordlist for you :]"+bcolors.ENDC)
subprocess.call("./wordlist.sh -d "+dom, shell=True)
print(bcolors.BOLD+bcolors.OKCYAN+"Testing for PUT method"+bcolors.ENDC)
subprocess.call("./puttest.sh "+dom, shell=True)
x = input(bcolors.BOLD+bcolors.WARNING+"Perform Screenshots? (y/n): "+bcolors.ENDC).lower()
if x == "y":
	subprocess.call("./eyewitns.sh -d "+dom, shell=True)
else:
	exit 
y = input(bcolors.BOLD+bcolors.WARNING+"Perform NMap ? (y/n): "+bcolors.ENDC).lower()
if y == "y":
	subprocess.call("./nmap.sh -d "+dom, shell=True)
else:
	exit
z = input(bcolors.BOLD+bcolors.WARNING+"Perform Nuclei? (y/n): "+bcolors.ENDC).lower()
if z == "y":
	subprocess.call("./nuclei.sh -d "+dom, shell=True)
else:
	exit

print(''' 
         ▄              ▄  
        ▌▒█           ▄▀▒▌  
        ▌▒▒█        ▄▀▒▒▒▐
       ▐▄█▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐ 
     ▄▄▀▒▒▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐  
   ▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌   
  ▐▒▒▒▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄▒▌ 
  ▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐
 ▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌ 
 ▌░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌ 
▌▒▒▒▄██▄▒▒▒▒▒▒▒▒░░░░░░░░▒▒▒▐ 
▐▒▒▐▄█▄█▌▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▒▒▌
▐▒▒▐▀▐▀▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▐ 
 ▌▒▒▀▄▄▄▄▄▄▀▒▒▒▒▒▒▒░▒░▒░▒▒▒▌ 
 ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒▒▄▒▒▐ 
  ▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒▄▒▒▒▒▌
    ▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀
      ▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀
         ▀▀▀▀▀▀▀▀▀▀▀▀          
''')
print("\n"+bcolors.BOLD+bcolors.OKGREEN+"--------------------------------------"+bcolors.ENDC+"\n"+bcolors.BOLD+bcolors.FAIL+"Script Ended, but not your Hamcking :)"+bcolors.ENDC)

