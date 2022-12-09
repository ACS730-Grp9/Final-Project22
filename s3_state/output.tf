output "bucket_id" {
  value = [for bucket in aws_s3_bucket.project_buckets : bucket.id]
}