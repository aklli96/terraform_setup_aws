variable "region" {
	default = "us-east-1"
}

variable IAM_secret{
	description = "IAM secret key"
	type = string
	sensitive = true
}

variable "env" {
	default = "dev"
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