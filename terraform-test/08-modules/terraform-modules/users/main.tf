

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  user_name = "jayslabs"
}

#create an IAM user
resource "aws_iam_user" "user_jayslabs" {
  name = "${var.environment}_${local.user_name}_01"
}


