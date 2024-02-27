variable "ec2_instance_type" {
  default = "t2.micro"
}


variable "ami"{
    default = "ami-0440d3b780d96b29d"
}


variable "sg_group_name"{
  default = "testing_sg_gp"
}

#variable "vpc_id" {}