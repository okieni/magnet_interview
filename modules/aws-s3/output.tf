output "bucket_id" {
  value       = aws_s3_bucket.my_s3_bucket.id
  description = "Bucket Name (aka ID)"
}

output "bucket_arn" {
  value       = aws_s3_bucket.my_s3_bucket.arn
  description = "Bucket ARN"
}
