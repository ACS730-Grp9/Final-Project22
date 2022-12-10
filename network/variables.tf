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
  default     = ["10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
  type        = list(string)
  description = "Public Subnet CIDRs"
}

variable "private_subnet_cidrs" {
  default     = ["10.100.4.0/24", "10.100.5.0/24", "10.100.6.0/24"]
  type        = list(string)
  description = "Private Subnet CIDRs"
}

variable "vpc_cidr" {
  default     = "10.100.0.0/16"
  type        = string
  description = "VPC to host static web site"
}

variable "env" {
  default     = "Dev"
  type        = string
  description = "Deployment Environment"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}


variable "min_size" {
  type    = number
  default = "2"
}

variable "max_size" {
  type    = number
  default = "4"
}

variable "desired_capacity" {
  type    = number
  default = "2"
}

variable "your_bucket_name" {
  type = string
}