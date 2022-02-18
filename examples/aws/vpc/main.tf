terraform {
  required_version = ">= 1.1.3, < 1.1.4"

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
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  database_subnets   = var.database_subnets

  custom_tags          = var.custom_tags
  env                  = var.env
  team_name_underscore = var.team_name_underscore
}
