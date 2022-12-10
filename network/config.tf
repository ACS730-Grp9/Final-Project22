provider "aws" {
  region = module.globalvars.region
}

terraform {
  backend "s3" {
    bucket = "acs730-group9-dev-kb"
    key    = "dev-network/terraform.tfstate"
    region = "us-east-1"
  }
}