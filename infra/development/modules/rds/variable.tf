variable "settings"{
    description = "Config settings"
    type = map(any)
    default = {
        "database" = {
            allocated_storage = 10
            engine = "mysql"
            engine_version = "8.0.35"
            instance_class = "db.t2.micro"
            db_name = "Anthony_db"
            skip_final_snapshot = true
        },
        "web_app" = {
            count = 1
            instance_type = "t2.micro"
        }
    }

}

variable "vpc_id" {
	description = "vpc_id"
	type = string
}

variable "ec2_sg_id"{
    description = "ec2 security group id"
    type = string
}

variable "private_subnet_ids"{
    description = "private subnet ids"
    type = list(string)
}

variable "db_username"{
	description = "Database master user"
	type = string
	sensitive = true
}

variable "db_password"{
	description = "Database master user password"
	type = string
	sensitive = true
}