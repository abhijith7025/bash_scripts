#!/bin/bash

#check if elastic serach is running or not if not restart it

systemctl is-active --quiet nginx

if [[ #? != 0 ]]; then
	echo "The service is running

else
	echo "The service is not running
	echo "Trying to restart"
	systemctl start nginx
fi
