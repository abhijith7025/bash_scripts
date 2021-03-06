#!/bin/bash

#This program shows passwd file entry for the desired user

read -rp "Enter the username: " user
i=1
while [[ -z $user ]]
do
	read -rp "Enter the username: " user
	i=$((i+1))
	if [[ $i -eq 3 ]]
	then 
		echo "Maximum tries reached aborting"
		exit
	fi
done

awk -F ":" '{print $1}' /etc/passwd | grep -n $user

if [[ $? != 0 ]]
then
	echo "No such user found"
	exit
else
	
	user=$( grep -n "$user" /etc/passwd | awk -F ":" '{print $2}' )
	uid=$( grep -n "$user" /etc/passwd | awk -F ":" '{print $4}' )
	gid=$(  grep -n "$user" /etc/passwd | awk -F ":" '{print $5}' )
	home=$(  grep -n "$user" /etc/passwd | awk -F ":" '{print $7}' )
	shell=$(  grep -n "$user" /etc/passwd | awk -F ":" '{print $8}' )

	echo "User name: $user"
	echo "Uid: $uid"
	echo "Gid: $gid"
	echo "home directory: $home"
	echo "default shell: $shell"
fi

