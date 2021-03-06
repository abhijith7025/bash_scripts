#!/bin/bash

#This script will replace entered character in a file
#getting user input and storing it into variable "old"
read -rp "Enter what you want to replace: " old

#using while loop to do it until he enteres
i=1
while [[ -z "$old" ]]
do
	read -rp "Enter what you want to replace: " old
	i=$((i+1))
	if [[ "$i" -eq 3 ]]; then
		echo "Maximum tries reached aborting"
		exit
	fi
done

#getting the target variable from user like above

read -rp "Enter what you want to replace $old with: " new

i=1
while [[ -z "$new" ]]
do
	read -rp "Enter what you want to replace $old with: " new
	i=$((i+1))
	if [[ "$i" -eq 3 ]]
	then
		echo "Maximum tries reached aborting"
		exit
	fi
done
for i in ./*.sh
do
	echo "files found that needs edititng $i"
	echo "$old $new"
	sed -e "s/${old}/${new}/g" "$i" > "$i".new
done

