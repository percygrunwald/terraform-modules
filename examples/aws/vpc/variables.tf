variable "availability_zones" {
  description = "List of availability zones of the VPC"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

variable "cidr" {
  description = "The CIDR of the VPC"
  type        = string
  default     = "10.11.0.0/16"
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
  default     = ["10.11.21.0/24", "10.11.22.0/24", "10.11.23.0/24"]
}

variable "database_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the database subnets of the VPC"
  type        = list(string)
  default     = ["21", "22", "23"]
}

variable "env" {
  description = "The service env (e.g. 'dev')"
  type        = string
  default     = "test"
}

variable "private_subnets" {
  description = "List of CIDRs for the private subnets of the VPC"
  type        = list(string)
  default     = ["10.11.11.0/24", "10.11.12.0/24", "10.11.13.0/24"]
}

variable "private_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the private subnets of the VPC"
  type        = list(string)
  default     = ["11", "12", "13"]
}

variable "public_subnets" {
  description = "List of CIDRs for the public subnets of the VPC"
  type        = list(string)
  default     = ["10.11.1.0/24", "10.11.2.0/24", "10.11.3.0/24"]
}

variable "public_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the public subnets of the VPC"
  type        = list(string)
  default     = ["1", "2", "3"]
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores"
  type        = string
  default     = "percygrunwald"
}
