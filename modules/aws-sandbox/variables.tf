variable "employee" {
  description = "employee firstName_lastName"
  type        = string
}

variable "cidr" {
  description = "CIDR Block of the VPC"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "home_ip" {
  description = "Employee Home IP"
}

variable "az" {
  description = "availability_zone"
  default     = "us-east-1a"
}

variable "subnet_public_cidr" {
  default     = ""
}

variable "subnet_private_cidr" {
  default     = ""
}
