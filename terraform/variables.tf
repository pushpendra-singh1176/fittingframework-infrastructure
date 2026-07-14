variable "aws_region" {

  description = "AWS Region where resources will be deployed."

  type = string

  default = "ap-south-1"
  validation {
    condition = contains(
      ["ap-south-1", "us-east-1", "eu-west-1"],
      var.aws_region
    )

    error_message = "Unsupported AWS Region."
  }

}
variable "project_name" {

  description = "Project Name."

  type = string

  validation {

    condition = length(trimspace(var.project_name)) > 0


    error_message = "Project name cannot be empty."

  }

}
variable "environment" {

  description = "Deployment Environment."

  type = string

  default = "dev"

  validation {

    condition = contains(
      ["dev", "stage", "prod"],
      var.environment
    )

    error_message = "Environment must be dev, stage, or prod."

  }

}
variable "owner" {

  description = "Resource Owner."

  type = string

  validation {

    condition = (
      length(trimspace(var.owner)) > 0 &&
      length(trimspace(var.owner)) <= 50
    )

    error_message = "Owner cannot be empty."

  }

}
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "Please provide a valid VPC CIDR block."
  }
}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  type        = string

  validation {
    condition     = can(cidrhost(var.public_subnet_cidr, 0))
    error_message = "Please provide a valid Public Subnet CIDR."
  }
}

variable "private_subnet_cidr" {
  description = "Private Subnet CIDR"
  type        = string

  validation {
    condition     = can(cidrhost(var.private_subnet_cidr, 0))
    error_message = "Please provide a valid Private Subnet CIDR."
  }
}

variable "public_availability_zone" {
  description = "Public Availability Zone"
  type        = string

  validation {
    condition     = length(trimspace(var.public_availability_zone)) > 0
    error_message = "Public Availability Zone cannot be empty."
  }
}

variable "private_availability_zone" {
  description = "Private Availability Zone"
  type        = string

  validation {
    condition     = length(trimspace(var.private_availability_zone)) > 0
    error_message = "Private Availability Zone cannot be empty."
  }
}
variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.33"

  validation {
    condition = contains(
      ["1.31", "1.32", "1.33"],
      var.cluster_version
    )

    error_message = "Supported EKS versions are 1.31, 1.32, or 1.33."
  }
}
