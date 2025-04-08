#!bin/bash/
#our goal is install mysql
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:run with root access"
else
    echo "INFO:you are in root acess"
fi
yum install myaql -y