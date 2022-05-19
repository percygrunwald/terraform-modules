# Required variables (a-z)

variable "aws_region" {
  description = "The AWS region in which to launch the infrastructure"
  type        = string
}

variable "cluster_name" {
  description = "The name for the EKS cluster"
  type        = string
}

variable "env" {
  description = "The service env (e.g. 'dev')"
  type        = string
}

variable "org_name_underscore" {
  description = "The name of the org, delimited with underscores (e.g. 'org_name')"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS cluster, see https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html"
  type        = set(string)
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores (e.g. 'team_name')"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the vpc in which to launch the cluster"
  type        = string
}

# Optional variables (a-z)

variable "custom_tags" {
  description = "Custom tags to set on the vpc"
  type        = map(string)
  default     = {}
}

variable "kubernetes_version" {
  description = "The version of kubernetes for the cluster"
  type        = string
  default     = "1.22"
}

variable "managed_node_group_defaults" {
  description = "The (AWS) managed node group defaults"
  type        = any
  default = {
    disk_size                  = 8
    instance_types             = ["t3a.micro"]
    iam_role_attach_cni_policy = true
  }
}

variable "managed_node_groups" {
  description = "The managed node groups to provision"
  type        = any
  default = {
    example_node_group = {
      min_size     = 2
      max_size     = 10
      desired_size = 2
    }
  }
}
