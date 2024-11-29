#!/bin/bash

case ${1,,} in
	rafaelfe | admin)
		echo "Login sucessful!"
		;;
	help)
		echo "rerun the program and enter your username"
		;;
	*)
		echo "Please enter a valid username"
esac
 