#
# After get aws cli access to ec2
# this script let you have a list of the instances
#


# Column names separated by ;
echo 'InstanceId;InstanceType;ImageId;State;LaunchTime;AvailabilityZone;Tenancy;PrivateIpAddress;PrivateDnsName;PublicDnsName;TagName;TagRole;VpcId;Arch' > AllEC2Instances-1.csv

# Column separated by tab
aws ec2 describe-instances --output text --query 'Reservations[*].Instances[*].[InstanceId, InstanceType, ImageId, State.Name, LaunchTime, Placement.AvailabilityZone, Placement.Tenancy, PrivateIpAddress, PrivateDnsName, PublicDnsName, [Tags[?Key==`Name`].Value] [0][0], [Tags[?Key==`Role`].Value] [0][0], VpcId, Architecture ]' >> AllEC2Instances-1.csv
