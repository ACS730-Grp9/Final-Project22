variable "default_tags" {
  default     = {}
  type        = map(any)
  description = "Default tags to be applied to all AWS resources"
}

variable "common_name" {
  type = string
}

variable "env" {
  type = string
}

variable "prefix" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "instance_ami" {
  type = string
}

variable "key_name" {
  type = string
}

variable "public_subnet" {
  type = list(string)
}
variable "private_subnet" {
  type = list(string)
}

variable "members" {
  type = list(string)
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "min_size" {
  type    = number
  default = "2"
}
variable "desired_capacity" {
  type    = number
  default = "3"
}
variable "max_size" {
  type    = number
  default = "5"
}
variable "scale_up_threshold" {
  type    = number
  default = "3"
}
variable "target_group_arn" {
  type = string
}

variable "scale_down_threshold" {
  type    = number
  default = "5"
}


variable "bucket_name" {
  type = string
}