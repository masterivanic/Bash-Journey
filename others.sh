
# Files modified in the last 10 minutes
find . -type f -mmin -10

# Which log files have been changed or written to in the last hour"
find /var/log -type f -mmin -60

# Modified in the last 24 hours
find . -type f -mtime -1

# Only directories modified in the last 30 minutes
find . -type d -mmin -30

# Show modification time along with the results
find . -type f -mmin -15 -exec ls -lh {} \;

# creates directories for two sites, each with its own subfolders: backup, monitoring, and network.
mkdir -p ~/myfolder/{site-01,site-02}/{backup,monitoring,network}

# wath -n time command (repeat a command every few seconds)
watch -n 2 df -h
