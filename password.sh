#!/bin/bash
clear
printf "\n"
read -p "How many characters you would like the password to have ? " pass_len
printf "\n"
for i in {1..10}; do (tr -cd '[:alnum:]' < /dev/urandom | fold -w${pass_len} | head -n 1); done
printf "$pass_output\n"
printf "Goodbye, ${USER}\n"