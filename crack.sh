#!/bin/bash
NC='\033[0m'
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;040m'
ORANGE='\033[1;38;5;202m'
BLUE='\033[1;38;5;012m'
BLUE2='\033[1;38;5;032m'
PINK='\033[1;38;5;013m'
GRAY='\033[1;38;5;004m'
NEW='\033[1;38;5;154m'
YELLOW='\033[1;38;5;214m'
CG='\033[1;38;5;087m'
CP='\033[1;38;5;221m'
CPO='\033[1;38;5;205m'
CN='\033[1;38;5;247m'
CNC='\033[1;38;5;051m'
#Coded By Machine404! Don't copy this code without giving me credit~
#https://instagram.com/invisibleclay100
#https://twitter.com/whoami4041
#https://www.youtube.com/channel/UCC_aPnmV_zGfdwktCFE9cPQ
function banner(){
echo -e ${CP}"    ______  ____  _____      ____ ____      _    ____ _  _______ ______     #"
echo -e ${CP}"   / /  _ \|  _ \|  ___|    / ___|  _ \    / \  / ___| |/ / ____|  _ \ \    #"
echo -e ${CP}"  | || |_) | | | | |_ _____| |   | |_) |  / _ \| |   | ' /|  _| | |_) | |   #"
echo -e ${CP}" < < |  __/| |_| |  _|_____| |___|  _ <  / ___ \ |___| . \| |___|  _ < > >  #"
echo -e ${CP}"  | ||_|   |____/|_|        \____|_| \_\/_/   \_\____|_|\_\_____|_| \_\ |   #"
echo -e ${CP}"   \_\                                                               /_/    #"
echo -e ${CNC}"         An Advanced Tool To Crack Any Password Protected PDF File          #"
echo -e ${YELLOW}"                         Coded By: Machine404                               #"
echo -e ${BLUE2}"          {Exposing Other Secret Is Not A Good Idea But U Can Do It}        #"
echo -e ${CP}"          Follow Me On:  ${CPO}Instagram: invisibleclay100                        #"
echo -e ${CP}"                         ${PINK}Twitter:   whoami4041                              #"
echo -e ${RED}"#############################################################################\n "
}
if [[ $EUID -ne 0 ]]; then
   echo -e ${RED}"\n[ X ] This script must be run as root :) \n" 1>&2
   echo -e ${RED}"[ ✔ ] Usage: sudo ./crack.sh"
   exit 1
fi
function depend(){

echo -e ${PINK}
cat /etc/issue.net


echo "Checking dependencies configuration " 
sleep 1
if [[ "$(ping -c 1 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
  echo ${RED}"No Internet Connection"
  exit 1
  else
  echo -e ${GREEN} "\n[ ✔ ] Internet.............${GREEN}[ working ]"
fi
sleep 1
which pdfid > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] pdfid.............${GREEN}[ found ]"
else
echo -e $red "[ X ] pdfid  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing pdfid "
#sudo apt-get update -y > /dev/null 2>&1
apt-get install pdfid -y > /dev/null 2>&1
echo -e ${BLUE} "[ ✔ ] Done installing ...."
fi
sleep 1
which pdf-parser > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] pdf-parser.............${GREEN}[ found ]"
else
echo -e $red "[ X ] pdf-parser  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing pdf-parser "
 apt-get install pdf-parser -y > /dev/null 2>&1

echo -e ${BLUE} "[ ✔ ] Done installing ...."
which qpdf > /dev/null 2>&1

fi
sleep 1
which qpdf > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] qpdf.............${GREEN}[ found ]"
else
echo -e $red "[ X ] qpdf  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing qpdf "
apt install qpdf -y > /dev/null 2>&1

echo -e ${BLUE} "[ ✔ ] Done installing ...."
which qpdf > /dev/null 2>&1

fi
sleep 1
which pdfcrack > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] pdfcrack.............${GREEN}[ found ]"
else
echo -e $red "[ X ] pdfcrack  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing pdfcrack "
apt install pdfcrack -y > /dev/null 2>&1

echo -e ${BLUE} "[ ✔ ] Done installing ...."
which pdfcrack > /dev/null 2>&1

fi
sleep 1
which hashcat > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
echo -e ${GREEN} "\n[ ✔ ] hashcat.............${GREEN}[ found ]"
else
echo -e $red "[ X ] hashcat  -> ${RED}not found "
echo -e ${YELLOW} "[ ! ] Installing hashcat "
 apt install hashcat -y > /dev/null 2>&1

