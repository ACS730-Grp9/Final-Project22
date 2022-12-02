# //////////////////////////////
# S3 BUCKET
# //////////////////////////////

variable "bucket_name" {
  type    = list(string)
  default = ["prod", "staging", "dev"]
}

variable "region" {
  type    = string
  default = "us-east-1"
}