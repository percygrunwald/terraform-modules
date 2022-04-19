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

module "ec2_key_pair" {
  source = "../../../modules/aws/ec2_key_pair"

  aws_region = var.aws_region

  key_name   = var.key_name
  public_key = var.public_key

  custom_tags          = var.custom_tags
  org_name_underscore  = var.org_name_underscore
  team_name_underscore = var.team_name_underscore
  env                  = var.env
}
