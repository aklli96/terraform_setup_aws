
resource "aws_instance" "app_server" {
  ami           = "ami-0b5eea76982371e91"
  instance_type = "t2.micro"

  tags = {
    Name = "testing_server"
  }
}

resource "aws_s3_bucket" "tests3"{
for_each = toset(var.bucket_name)
bucket = each.key

tags ={
Name = "testing bucket"
Environment = "Dev"
	}
}
