terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
	region = "${var.region}"
  access_key = "AKIAQJI4UGD3OS5VZ4MR"
  secret_key = "${var.IAM_secret}"
}

