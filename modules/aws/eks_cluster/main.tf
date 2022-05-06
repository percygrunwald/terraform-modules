terraform {
  backend "s3" {}
}

locals {
  name = "${var.org_name_underscore}-${var.team_name_underscore}-${var.env}"
}

resource "aws_kms_key" "eks_secrets" {
  description             = "Encryption key for EKS secrets for cluster: ${var.cluster_name}"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = merge(var.custom_tags, {
    Org         = var.org_name_underscore
    Team        = var.team_name_underscore
    Environment = var.env
  })
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name                    = var.cluster_name
  cluster_version                 = var.kubernetes_version
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  eks_managed_node_group_defaults = var.managed_node_group_defaults
  eks_managed_node_groups         = var.managed_node_groups

  cluster_encryption_config = [{
    provider_key_arn = aws_kms_key.eks_secrets.arn
    resources        = ["secrets"]
  }]

  tags = merge(var.custom_tags, {
    Org         = var.org_name_underscore
    Team        = var.team_name_underscore
    Environment = var.env
  })
}
