variable "env" {
  type = string
}

variable "group_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "security_groups" {
  type = string
}

variable "public_subnet" {
  type = string
}
variable "private_subnet" {
  type = string
}



variable "ami" {
  type = string
  default = "ami-08e637cea2f053dfa"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
  default = "newAccount-key"
}

variable "min_size" {
  type = number
  default = "2"
}
variable "desired_capacity" {
   type = number
  default = "3"
}
variable "max_size" {
  type = number
  default = "5"
}
variable "scale_up_threshold" {
   type = number
  default = "3"
}
variable "target_group_arn" {
  type = string
}

variable "scale_down_threshold" {
     type = number
     default = "5"
}