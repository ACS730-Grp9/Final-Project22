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

variable "key_name" {
  type = string
}

variable "key_path" {
  type = string
}