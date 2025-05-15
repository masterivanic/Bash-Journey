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

all_checks
# Then run to exexute remotly ssh user@server_ip 'bash -s' < ./status.sh