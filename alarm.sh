#!/bin/bash

echo "Every Alarm should be associated with an action (called SNS topic atleast one topic exists in every sns account)"
echo "Get the ARN of the default topic that exists in your account"
aws sns list-topics > output.txt
defaulttopicARN=$(cat output.txt | grep '.*Default*' | awk '{print $2}' | sed 's|[,""]||g')
echo "Default Topic ARN is ${defaulttopicARN}"
aws cloudwatch put-metric-alarm --alarm-name cpu-mon --alarm-description "Alarm when CPU exceeds 70 percent" --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average --period 300 --threshold 70 --comparison-operator GreaterThanThreshold  --dimensions "Name=InstanceId,Value=i-12345678" --evaluation-periods 2 --alarm-actions "${defaulttopicARN}" --unit Percent
aws cloudwatch put-metric-alarm --alarm-name cpu-mon --alarm-description "Alarm when CPU exceeds 70 percent" --metric-name CPUCreditBalance --namespace AWS/EC2 --statistic Average --period 300 --threshold 70 --comparison-operator GreaterThanThreshold  --dimensions "Name=InstanceId,Value=i-12345678" --evaluation-periods 2 --alarm-actions arn:aws:sns:ap-southeast-2:851725483404:alarm-notif --unit Percent

