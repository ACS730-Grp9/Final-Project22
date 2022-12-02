# //////////////////////////////
# S3 BUCKET
# //////////////////////////////

variable "bucket_name" {
  type    = list(string)
  default = ["ACS730-Group9-prod", "ACS730-Group9-staging", "ACS730-Group9-dev"]
}

variable "region" {
  type    = string
  default = "us-east-1"
}