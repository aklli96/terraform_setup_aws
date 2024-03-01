variable "vpc_cide_block" {
	description = "CIDR block for VPC"
	type = string
	default = "10.0.0.0/16"
}

variable "subnet_count"{
	description = "number of subnets"
	type = map(number)
	default = {
		public = 1,
		private = 2
	}
}

variable "public_subnet_cidr_blocks"{
    description = "available CIDR blocks for public subnets"
    type = list(string)
    default = [
        "10.0.1.0/24",
        "10.0.2.0/24",
        "10.0.3.0/24",
        "10.0.4.0/24",
    ]
}

variable "private_subnet_cidr_blocks"{
    description = "available CIDR blocks for private subnets"
    type = list(string)
    default = [
        "10.0.101.0/24",
        "10.0.102.0/24",
        "10.0.103.0/24",
        "10.0.104.0/24",
    ]
}
