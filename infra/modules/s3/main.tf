#Create s3 policy
resource "aws_iam_policy" "ec2_policy" {
  name = "test_policy"
  path = "/"
  description = "My test policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ssm:GetParameters",
          "ssm:GetParameter"
        ],
        Resource = "*"
      },
      {
        "Effect" : "Allow",
        "Action" :[
          "s3:GetObject",
          "s3:*"
        ],
      "Resource":[
        "*"
      ]  
      }
    ]
  })
}
#Create s3 role
resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

#Attach s3 role to policy
resource "aws_iam_policy_attachment" "ec2_policy_role" {
  name = "ec2_attachment"
  roles = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.ec2_policy.arn
}


#Create s3 bucket
resource "aws_s3_bucket" "tests3"{
for_each = toset(var.bucket_name)
bucket = each.key

tags ={
Name = "testing bucket"
Environment = "Dev"
	}
}