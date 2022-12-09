module "globalvars" {
  source = "../modules/globalvars"
}

resource "aws_s3_bucket" "project_buckets" {
  for_each      = toset(var.bucket_name)
  bucket        = each.key
  force_destroy = true

  tags = module.globalvars.default_tags
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  for_each = toset(var.bucket_name)
  bucket   = each.key

  versioning_configuration {
    status = "Disabled"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  for_each = toset(var.bucket_name)
  bucket   = each.key

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
