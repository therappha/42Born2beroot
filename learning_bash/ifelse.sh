#!/bin/bash
echo "Please enter your username to log in!"
read USER_NAME
if [ $USER_NAME = rafaelfe ]; then
	echo "Login Sucess!"
elif [ $USER_NAME = help ]; then
	echo "PLS Enter your username!"
else
	echo "Login failed? Who are you?"
fi

