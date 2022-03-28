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
  description = "List of CIDRs for the private database subnets of the VPC (e.g. ['10.0.21.0/24', '10.0.22.0/24', '10.0.23.0/24'])"
  type        = list(string)
}

variable "database_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the database subnets of the VPC (e.g. ['21', '22', '23'])"
  type        = list(string)
}

variable "env" {
  description = "The service env (e.g. 'dev')"
  type        = string
}

variable "private_subnets" {
  description = "List of CIDRs for the private subnets of the VPC (e.g. ['10.0.11.0/24', '10.0.12.0/24', '10.0.13.0/24'])"
  type        = list(string)
}

variable "private_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the private subnets of the VPC (e.g. ['11', '12', '13'])"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of CIDRs for the public subnets of the VPC (e.g. ['10.0.1.0/24', '10.0.2.0/24', '10.0.3.0/24'])"
  type        = list(string)
}

variable "public_subnet_ipv6_prefixes" {
  description = "List of prefixes (0-256) for the public subnets of the VPC (e.g. ['1', '2', '3'])"
  type        = list(string)
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores (e.g. 'percygrunwald')"
  type        = string
}

# Optional variables (a-z)

variable "custom_tags" {
  description = "Custom tags to set on the vpc"
  type        = map(string)
  default     = {}
}
