#!/bin/bash
#using aws cli to launch ec2 instance  
echo "Creating an Instance"
aws ec2 run-instances --image-id ami-080660c9757080771 --count 1 --instance-type t2.micro --key-name Desktop-key --security-group-ids sg-0df4f7865ece65369 > output.txt

#Wait for the file to be completely written
echo "Sleep 90 seconds for the vm to be in running state"
sleep 90

#fetching the publicdns of the launched instance
instanceid=$(cat output.txt | grep "InstanceId" | awk '{print $2}' | sed 's|["",]||g' | head -n 1)
echo ${instanceid}
ip=$(aws ec2 describe-instances --instance-ids ${instanceid} | grep "PublicDnsName" |awk '{print $2}' | sed 's|["",]||g'| head -n 1)
echo ${ip}


#trying to ssh now..
echo "Starting connection script...".
ssh -i "Desktop-key.pem" ubuntu@"${ip}"
