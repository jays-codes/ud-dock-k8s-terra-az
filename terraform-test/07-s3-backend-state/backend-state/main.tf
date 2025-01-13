
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

#S3 bucket
resource "aws_s3_bucket" "jayslabs-backend-state" {
    bucket = "jayslabs-backend-state"

    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
    bucket = aws_s3_bucket.jayslabs-backend-state.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
    bucket = aws_s3_bucket.jayslabs-backend-state.id
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}

resource "aws_dynamodb_table" "jayslabs_backend_lock" {
    name = "jayslabs-backend-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}
