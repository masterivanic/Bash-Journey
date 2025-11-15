
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

# Enable timestamps in your bash history - it's useful when you need to remember what you were working on and when.
export HISTTIMEFORMAT="%F %T "

# view your history, you'll see the date and time for each command
history | tail -n 5 

history 5

