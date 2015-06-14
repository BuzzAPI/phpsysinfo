#!/bin/bash
#
# Designed to use with: wget https://raw.githubusercontent.com/BuzzAPI/phpsysinfo/master/installer.sh && bash installer.sh
# 
version=3.2.2.1-buzzapi-mod
echo "-Downloading and unzipping packages... \n"
wget "https://github.com/BuzzAPI/phpsysinfo/archive/v"$version".tar.gz" -q -O - | tar -xz

while true; do
    read -p "Do you want to protect with password? [Y/N]: " yn
    case $yn in
        [Yy]* ) 
			read -p "Enter you desired user: " user
			replace "admin" $user -- "phpsysinfo-"$version"/passwd.php" >/dev/null
			
			read -p "Enter you desired password: " pass
			replace "pass" $pass -- "phpsysinfo-"$version"/passwd.php" >/dev/null
			
			break;;
        [Nn]* )  
			replace "$password_enabled=TRUE" "$password_enabled=FALSE" -- "phpsysinfo-"$version"/passwd.php" >/dev/null 
			
			break;;
        
		* ) echo "Please answer yes or no.";;
    esac
done

read -p "Enter web domain: " domain
read -p "Enter web domain public folder: " destination

mv "phpsysinfo-"$version $destination"/phpsysinfo"

echo "Finish! You can see it in "$domain"/phpsysinfo"




