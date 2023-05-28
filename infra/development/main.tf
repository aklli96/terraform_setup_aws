
module "iam" {
    source = "../modules/iam"
}
module "s3" {
    source = "../modules/s3"
}

#module "ec2-instance"{
#    source = "../modules/ec2"
#}
