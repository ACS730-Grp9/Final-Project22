variable "default_tags" {
  default = {
    "Owner" = "ACS730-Project",
    "App"   = "Web"
  }
  type        = map(any)
  description = "Default tags to be applied to all AWS resources"
}

variable "prefix" {
  type        = string
  default     = "Group9"
  description = "Name prefix"
}

variable "public_subnet_cidrs" {
  default     = ["10.250.1.0/24", "10.250.2.0/24", "10.250.3.0/24"]
  type        = list(string)
  description = "Public Subnet CIDRs"
}

variable "private_subnet_cidrs" {
  default     = ["10.250.4.0/24", "10.250.5.0/24", "10.250.6.0/24"]
  type        = list(string)
  description = "Private Subnet CIDRs"
}

variable "vpc_cidr" {
  default     = "10.250.0.0/16"
  type        = string
  description = "VPC to host static web site"
}

variable "env" {
  default     = "Prod"
  type        = string
  description = "Deployment Environment"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}


variable "min_size" {
  type    = number
  default = "3"
}

variable "max_size" {
  type    = number
  default = "4"
}

variable "desired_capacity" {
  type    = number
  default = "3"
}

variable "your_bucket_name" {
  type = string
}

