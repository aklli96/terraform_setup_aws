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
  name        = "s3_test_policy"
  description = "My test policy"
  policy = data.aws_iam_policy_document.s3_policy.json
}


resource "aws_iam_group_policy_attachment" "s3-group-attach" {
  group      = var.dev_group
  policy_arn = aws_iam_policy.policy.arn
}