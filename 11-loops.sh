#!/bin/bash/
DATE=$(date +%F)
LOGDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$0-$DATE.log

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N=\e[0m"
VALIDATE (){
if [ $i -ne 0 ]
then
    echo " installing $2...$R failure $N"
    exit 1

else
    echo " installing $2 ... $G sucess $N"
fi
}



if[ $USERID -ne 0 ];
then
    echo "$R ERROR:please go with root acess $N"
    exit 1
fi
for i in $@
do

yum installed $i &>>LOGFILE
 if [ $i -ne 0 ]
 then
     echo "$i is not installed : lets install"
     exit 1
     yum install $i -y &>>LOGFILE
     VALIDATE $? "$i"
else
   echo " $Y $i is alredy installed $N"
fi
done