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

#out status of bucket versioning
output "versioning_status" {
  value = aws_s3_bucket_versioning.bucket_versioning.versioning_configuration[0].status
}

#out bucket arn
output "bucket_arn" {
  value = aws_s3_bucket.bucket-jayslabs-04.arn
}

#out aws iam user
output "iam_user_details" {
  value = aws_iam_user.user-jayslabs
}
