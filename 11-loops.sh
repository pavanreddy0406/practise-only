#!/bin/bash/
DATE=$(date +%F)
LOGDIR=/home/centos/shellscript-logs
#/home/centos/shellscript-logs/script-name-datw.log
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\[0m"
if [ $USERID -ne 0 ]
then
  echo -e "$R ERROR:please run with root acess $N"
  exit 1
fi
VALIDATE(){
if [ $i -ne 0 ]
then
echo "$2 installing $R failure$N"
else
echo "$2 installing $G sucess$N"
fi
}

for i in $@
do

yum installed $i >>$LOGFILE
if [ $? -ne 0 ]
then
    echo "$i not install: lets install"
yum install $i -y >>$LOGFILE
VALIDATE $? "$i"
else
    echo -e "$i $Y installed alredy $N"
fi