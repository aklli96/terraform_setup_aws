
module "iam" {
    source = "./modules/iam"
}
module "s3" {
    source = "./modules/s3"
    dev_group = module.iam.dev_group
}

module "ec2-instance"{
    source = "./modules/ec2"
#    dev_group = module.iam.dev_group
}
