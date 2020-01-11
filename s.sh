#!/bin/bash
if [[ "$#" -eq 1 ]]
then
	case "$1" in
		--interactive) echo "Interactive mode ON!" ;;
		*) echo "$1 is not an option. It can take not more then one option --interactive which starts the instalation INTERACTIVLY" ;;
	esac
else
	if [[ "$#" > 1 ]]
	then 
		echo "It can take not more then one option --interactive which starts the instalation INTERACTIVLY"
	else
		echo "This program requires mongodb. Do you have it? Or it can be installed automaticly? [y/n/install]"
		read item
		case "$item" in
		    y|Y) echo "OK!"
			;;
		    n|N) echo "instructions for installing mongodb can be found at https://docs.mongodb.com/v4.0/tutorial/install-mongodb-on-ubuntu/"
			exit 0
			;;
		    install|Install|INSTALL) echo "It will install the latest wersion of mongodb"
			sudo apt install mongodb -y
			;;
		    *) echo "Invalid answer. exit"
			exit 0
			;;
		esac
		
		echo "Installing python libraries"
		sudo apt install python3-pip -y
		pip3 install flask
		pip3 install pycryptodome
		pip3 install pymongo
		pip3 install telebot
		pip3 install pyTelegramBotApi
		echo "Python libraries was installed!"
		
		echo "Configurating database"
		python3 configure_db.py	
		echo "db was configurated!"	
		echo "Runing mongo_test2"
		python3 mongo_test2.py
		

	fi	
fi
