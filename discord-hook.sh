
# create tmp file

function docker_status(){
    echo "----------------------- Container health check stats  ----------------------------"
    sudo docker ps -a --filter status=running --format=json | jq '.'
    echo ""
}

function memory_check() {
 echo "----------------------- Memory checking ---------------------------- "
 echo "The current memory usage is: "
 free -ht
 echo ""
}

function tcp_check() {
 echo "----------------------- TCP Connexions ---------------------------- "
 echo "TCP connections on ${server_name}: "
 echo ""
 cat /proc/net/tcp | wc -l
 echo ""
}


function cpu_usage() {
 echo echo "----------------------- CPU Checking ---------------------------- "
 echo "CPU load on ${server_name} is: "
 echo ""
 uptime
 echo ""
}

echo "******************** FACTURE FLY SERVER REPORT ********************" > system_report.txt
{
    docker_status
    memory_check
    tcp_check
    cpu_usage
} >> system_report.txt

WEBHOOK_URL=$WEBHOOK_URL
curl -F "file=@system_report.txt" "$WEBHOOK_URL"

websites_list="https://www.facturefly.com/ https://back.facturefly.com/"
for website in ${websites_list} ; do
    status_code=$(curl --write-out %{http_code} --silent --output /dev/null -L ${website})
    echo $status_code
    if [[ "$status_code" -ne 200 ]] ; then
            curl -H "Content-Type: application/json" -X POST -d '{"content":"'"${website} is down 🔥!}"'"}'  $WEBHOOK_URL
    else
        curl -H "Content-Type: application/json" -X POST -d '{"content":"'"${website} is running!}"'"}'  $WEBHOOK_URL
        fi
done