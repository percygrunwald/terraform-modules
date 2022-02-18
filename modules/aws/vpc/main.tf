terraform {
  required_version = ">= 1.1.3, < 1.1.4"

  backend "s3" {}
}

locals {
  name = "${var.team_name_underscore}-${var.env}"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"

  name             = local.name
  cidr             = var.cidr
  azs              = var.availability_zones
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets
  enable_ipv6      = true

  tags = merge(var.custom_tags, {
    Environment = var.env
    Team        = var.team_name_underscore
  })

  vpc_tags = {
    Name = local.name
  }
}
