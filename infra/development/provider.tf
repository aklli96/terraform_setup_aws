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
  access_key = "AKIAQJI4UGD3BGE7XLB3"
  secret_key = "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"
}