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
  default     = "10.40.0.0/16"
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
  default     = ["10.40.30.0/24", "10.40.31.0/24", "10.40.32.0/24"]
}

variable "database_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the database subnets of the VPC"
  type        = list(string)
  default     = ["30", "31", "32"]
}

variable "env" {
  description = "The service env (e.g. 'dev')"
  type        = string
  default     = "test"
}

variable "org_name_underscore" {
  description = "The name of the org, delimited with underscores (e.g. 'org_name')"
  type        = string
  default     = "org_name"
}

variable "private_subnets" {
  description = "List of CIDRs for the private subnets of the VPC"
  type        = list(string)
  default     = ["10.40.20.0/24", "10.40.21.0/24", "10.40.22.0/24"]
}

variable "private_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the private subnets of the VPC"
  type        = list(string)
  default     = ["20", "21", "22"]
}

variable "public_subnets" {
  description = "List of CIDRs for the public subnets of the VPC"
  type        = list(string)
  default     = ["10.40.10.0/24", "10.40.11.0/24", "10.40.12.0/24"]
}

variable "public_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the public subnets of the VPC"
  type        = list(string)
  default     = ["10", "11", "12"]
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores (e.g. 'team_name')"
  type        = string
  default     = "team_name"
}
