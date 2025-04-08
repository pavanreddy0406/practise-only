#!bin/bash/
#our goal is install mysql
USERID=$(id -u)
VALIDATE(){
    #$1 is first argument
if [ $1 -ne 0 ]
then 
    echo "installation is failure"
    exit 1
else 
   echo "installlation is sucess"
fi
}

if [ $USERID -ne 0 ]
then 
    echo "ERROR:run with root access"
else
    echo "INFO:you are in root acess"
fi
yum install mysql -y

VALIDATE  $?
yum install postfix -y
VALIDATE $?