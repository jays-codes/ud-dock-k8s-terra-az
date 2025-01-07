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

#create an s3 bucket and enable versioning
resource "aws_s3_bucket" "bucket-jayslabs-04" {
  bucket = "bucket-jayslabs-04"
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket-jayslabs-04.id
  versioning_configuration {
    status = "Enabled"
  }
}

#create an IAM user
resource "aws_iam_user" "user-jayslabs" {
  name = "user-jayslabs-07"
}
