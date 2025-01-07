variable "user_name" {
  type    = string
  default = "user-jayslabs"
}

variable "user_count" {
  type    = number
}

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

#create 2 IAM user
resource "aws_iam_user" "users-jayslabs" {
  count = var.user_count
  name  = "${var.user_name}-${count.index}"
}
