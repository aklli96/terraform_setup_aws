output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "ec2_instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "aws_key_pair"{
  value = aws_key_pair.ssh_key.public_key
}

output "ec2_sg_id"{
  value = aws_security_group.terraform_sg.id
}
