#!/bin/bash/
DATE=$(DATE +%F:+%H:+%M:+%S)
LOGFILE_DIR=/tmp
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRCTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"
DISK_USAGE=$(df -hT |grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
 
while IFS= read line
do
usage=$(echo $line |awk '{print $6}'|cut -d % -f1)
partition=$(echo $line |awk '{print $1}')
if { $usage -gt $DISK_USAGE_THRESHOLD };
then
message+="high disk usage on $partition:$usage"

done <<< $DISK_USAGE

echo "MESSAGE: $message"