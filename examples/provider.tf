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

  ## option 1
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"

  ## option 2
  #assume_role {
  #  role_arn     = "arn:aws:iam::123456789012:role/thanos-role"
  #  session_name = "aws-test-zone"
  #}

  ## option 3
  # set aws config/credentials OR export AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY
}
