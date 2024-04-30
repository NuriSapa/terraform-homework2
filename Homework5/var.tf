variable "region" {
  type        = string
  description = "region"

}

variable "vpc_cidr" {
  description = "cider block for the vpc"
}

variable "enable_dns_support" {
  description = "Enable DNS support for the VPC"
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC"
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(object({
    cidr             = string
    availability_zone = string
  }))
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(object({
    cidr             = string
    availability_zone = string
  }))
}

variable "instance_type" {
  type = string

}

variable "ec2_types" {
  description = "List of EC2 instance types"
  type        = list(object({
    ami_id       = string
    instance_type = string
    name          = string
  }))
}