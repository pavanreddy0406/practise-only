#!/bin/bash/
DATE=$(date +%F:+%H:+%M:+%S)
LOGFILE_DIRECTORY=/tmp
# /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIR/$SCRIPT_NAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m" 
DISK_USAGE=$(df -hT|grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
while IFS= read line
do
usage=$(echo $line |awk '{print$6}' |cut -d  % -f1)
partition=$(echo $line |awk '{print $1}')
if [ $usage -gt $DISK_USAGE_THRESHOLD ];
then
     message+="HIGH DISK USAGE $partition: $usage"
fi
done <<< $DISK_USAGE
echo -e "message: $message"

echo "$message" | mail -s "high disk usage" pavanreddyyeddala@gmail.com