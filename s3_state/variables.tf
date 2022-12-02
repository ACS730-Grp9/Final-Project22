# //////////////////////////////
# S3 BUCKET
# //////////////////////////////

variable "bucket_name" {
  type    = list(string)
  default = ["acs730-group9-prod", "acs730-group9-staging", "acs730-group9-dev"]
}

variable "region" {
  type    = string
  default = "us-east-1"
}