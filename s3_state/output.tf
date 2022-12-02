# //////////////////////////////
# S3 BUCKET
# //////////////////////////////

output "bucket_id" {
  # The names of the buckets.
  value = [for bucket in aws_s3_bucket.project_buckets : bucket.id]
}