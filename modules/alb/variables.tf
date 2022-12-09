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

variable "bastion_security_group_id" {
  type = string
}

variable "public_subnet" {
  type = list(string)
}

variable "private_subnet" {
  type = list(string)
}