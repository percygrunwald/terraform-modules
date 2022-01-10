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
  description = "The service env (e.g. 'dev')"
  type        = string
  default     = "test"
}

variable "instances" {
  description = "The hostnames and type of the instances to create (e.g. 'usw101' => 't3.micro')"
  type        = map(string)
  default = {
    example201 = "t3.micro",
    example202 = "m5.large"
  }
}

variable "service_name_underscore" {
  description = "The name of the service, delimited with underscores (e.g. 'test_service')"
  type        = string
  default     = "test_service"
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores (e.g. 'sre_observability')"
  type        = string
  default     = "sre_observability"
}
