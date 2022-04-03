# Required variables (a-z)

variable "aws_region" {
  description = "The AWS region in which to launch the infrastructure"
  type        = string
}

variable "env" {
  description = "The service env (e.g. 'dev')"
  type        = string
}

variable "instances" {
  description = "Map of instances to launch, in the form of hostname => instance type (e.g. 'usw101' => 't3.micro')"
  type        = map(string)
}

variable "org_name_underscore" {
  description = "The name of the org, delimited with underscores (e.g. 'org_name')"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet IDs in which to create the instances"
  type        = list(string)
}

variable "service_name_underscore" {
  description = "The name of the service, delimited with underscores (e.g. 'test_service')"
  type        = string
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores (e.g. 'team_name')"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

# Optional variables (a-z)

variable "ami_custom_image_id" {
  description = "The ID of custom AMI image"
  type        = string
  default     = ""
}

variable "custom_tags" {
  description = "Custom tags to set on the EC2 instances"
  type        = map(string)
  default     = {}
}

variable "extra_userdata_template" {
  description = "Extra user-data to add to the default built-in"
  type        = string
  default     = ""
}

variable "extra_userdata_type" {
  description = "What format is extra_userdata in - eg 'text/cloud-config' or 'text/x-shellscript'"
  type        = string
  default     = "text/x-shellscript"
}

variable "extra_userdata_merge" {
  description = "Control how cloud-init merges user-data sections"
  type        = string
  default     = "list(append)+dict(recurse_array)+str()"
}

variable "root_disk_size_gb" {
  description = "EBS Root volume size, defaults to 100Gb for Meraki Standard"
  type        = number
  default     = 100
}

variable "extra_security_group_ids" {
  description = "List of security group ids to add to app_instance created"
  type        = list(any)
  default     = []
}

variable "keypair_name" {
  description = "The name of the keypair for the EC2 instance"
  type        = string
  default     = null
}

variable "ubuntu_arch" {
  description = "The architecture of Ubuntu to launch"
  type        = string
  default     = "amd64"
}

variable "ubuntu_version" {
  description = "The version of Ubuntu to launch"
  type        = string
  default     = "focal-20.04"
}
