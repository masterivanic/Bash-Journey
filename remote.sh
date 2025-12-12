#!/bin/bash

##
# BASH script that checks:
# - Memory usage
# - CPU load
# - Number of TCP connections
# - Kernel version
##

##
# Color Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

Colorized(){
    sudo dnf install grc
    GRC_ALIASES=true
    [[ -s "/etc/profile.d/grc.sh" ]] && source /etc/profile.d/grc.sh
    source ~/.bashrc
    [[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
    source ~/.zshrc
}


ColorGreen(){
 echo -ne $green$1$clear
}

ColorBlue(){
 echo -ne $blue$1$clear
}

server_name=$(hostname)
echo $server_name

function memory_check() {
 echo ""
 echo "The current memory usage on ${server_name} is: "
 free -ht
 echo ""
}

function disk_usage(){
    echo ""
    echo "Disk usage of ${server_name} is: "
    df -hk
}

function cpu_usage() {
 echo ""
 echo "CPU load on ${server_name} is: "
 echo ""
 uptime
 echo ""
}
function tcp_check() {
 echo ""
 echo "TCP connections on ${server_name}: "
 echo ""
 cat /proc/net/tcp | wc -l
 echo ""
}


function check_kernel_version(){
    echo "kernel version of ${server_name} is: "
    uname -r
}

function all_checks(){
    memory_check
    disk_usage
    cpu_usage
    tcp_check
}

function run_command_on_server(){
    # Then run to exexute remotly ssh user@server_ip 'bash -s' < ./status.sh
    # in first argument user and second server ip adress
    ssh $1@$1 'bash -s' < ./status.sh
}

menu(){
    echo -ne " Application menu
    $(ColorGreen '1)') Memory usage
    $(ColorGreen '2)') CPU load
    $(ColorGreen '3)') Number of TCP connections
    $(ColorGreen '4)') Kernel version
    $(ColorGreen '5)') Check All
    $(ColorGreen '0)') Exit
    $(ColorBlue 'Choose an option:') "
    read a
    case $a in 
        1) memory_check ; menu ;;
        2) cpu_usage ; menu ;;
        3) tcp_check ; menu ;;
        4) check_kernel_version ; menu ;;
        5) all_checks ; menu ;;
        0) exit 0 ;;
        *) echo -e $red"Wrong option."$clear;

    WrongCommand;;
        esac
    }

menu
