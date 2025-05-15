alias conn="echo 'Total connections on port 80 and 443:' ;
netstat -plant | grep '80\|443' | grep -v LISTEN | wc -l"
