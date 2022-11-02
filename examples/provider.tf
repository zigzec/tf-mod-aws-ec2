terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
  assume_role {
    role_arn     = "arn:aws:iam::123456789012:role/thanos-role"
    session_name = "aws-test-zone"
  }
}
