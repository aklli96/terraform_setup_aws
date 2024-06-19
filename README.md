# terraform_setup_aws
Set up AWS services by Terrform

Architechture

![Screenshot 2024-03-01 171523](https://github.com/aklli96/terraform_setup_aws/assets/103712883/ef4b92d1-492b-4562-9861-4d32602be06e)


Currently, this program can set up



1. ec2 instance in public subset (single az)

2. RDS instance in private subset and configure the security group which only allows ec2 instance to access the database (multi-az)

3. S3 with internet access to ec2 and VPC gateway endpoing access to RDS 

4. network gatewway access to the public internet

5. IAM for setting up the user with certain policies







# IAM set up prerequisition


## Please create a file "secrets.tfvars" in directory "development" with the following format
1. 
```
IAM_secret = "your access secrets"
db_username = "your db user name"
db_password = "your password"
```
2. Fill in your access key into modules/provider.tf, you are able to generate access key in aws console, right hand corner -> Security credentials -> create access key

3. Please also generate your own private and public key named "my-key.pem" & "my-key.pub" inside development/modules/ec2

4. You can define your user name in development/modules/iam/variable.tf


## How to connect ec2 thru SSH
```
cd modules/ec2
ssh -i my-key.pem ec2-user@ec2-{your_ipv4_public_ip_address}.compute-1.amazonaws.com
```

## How to connect RDS mysql server using ec2
```
mysql -h <your RDS mysql endpoint> -P 3306 -u <predefined user name> -p
```
