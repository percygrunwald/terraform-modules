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

module "eks_cluster" {
  source = "../../../modules/aws/eks_cluster"

  aws_region = var.aws_region

  cluster_name = var.cluster_name

  vpc_id     = module.vpc.id
  subnet_ids = module.vpc.private_subnet_ids

  custom_tags          = var.custom_tags
  org_name_underscore  = var.org_name_underscore
  team_name_underscore = var.team_name_underscore
  env                  = var.env
}
