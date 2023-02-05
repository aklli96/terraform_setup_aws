data "aws_security_group" "lb_sg" {
  name = var.sg_group_name
}