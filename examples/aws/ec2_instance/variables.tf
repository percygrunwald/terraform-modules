variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

variable "custom_tags" {
  description = "Custom tags to set on the EC2 instances"
  type        = map(string)
  default = {
    Example = "yes"
  }
}

variable "env" {
  description = "The service env"
  type        = string
  default     = "test"
}

variable "instances" {
  description = "The hostnames and type of the instances to create"
  type        = map(string)
  default = {
    example201 = "t3a.nano",
    example202 = "t3a.nano"
  }
}

variable "key_pair_key_name" {
  description = "The key name of the key pair for the EC2 instance"
  type        = string
  default     = null
}

variable "org_name_underscore" {
  description = "The name of the org, delimited with underscores (e.g. 'org_name')"
  type        = string
  default     = "org_name"
}

variable "service_name_underscore" {
  description = "The name of the service, delimited with underscores (e.g. 'test_service')"
  type        = string
  default     = "test_service"
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores (e.g. 'team_name')"
  type        = string
  default     = "team_name"
}
