#!/bin/bash
showname(){
	echo hello $1
	if [ ${1,,} = rafaelfe ]; then
		return 0
	else
		return 1
	fi
}
showname $1
if [ $? = 1 ]; then
	echo "Idk you bro"
fi
