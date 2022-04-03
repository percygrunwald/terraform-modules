terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../../modules/aws/vpc"

  aws_region = var.aws_region

  availability_zones = var.availability_zones
  cidr               = var.cidr

  public_subnets              = var.public_subnets
  public_subnet_ipv6_prefixes = var.public_subnet_ipv6_prefixes

  private_subnets              = var.private_subnets
  private_subnet_ipv6_prefixes = var.private_subnet_ipv6_prefixes

  database_subnets              = var.database_subnets
  database_subnet_ipv6_prefixes = var.database_subnet_ipv6_prefixes

  custom_tags          = var.custom_tags
  org_name_underscore  = var.org_name_underscore
  team_name_underscore = var.team_name_underscore
  env                  = var.env
}
