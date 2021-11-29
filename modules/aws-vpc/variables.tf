variable "owner" {
  description = "employee firstNameLastName"
  type        = string
}

variable "stack" {
  description = "The identifier for this stack"
  type        = string
  default     = "sandbox"
}

variable "cidr" {
  description = "CIDR Block of the VPC"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "allow_ips" {}

variable "az" {
  description = "availability_zone"
}

variable "subnet_public_cidr" {
  default     = ""
}

variable "subnet_private_cidr" {
  default     = ""
}
