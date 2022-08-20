#!/bin/bash

frozen=$(/usr/sbin/exiqgrep -z)
skycloudstar=$(/usr/sbin/exiqgrep -r skycloudstar.com)
example=$(/usr/sbin/exiqgrep -r example.com)
yourdomain=$(/usr/sbin/exiqgrep -r yourdomain.com)
onehours=$(/usr/sbin/exiqgrep -o 3600)

if [ -z "$frozen" ]
then 
	echo -e "\n Frozen mail doesn't exist"
	echo -e "---------------------------- \n"
else
	echo -e "\n Removing frozen mail"
	exiqgrep -z -i | xargs exim  -Mrm
	echo -e "---------------------------- \n"
fi

if [ -z "$skycloudstar" ]
then 
	echo "Mail From skycloudstar doesn't exist"
	echo -e "---------------------------- \n"
else
	echo "Removing email from skycloudstar"
	exiqgrep -r skycloudstar.com -i | xargs exim -Mrm
	echo -e "---------------------------- \n"
fi

if [ -z "$example" ]
then 
	echo "Mail From example doesn't exist"
	echo -e "---------------------------- \n"
else
	echo "Removing email from example"
	exiqgrep -r example.com -i | xargs exim -Mrm
	echo -e "---------------------------- \n"
fi

if [ -z "$onehours" ]
then 
	echo "Mail more than onehours doesn't exist"
	echo -e "---------------------------- \n"
else
	echo "Removing email more than one hour"
	exiqgrep -o 3600 -i | xargs exim -Mrm
	echo -e "---------------------------- \n"
fi