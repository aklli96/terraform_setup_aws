#Create s3 bucket
resource "aws_s3_bucket" "test_s3"{
bucket = "anthonytesting100001"
acl = "private"
tags ={
Name = "testing_bucket"
Environment = "Dev"
	}
}

resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  description = "My test policy"
  policy = data.aws_iam_policy_document.s3_policy.json
}