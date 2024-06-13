#Create security group
resource "aws_security_group" "terraform_sg" {
  name = var.sg_group_name
  description = "Terraform security group"
  vpc_id = var.vpc_id

  ingress = [{
    description = "HTTP"
    from_port = 80
    protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    to_port = 80
    prefix_list_ids = []
    security_groups = []
    self = false
  },
  {
    description = "SSH"
    from_port = 22
    protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    to_port = 22
    prefix_list_ids = []
    security_groups = []
    self = false
  },
  {
    description = "HTTPS"
    from_port = 443
    protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    to_port = 443
    prefix_list_ids = []
    security_groups = []
    self = false
  }]
  egress {
    description = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
  Name = "terrform_sg"
  }
} 

#Create policy
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
      Resource = "*"  
      }
    ]
  })
}
#Create role
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

#Attach policy to role
resource "aws_iam_policy_attachment" "ec2_policy_role" {
  name = "ec2_attachment"
  roles = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.ec2_policy.arn
}
#Attach role to instance profile

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}


resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = file("modules/ec2/my-key.pub")
}

#Create ec2 instance
resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.ec2_instance_type
  subnet_id = var.public_subnet_ids
  key_name = aws_key_pair.ssh_key.key_name
  iam_instance_profile =  aws_iam_instance_profile.ec2_profile.name
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  #defined bash script for pre-configuration
  user_data = "${file("modules/ec2/userdata.sh")}"
  tags = {
    Name = "ec2_testing_server"
  }
}

resource "aws_eip" "anthony_web_eip" {
  count = 1
  instance = aws_instance.app_server.id
  vpc = true
  tags = {
    Name = "elastic ip address"
  }
}