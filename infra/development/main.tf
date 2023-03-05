module "ec2-instance"{
    source = "../modules/ec2"
}

module "s3" {
    source = "../modules/s3"
}
