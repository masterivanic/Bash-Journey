# Bash is a Unix shell and command language. Bash is stands for "Bourne Again SHell".

#!/bin/bash

#----------chapter 1: Variables and User input -----------------
name="DevOps"
subject="maths"
echo "Hi there $name $subject" $@ # $@ permit to add more arguments when executing our script

echo "What is your name ?"
read name

echo "Hi there $name"

read -p "What is your surname man ?" name
echo "Hi there $name"
