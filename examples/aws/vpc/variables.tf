variable "availability_zones" {
  description = "List of availability zones of the VPC"
  type        = list(string)
  default     = ["sa-east-1a", "sa-east-1c"]
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "sa-east-1"
}

variable "cidr" {
  description = "The CIDR of the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "custom_tags" {
  description = "Custom tags to set on the vpc"
  type        = map(string)
  default = {
    Example = "yes"
  }
}

variable "database_subnets" {
  description = "List of CIDRs for the private database subnets of the VPC"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "env" {
  description = "The service env (e.g. 'dev')"
  type        = string
  default     = "test"
}

variable "private_subnets" {
  description = "List of CIDRs for the private subnets of the VPC"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "public_subnets" {
  description = "List of CIDRs for the public subnets of the VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores"
  type        = string
  default     = "sre_observability"
}
