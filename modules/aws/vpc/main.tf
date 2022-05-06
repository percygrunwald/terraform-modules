terraform {
  backend "s3" {}
}

locals {
  name = "${var.org_name_underscore}-${var.team_name_underscore}-${var.env}"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name                            = local.name
  cidr                            = var.cidr
  azs                             = var.availability_zones
  enable_ipv6                     = true
  assign_ipv6_address_on_creation = true

  public_subnets                                = var.public_subnets
  public_subnet_ipv6_prefixes                   = var.public_subnet_ipv6_prefixes
  public_subnet_assign_ipv6_address_on_creation = true
  public_subnet_tags = merge(
    { "kubernetes.io/role/elb" = 1 },
    { for eks_cluster_name in var.eks_cluster_names : "kubernetes.io/cluster/${eks_cluster_name}" => "shared" }
  )

  private_subnets                                = var.private_subnets
  private_subnet_ipv6_prefixes                   = var.private_subnet_ipv6_prefixes
  private_subnet_assign_ipv6_address_on_creation = true
  private_subnet_tags = merge(
    { "kubernetes.io/role/internal-elb" = 1 },
    { for eks_cluster_name in var.eks_cluster_names : "kubernetes.io/cluster/${eks_cluster_name}" => "shared" }
  )

  database_subnets                                = var.database_subnets
  database_subnet_ipv6_prefixes                   = var.database_subnet_ipv6_prefixes
  database_subnet_assign_ipv6_address_on_creation = true

  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(var.custom_tags, {
    Org         = var.org_name_underscore
    Team        = var.team_name_underscore
    Environment = var.env
  })

  vpc_tags = {
    Name = local.name
  }
}
