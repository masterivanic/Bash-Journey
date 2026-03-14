
# Files modified in the last 10 minutes
find . -type f -mmin -10

# To remove all unnecessary information from output (warnings, errors, etc.):
find / -name "*.conf" 2>/dev/null

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

# To completely clear a file
cat /dev/null > bigfile

# wath -n time command (repeat a command every few seconds)
watch -n 2 df -h

# Enable timestamps in your bash history - it's useful when you need to remember what you were working on and when.
export HISTTIMEFORMAT="%F %T "

# view your history, you'll see the date and time for each command
history | tail -n 5 

history 5

# Top 10 most frequently modified files
git log --pretty=format: --name-only | sort | uniq -c | sort -nr | head -10


"""
-F, --fixed-strings
              Interpret PATTERN as a list of fixed strings, separated by newlines, any of which is to be matched.    
-x, --line-regexp
              Select only those matches that exactly match the whole line.
-v, --invert-match
              Invert the sense of matching, to select non-matching lines.
-f FILE, --file=FILE
              Obtain patterns from FILE, one per line.  The empty file contains zero patterns, and therefore matches nothing.

"""
grep -Fxvf file1 file2 # get diff beetween 2 files 

grep ^word filepath # eg grep ^dave /opt/directory/file (with find all word started with dave in my file)

grep 'word$' filepath # eg grep dave$ /opt/directory/file (with find all word ended with dave in my file)

grep -A1 'word|pattern' filepath # eg grep -A1 dave /opt/directory/file (with find all word with dave and print word after)

grep -B1 'word|pattern' filepath # eg grep -B1 dave /opt/directory/file (with find all word with dave and print word before)

grep -C1 'word|pattern' filepath # eg grep -C1 dave /opt/directory/file (with find all word with dave and print context before and after)

grep -i 'word' filepath # eg grep -i dave /opt/directory/file (find all word with dave key insensitive)

grep -o 'word' filepath # eg grep -o '^d.' /opt/directory/file (find only word with matches pattern)

compgen -b # print all bash builtin command

bash -n file # check syntax error in a bash script

echo $? # return result code of previous command bash entered. 0 if not error



