# Error messages in Bash Scripts can be undesirable sometimes. You can
# choose to ignore them by redirecting the error message to the
# /dev/null file. /dev/null is pseudo-device that takes in text and then
# immediately discards it.

alias conn="echo 'Total connections on port 80 and 443:' ;
netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
