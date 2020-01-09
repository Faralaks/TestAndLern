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
		echo "Installing python libraries"
		sudo apt install python3-pip -y
		pip3 install flask
		pip3 install pycryptodome
		pip3 install pymongo
		pip3 install telebot
		pip3 install pyTelegramBotApi
		echo "Python libraries are installed!"
		echo "The program requires mongodb. instructions for installing it can be found at https://docs.mongodb.com/v4.0/tutorial/install-mongodb-on-ubuntu/"
		echo "Configuration database"
		python3 configure_db.py	
		echo "db was configurated!"	
		echo "Runing mongo_test2"
		python3 mongo_test2.py
		

	fi	
fi
