#!/bin/bash/
TO_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e s[]\/$*.^[]/\\&/g' <<< $3)
echo "escaped content: $BODY"
TEAM_NAME=$4
ALERT_TYPE=$5

#echo "all args: $@"
#echo "$BODY | mail -s "$SUBJECT" $TO_ADDRESS
FINAL_BODY=$(sed -e "s/TEAM_NAME/$TEAM_NAME/g" -e "s/ALRET_TYPE/$ALRET_TYPE/g" -e "s/MESSAGE/$BODY/g" template.html)
echo "$FINAL_BODY" | mail -s "$SUBJECT" "$TO_ADDRESS"