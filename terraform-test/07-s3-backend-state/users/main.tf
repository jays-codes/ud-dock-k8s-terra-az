
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "jayslabs-backend-state"
    key = "07-s3-backend-state/users/backend-state"
    region = "us-east-1"
    dynamodb_table = "jayslabs-backend-lock"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

#create an IAM user
resource "aws_iam_user" "user_jayslabs" {
  name = "${terraform.workspace}_user_jayslabs_01"
}


