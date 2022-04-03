# Required variables (a-z)

variable "availability_zones" {
  description = "List of availability zones of the VPC (e.g. ['us-west-2a', 'us-west-2b', 'us-west-2c'])"
  type        = list(string)
}

variable "aws_region" {
  description = "The AWS region in which to launch the infrastructure"
  type        = string
}

variable "cidr" {
  description = "The CIDR of the VPC (e.g. '10.0.0.0/16')"
  type        = string
}

variable "database_subnets" {
  description = "List of CIDRs for the private database subnets of the VPC (e.g. ['10.0.30.0/24', '10.0.31.0/24', '10.0.32.0/24'])"
  type        = list(string)
}

variable "database_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the database subnets of the VPC (e.g. ['30', '31', '32'])"
  type        = list(string)
}

variable "env" {
  description = "The service env (e.g. 'dev')"
  type        = string
}

variable "org_name_underscore" {
  description = "The name of the org, delimited with underscores (e.g. 'org_name')"
  type        = string
}

variable "private_subnets" {
  description = "List of CIDRs for the private subnets of the VPC (e.g. ['10.0.20.0/24', '10.0.21.0/24', '10.0.22.0/24'])"
  type        = list(string)
}

variable "private_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the private subnets of the VPC (e.g. ['20', '21', '22'])"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of CIDRs for the public subnets of the VPC (e.g. ['10.0.10.0/24', '10.0.11.0/24', '10.0.12.0/24'])"
  type        = list(string)
}

variable "public_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the public subnets of the VPC (e.g. ['10', '11', '12'])"
  type        = list(string)
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores (e.g. 'team_name')"
  type        = string
}

# Optional variables (a-z)

variable "custom_tags" {
  description = "Custom tags to set on the vpc"
  type        = map(string)
  default     = {}
}