echo -e ${BLUE} "[ ✔ ] Done installing ...."
which hashcat > /dev/null 2>&1
fi
sleep 1
}
function hacker(){
clear
banner
echo -n -e ${ORANGE}"\n[+] Enter path of pdf file : "
read file


sleep 0.5
echo -n -e ${RED}"\n[+] Analyzing $file: \n"
sleep 1
echo -n -e ${CP}"\n[*] Filename : $file \n"
sleep 0.5
pfver=$(pdfid $file | awk '/PDF Header/{print $3}' | sed 's/^.//')
sleep 0.5
echo -n -e ${BLUE}"\n[*] Version :  $pfver \n"
pflev=$(pdfid $file | awk '/Encrypt/{print $2}')
sleep 0.5
if [[ $pflev = '0' ]]; then
echo -n -e ${CN}"\n[*] Not an encrypted file.....Exiting! \n"
exit 
clear
fi
echo -n -e ${CNC}"\n[*] Encryption Level :  $pflev \n"
enobj=$(pdf-parser -s /Encrypt $file | awk '/Encrypt/{print ($2)}')
sleep 0.5
echo -n -e ${YELLOW}"\n[*] Encryption Object :  $enobj \n"
objfil=$(pdf-parser  $file | awk '/Filter/{print $2; exit}' | sed 's/^.//')
sleep 0.5
echo -n -e ${RED}"\n[*] Object Filter :  $objfil \n"
sleep 1
echo -n -e ${CNC}"\n[*] Encryption Status : Encrypted \n"
sleep 2
clear
menu
}
function dict_crack(){
echo -n -e ${CNC}"\n[*] Enter path of wordlist:  "
read word
sleep 0.5
echo -n -e ${BLUE2}"\n[*] Cracking Stared on:  $file \n "
sleep 2
echo -n -e ${CN}"\n[*] Grab A Coffee & Wait For Sometime :) \n "

dict=$(pdfcrack $file -w $word | awk '/found user-password: /{print $3}' | sed 's/^.//' | sed 's/.$//')
if [[ $dict != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$dict "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
}
#Coded By Machine404! Don't copy this code without giving me credit~
#https://instagram.com/invisibleclay100
#https://twitter.com/whoami4041
#https://www.youtube.com/channel/UCC_aPnmV_zGfdwktCFE9cPQ
function hash_crack(){
clear 
banner
echo -e ${YELLOW}"\n[*] Choose Cracking Type: Press 1 Or 2 :"
echo -e -n ${BLUE}"\n[*] 1. Use Default Wordlist \n${CP}[*] 2. Use Ur Own Wordlist \n"
echo -n -e ${CNC}"\n[+] Select: "
read cho
if [[ $cho = 1 ]]; then

echo -n -e ${CP}"\n[*] Checking pdf2john path \n "
if [[  -f /usr/share/john/pdf2john.pl ]]; then
echo -e -n ${RED}"\n[*] pdf2john path not found.......Exiting!"
exit
fi
sleep 1
echo -e -n ${BLUE}"\n[*] pdf2john Path Found......Moving Forward :) \n"
john=$(/usr/share/john/pdf2john.pl $file > tmp.hash)
cat tmp.hash | awk -F: '{ print $2 }' > crack.hash
sleep 2
echo -n -e ${CNC}"\n[*] Cracking Stared on:  $file \n "
sleep 2
echo -n -e ${CN}"\n[*] Grab A Coffee & Wait For Sometime :) \n "
if [[ $pflev = '1'  ]]; then
hashcat -m 10500  -a 3 crack.hash $word --force >/dev/null 2>&1
fin=$(hashcat -m 10500 crack.hash -a 3 -i ?d?d?d?d?d?d --force --show | awk -F: '{ print $2 }')
if [[ $fin != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$fin "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
elif [[ $pflev = '2'  ]]; then
hashcat -m 10500  -a 3 crack.hash -i ?d?d?d?d?d?d --force >/dev/null 2>&1
fin=$(hashcat -m 10500 crack.hash -a 3 $word --force --show | awk -F: '{ print $2 }')
if [[ $fin != '' ]]; then
echo -n -e ${CP}"\n[[ ✔ ] Password Found For ${CP}$file: ${RED}$fin "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
elif [[ $pflev = '3' ]]; then
hashcat -m 10600  -a 3 crack.hash -i ?d?d?d?d?d?d --force >/dev/null 2>&1
fin=$(hashcat -m 10500  -a 3 crack.hash --force --show | awk -F: '{ print $2 }')
if [[ $fin != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$fin "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
elif [[ $pflev = '8' ]]; then
hashcat -m 10700  -a 3 crack.hash -i ?d?d?d?d?d?d --force >/dev/null 2>&1
fin=$(hashcat -m 10700  -a 3 crack.hash --force --show | awk -F: '{ print $2 }')
if [[ $fin != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$fin "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
else
echo -n -e ${RED}"\n[ X ] Unknown Hash "
exit
fi
rm tmp.hash
rm crack.hash

elif [[ $cho = 2 ]]; then
hash_ch
fi
}
#Coded By Machine404! Don't copy this code without giving me credit~
#https://instagram.com/invisibleclay100
#https://twitter.com/whoami4041
#https://www.youtube.com/channel/UCC_aPnmV_zGfdwktCFE9cPQ
function hash_ch(){
clear
banner
echo -n -e ${CNC}"\n[*] Enter path of wordlist:  "
read wlst
sleep 0.5
echo -n -e ${CP}"\n[*] Checking pdf2john path \n "
if [[  -f /usr/share/jhon/pdf2john.pl ]]; then
echo -e -n ${RED}"\n[*] pdf2john path not found.......Exiting!"
exit
fi
sleep 1
echo -e -n ${BLUE}"\n[*] pdf2john Path Found......Moving Forward :) \n"
john=$(/usr/share/john/pdf2john.pl $file > tmp.hash)
cat tmp.hash | awk -F: '{ print $2 }' > crack.hash
sleep 2
echo -n -e ${CNC}"\n[*] Cracking Stared on:  $file \n "
sleep 2
echo -n -e ${CN}"\n[*] Grab A Coffee & Wait For Sometime :) \n "
if [[ $pflev = '1'  ]]; then
hashcat -m 10500 crack.hash -a 0  $wlst --force >/dev/null 2>&1
fin=$(hashcat -m 10500 crack.hash -a 0 $wlst --force --show | awk -F: '{ print $2 }')
if [[ $fin != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$fin "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
elif [[ $pflev = '2'  ]]; then
hashcat -m 10500 crack.hash -a 0 $wlst  --force >/dev/null 2>&1
fin=$(hashcat -m 10500 crack.hash -a 0 $wlst --force --show | awk -F: '{ print $2 }')
if [[ $fin != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$fin "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
elif [[ $pflev = '3' ]]; then
hashcat -m 10600 crack.hash -a 0  $wlst --force >/dev/null 2>&1
fin=$(hashcat -m 10500 crack.hash -a 0 $wlst --force --show | awk -F: '{ print $2 }')
if [[ $fin != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$fin "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
elif [[ $pflev = '8' ]]; then
hashcat -m 10700 crack.hash -a 0  $wlst --force >/dev/null 2>&1
fin=$(hashcat -m 10700 crack.hash -a 0 $wlst --force --show | awk -F: '{ print $2 }')
if [[ $fin != '' ]]; then
echo -n -e ${CP}"\n[ ✔ ] Password Found For ${CP}$file: ${RED}$fin "
else
echo -n -e ${RED}"\n[ X ] Password Not Found "
fi
else
echo -n -e ${RED}"\n[ X ] Unknown Hash "
exit
fi
rm tmp.hash
rm crack.hash

}
#Coded By Machine404! Don't copy this code without giving me credit~
#https://instagram.com/invisibleclay100
#https://twitter.com/whoami4041
#https://www.youtube.com/channel/UCC_aPnmV_zGfdwktCFE9cPQ
menu()
{
clear
banner
echo -e ${YELLOW}"\n[*] Choose Cracking Type: \n "
echo -e "  ${NC}[${CG}"1"${NC}]${CNC} Dictionary Attack"
echo -e "  ${NC}[${CG}"2"${NC}]${CNC} Hash Attack"
echo -e "  ${NC}[${CG}"3"${NC}]${CNC} Exit"

echo -n -e ${YELLOW}"\n[+] Select: "
        read redi_play
                if [ $redi_play -eq 1 ]; then
                        dict_crack
                elif [ $redi_play -eq 2 ]; then
                        hash_crack
                elif [ $redi_play -eq 3 ]; then
                      exit
                fi
}
banner
clear
depend
hacker
#Coded By Machine404! Don't copy this code without giving me credit~
#https://instagram.com/invisibleclay100
#https://twitter.com/whoami4041
#https://www.youtube.com/channel/UCC_aPnmV_zGfdwktCFE9cPQ
