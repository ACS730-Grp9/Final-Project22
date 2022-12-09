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

variable "instance_ami" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "bastion_subnet_id" {
  type = string
}