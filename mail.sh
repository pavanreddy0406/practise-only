#!/bin/bash/
TO_ADDRESS=$1
SUBJECT=$2
BODY=$3
TEAM_NAME=$4
ALERT_TYPE=$5

#echo "all args: $@"
#echo "$BODY | mail -s "$SUBJECT" $TO_ADDRESS
FINAL_BODY=$(sed -e 's/TEAM_NAME/devops team/g' -e 's/ALRET_TYPE/high disk usage/g' -e "s/message/$BODY/g" template.html)
echo "$FINAL_BODY | mail -s "$SUBJECT" $TO_ADDRESS