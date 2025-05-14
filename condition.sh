#!/bin/bash

if (($EUID == 0)); then
    echo "Please do not run as root"
    exit
fi

read -p "What is your name? " name
if [[ -z ${name} ]]
then
 echo "Please enter your name!"
else
 echo "Hi there ${name}"
fi

admin="masterivanic"
read -p "Enter your username ? " username
if [[ ${username} == ${admin} ]]; then
    echo "You are the admin User!"
else
    echo "You are not an admin"
fi

if [[ ${admin} != ${username} ]] && [[ $EUID != 0 ]]; then
    echo "You are not the admin or root user, but please besafe!"
else
    echo "You are the admin user! This could be very destructive!"
fi

read -p "Enter a number : " num
if [[ $num -gt 0 ]]; then
    echo "The number is positive"
elif [[ $num -lt 0 ]]; then
    echo "The number is negative"
else
    echo "The number is 0"
fi

read -p "Enter user age: " age
case $age in 
 1[89]|[2-9][0-9])
 echo -n "You are young"
 ;;
 *)
 echo -n "You are old"
 ;;
esac



