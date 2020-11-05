#!/bin/bash

#the script will add or remove a new user

echo "Welcome to user add script"

if [[ "$#" == 0 ]]; then
	echo "No argument has been provided"
	echo "please see $0 -h for help"
	exit
fi


if [[ "$1" == "-a" ]]; then
	echo  "$#"

	if [[ "$#" != "4" ]]; then
		echo "Usage: $0 -a <login> <passwd> <shell>"
		exit
	else
		echo "These are what you entered"
		echo "user name: $2"
		echo "password: $3"
		echo "shell: $4"
		read -rp "Press enter (y) to continue or (n) to cancel" choice
		
		if [[ "$choice" == "y" ]]; then
			echo "Adding user"
			useradd -m "$2" -s "$4"
			echo "$2":"$3" | chpasswd
		elif [[ "$choice" == "n" ]]; then
			echo "Abort"
			exit
		else
			echo "you should have entered a correct choice"
			exit
		fi

		
	fi


elif [[ "$1" == "-d" ]]; then
	echo "Just a test"

	if [[ "$#" == "2" ]]; then	
	    awk -F ":" '{print $1}' /etc/passwd | grep "$2"
	 
			if [[ "$?" != "0" ]]; then
				echo "No such user"
				exit
			else 
				echo "deleting user"
				userdel "$2"
				echo "user deleted"
			fi
		
	else 
		echo "usage ${0} -d user"
	fi
	
elif [[ "$2" == "-h" ]] || [[ $# == 1 ]]; then
	echo "The help text"
	echo "-a - add a new user"
	echo "syntax\n\
	$0 -a <user> <password> <shell>"
	echo "-d - remove a user"
	echo "syntax\n\
	$0 -d <user>"
	echo "-h - print the help text"
else
	echo "Please enter a valid input see ${0} -h"
fi



	
