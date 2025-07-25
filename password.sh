#!/bin/bash
clear
printf "\n"
read -p "How many characters you would like the password to have ? " pass_len
printf "\n"
for i in {1..10}; do (tr -cd '[:alnum:]' < /dev/urandom | fold -w${pass_len} | head -n 1); done
printf "$pass_output\n"
printf "Goodbye, ${USER}\n"


cat << EOF
Hello World!
How are you?
EOF

wc -l << EOF
Hello World!
How are you?
EOF

cat << randomword1
This script will print these lines on the terminal.
Note that cat can read from standard input. Using this
heredoc, we can
create a temporary file with these lines as it's
content and pipe that
into cat.
randomword1