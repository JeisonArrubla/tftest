terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }
  required_version = "~>1.11.0"
}

provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = var.tags
  }
}
