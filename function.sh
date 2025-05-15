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

hello Dave