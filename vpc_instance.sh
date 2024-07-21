#!/bin/bash
echo "Creating VPC in preferred region..."
aws ec2 create-vpc --cidr-block "10.0.0.0/16" --tag-specifications ResourceType=vpc,'Tags=[{Key=Name,Value=MyVPC}]'> output.txt
VPCID=$(grep "VpcId" output.txt  | awk '{print $2}' | sed 's|["",]||g')
echo "VPC created with VPC ID ${VPCID}"

echo "Creating a Subnet"
aws ec2 create-subnet --vpc-id "$VPCID" --cidr-block "10.0.0.0/24" --tag-specifications ResourceType=subnet,'Tags=[{Key=Name,Value=Pub>
SNID=$(grep "SubnetId" output.txt  | awk '{print $2}' | sed 's|["",]||g')
echo "Subnet created with ${SNID}"
echo "Create a Route Table"
aws ec2 create-route-table --vpc-id "$VPCID" > output.txt
RTID=$(grep "RouteTableId" output.txt  | awk '{print $2}' | sed 's|["",]||g')
echo  "Route table created with ID ${RTID}"
echo "Creating an Internet Gateway"
aws ec2 create-internet-gateway --tag-specifications ResourceType=internet-gateway,'Tags=[{Key=Name,Value=Public-IG}]'>output.txt
IGID=$(grep "InternetGatewayId" output.txt  | awk '{print $2}' | sed 's|["",]||g')
echo "IG created with ID ${IGID}"
sleep 30
echo "Attaching the Internet Gateway to the VPC"
aws ec2 attach-internet-gateway --internet-gateway-id "${IGID}" --vpc-id "${VPCID}"
echo "Createing a route for 0.0.0.0/0 between the subnet ${SNID} and the Internet Gateway ${IGID}"
aws ec2 create-route --route-table-id "$RTID" --destination-cidr-block 0.0.0.0/0 --gateway-id "${IGID}"
echo "Associating the Route Table ${RTID} with Subnet ${SNID}"
