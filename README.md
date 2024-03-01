# terraform_setup_aws
Set up AWS services by Terrform

Currently, this program can set up

A VPC including
1. ec2 instance in public subset 

2. RDS instance in private subset and configure the security group which only allows ec2 instance to access the database

3. S3 with all access

4. NAT gatewway to access to the public internet







# IAM set up prerequisition

## Please create a file "secrets.tfvars" in development and with the following format
```
IAM_secret = "your access secrets"
db_username = "your db user name"
db_password = "your password"
```

## Please also generate your own key name "my-key.pub" inside development/modules/ec2

## You can define your user name in development/modules/iam/variable.tf
