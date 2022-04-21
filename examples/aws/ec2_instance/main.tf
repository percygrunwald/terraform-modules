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

module "ec2_instance" {
  source = "../../../modules/aws/ec2_instance"

  aws_region = var.aws_region

  instances  = var.instances
  subnet_ids = data.aws_subnet_ids.default.ids
  vpc_id     = data.aws_vpc.default.id

  custom_tags             = var.custom_tags
  org_name_underscore     = var.org_name_underscore
  team_name_underscore    = var.team_name_underscore
  env                     = var.env
  service_name_underscore = var.service_name_underscore
}
