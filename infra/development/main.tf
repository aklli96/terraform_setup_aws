
module "iam" {
    source = "./modules/iam"
}

module "vpc"{
    source = "./modules/vpc"
}

module "s3" {
    source = "./modules/s3"
    dev_group = module.iam.dev_group
}

module "ec2-instance"{
    source = "./modules/ec2"
    vpc_id = module.vpc.vpc_id
    public_subnet_ids = module.vpc.public_subnet_ids
}

module "rds"{
    source = "./modules/rds"
    db_username = var.db_username
    db_password = var.db_password
    vpc_id = module.vpc.vpc_id
    private_subnet_ids = module.vpc.private_subnet_ids
    ec2_sg_id = module.ec2-instance.ec2_sg_id
}