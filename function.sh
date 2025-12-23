#!/bin/bash

#Notice: One thing to keep in mind is that you should not add the parenthesis when you call the function.


#######################################
# Description: Hello function
# Globals:
# None
# Arguments:
# Single input argument
# Outputs:
# Value of input argument
# Returns:
# 0 if successful, non-zero on error.
#######################################
function hello() {
    echo "Hello world $1"
}

#https://blog.stephane-robert.info/docs/admin-serveurs/linux/namespaces/
function debugContainer() {
    read -p "Enter your containerName ? " containerName
    echo "container name is: $containerName"
    containerId=$(docker ps -a --format '{{.ID}}' -f "name=${containerName}" -n 1)
    echo "container id is: $containerId"
    PID=$(docker inspect -f '{{.State.Pid}}' ${containerName})
    echo "container pid is: $PID"
    docker run --rm --pid=host --net=host --privileged ubuntu bash -lc "nsenter -t $PID -m -u -i -n -p"
}


hello Dave
