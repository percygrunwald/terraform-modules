# Required variables (a-z)

variable "aws_region" {
  description = "The AWS region in which to launch the infrastructure"
  type        = string
}

variable "env" {
  description = "The service env (e.g. 'dev')"
  type        = string
}

variable "key_name" {
  description = "The key name of the key pair"
  type        = string
}

variable "org_name_underscore" {
  description = "The name of the org, delimited with underscores (e.g. 'org_name')"
  type        = string
}

variable "public_key" {
  description = "The public key of the key pair"
  type        = string
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores (e.g. 'team_name')"
  type        = string
}

# Optional variables (a-z)

variable "custom_tags" {
  description = "Custom tags to set on the EC2 instances"
  type        = map(string)
  default     = {}
}
