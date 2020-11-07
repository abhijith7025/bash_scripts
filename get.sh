#!/bin/bash

#just checking the getopts command

while getopts :a:b: options; do
	case $options in
		a) echo "entered $OPTARG";;
		b) echo "entered $OPTARG";;
		\?) echo "Entered has no meaning $OPTARG";;
		:) echo "$OPTARG:- requires argument"
	esac
done
