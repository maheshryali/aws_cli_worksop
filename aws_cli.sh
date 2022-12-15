## aws_cli ec2-describe-availabilityzones and creates a json file
### 1. https://jsoncrack.com/editor
aws ec2 describe-availability-zones > availabilityzones.json
### To query the specific values
aws ec2 describe-availability-zones --query "AvailabilityZones[0].ZoneId"
### to find zone id for the zone name us-east-1a
### for reference https://jmespath.org/tutorial.html#filter-projections 
aws ec2 describe-availability-zones --query "AvailabilityZones[?ZoneName=='us-east-1a'].ZoneId | [0]" --output text
### to see any service we have describe or list to view all 
### To filter output for preference see scope,filter,jmespath
### to repeat anything in shell scipt use while



## create aws instance
aws ec2 run-instances \
  --image-id ami-0574da719dca65348 \
  --instance-type t2.micro \
  --key-name "keypair" 

## To create tags for the instance
aws ec2 create-tags \
  --resources  i-0d186018cd57bc0ef \
  --tags "Key=project,Value=ec2" "Key=Env,Value=test" "Key=release,Value=v1.0"