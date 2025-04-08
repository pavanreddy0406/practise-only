#!bin/bash/
#our goal is install mysql postfix
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT-NAME-$DATE.log

USERID=$(id -u)
VALIDATE(){
    #$1 is first argument
if [ $1 -ne 0 ]
then 
    echo "$2 is failure"
    exit 1
else 
   echo "$2 is sucess"
fi
}

if [ $USERID -ne 0 ]
then 
    echo "ERROR:run with root access"
else
    echo "INFO:you are in root acess"
fi
yum install mysql -y >>$LOGFILE

VALIDATE  $? "mysql"
yum install postfix -y >>$LOGFILE
VALIDATE $? "postfix"
