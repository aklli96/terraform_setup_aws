#Create s3 bucket
resource "aws_s3_bucket" "test_s3"{
for_each = toset(var.bucket_name)
bucket = each.key

tags ={
Name = "testing bucket"
Environment = "Dev"
	}
}