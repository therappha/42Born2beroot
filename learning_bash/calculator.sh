#!/bin/bash

add()
{
	local NUM1
	local NUM2
	local RESULT
	printf "Please enter the first number: "
	read NUM1
	printf "\nPlease enter the second number: "
	read NUM2
	RESULT=$(echo "scale=2; $NUM1 + $NUM2" | bc)
	printf "$NUM1 + $NUM2 = $RESULT\n"
}
subtract()
{
	local NUM1
	local NUM2
	local RESULT
	printf "Please enter the number you want to subtract from: "
	read NUM1
	printf "\nPlease enter the amount you want to subtract: "
	read NUM2
	RESULT=$(echo "scale=2; $NUM1 - $NUM2" | bc)
	printf "$NUM1 - $NUM2 = $RESULT\n"
}
multiply()
{
	local NUM1
	local NUM2
	local RESULT
	printf "Please enter the number you want to multiply: "
	read NUM1
	printf "\nPlease enter the multiplicator: "
	read NUM2
	RESULT=$(echo "scale=2; $NUM1 * $NUM2" | bc)
	printf "$NUM1 * $NUM2 = $RESULT\n"
}
divide()
{
	local NUM1
	local NUM2
	local RESULT
	printf "Please enter the number you want to divide: "
	read NUM1
	printf "\nPlease enter the divisor: "
	read NUM2
	RESULT=$(echo "scale=2; $NUM1 / $NUM2" | bc)
	printf "Result of: $NUM1 / $NUM2 is: $RESULT\n"
}
percentage()
{
	local NUM1
	local NUM2
	local RESULT
	printf "Please enter the total number: "
	read NUM1
	printf "\nPlease enter the amount you want to get the value in percentage: "
	read NUM2
	RESULT=$(echo "scale=2; $NUM2 * 100 / $NUM1" | bc)
	printf "Result: $NUM2 is $RESULT%% of $NUM1\n"
}



echo "Hello there, this is THE SUPER MEGA BLASTER CALCULATOR, it can perform basic math operations!!!!"
printf "Please type in the terminal the operation you will use the calculator for!!!!\n"
echo "---------------------"
printf "1: add\n2: subtract\n3: multiply\n4: divide\n5: percentage\n"
echo "---------------------"
printf "Please type the number of the operator: "
read OPERATOR

case $OPERATOR in
	1)
		echo "So we are are doing some additions!"
		add
		;;
	2)
		echo "So we are are doing some subtractions!"
		subtract
		;;
	3)
		echo "So we are are doing some multiplications!"
		multiply
		;;
	4)
		echo "So we are are doing some divisions!"
		divide
		;;
	5)
		echo "So we are are doing some percentage operations!"
		percentage
		;;
	*)
		echo "Please re-run the script and enter a valid operator!!!!!"
		;;
	esac
