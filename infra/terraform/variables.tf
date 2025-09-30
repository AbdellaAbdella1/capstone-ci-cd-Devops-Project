# AWS Configuration
variable "aws_region" {
  description = "The AWS region to deploy resources into."
  type        = string
  default     = "eu-east-1"
}

variable "key_pair_name" {
  description = "The name of the EC2 Key Pair to use for SSH access."
  type        = string
  default     = "your-key-pair-name" # <-- IMPORTANT: Change this default!
}

# Project and Naming
variable "project_name" {
  description = "A prefix used for resource naming and tags."
  type        = string
  default     = "DevOps"
}

# Network Configuration
variable "vpc_cidr" {
  description = "The CIDR block for the main VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_a_cidr" {
  description = "The CIDR block for Subnet A."
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_b_cidr" {
  description = "The CIDR block for Subnet B."
  type        = string
  default     = "10.0.2.0/24"
}

variable "az_a" {
  description = "The Availability Zone for Subnet A."
  type        = string
  default     = "eu-west-2a"
}

variable "az_b" {
  description = "The Availability Zone for Subnet B."
  type        = string
  default     = "eu-west-2b"
}

# Instance Configuration
variable "ami_id" {
  description = "The AMI ID for the EC2 instances (Ubuntu 22.04 LTS in eu-west-2)."
  type        = string
  default     = "ami-0c1a7f89451184c8b"
}

variable "instance_type" {
  description = "The instance type for all EC2 hosts."
  type        = string
  default     = "t2.micro"
}
