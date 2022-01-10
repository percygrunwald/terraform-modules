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

module "app_instance" {
  source = "../../../modules/aws/app_instance"

  aws_region = var.aws_region

  instances  = var.instances
  subnet_ids = data.aws_subnet_ids.default.ids
  vpc_id     = data.aws_vpc.default.id

  custom_tags             = var.custom_tags
  env                     = var.env
  service_name_underscore = var.service_name_underscore
  team_name_underscore    = var.team_name_underscore
}
