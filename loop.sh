#!/bin/bash

users="devdojo bobby tony"
for user in ${users}
do
 echo "${user}"
done

for num in {1..10}
do
 echo ${num}
done

counter=1
while [[ $counter -le 10 ]]
do
 echo $counter
 ((counter++))
 echo "---- in while condition ------------"
done

# read -p "What is your name? " name
# while [[ -z ${name} ]]
# do
#  echo "Your name can not be blank. Please enter a valid
# name!"
#  read -p "Enter your name again? " name
# done
# echo "Hi there ${name}"

count=1
until [[ $count -gt 10 ]]
do
 echo $count
 ((count++))
done

my_array=("Moto🚀" "Voiture" "Jet privé" "Ecole")
array_len=${#my_array[@]}
index=0
while [[ $index -lt $array_len ]]
do 
 echo ${my_array[index]}
 ((index++))
done

for i in 1 2 3 4 5
do
 if [[ $i -eq 2 ]]
 then
 echo "skipping number 2"
 continue
 fi
 echo "i is equal to $i"
done

# This is magic algorithm with bash :)
randomNumber=$((1 +$RANDOM % 20 )) # generate a random number beetween 1 and 20 [1, 20]
read -p "Enter a number of your choice: " num
while [[ 1 ]]
do
 if [[ $num -lt $randomNumber ]]; then
    echo "not right try a number more greater"
 fi
 if [[ $num -gt $randomNumber ]]; then
    echo "not right try a number more less"
 fi
 read -p "Enter a number of your choice again: " num
 if [[ $num -eq $randomNumber ]]; then
    echo "You win 🚀 the magic number was $randomNumber"
    break
 fi
done



