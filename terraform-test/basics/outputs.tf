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