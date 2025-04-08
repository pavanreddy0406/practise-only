#!bin/bash/
#our goal is install mysql
USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:run with root access"
else
    echo "INFO:you are in root acess"
fi
yum install mysql -y

if [$? -ne 0 ]
then 
    echo " install mysql error"
    exit 1
else
   echo "installation mysql is success"
fi