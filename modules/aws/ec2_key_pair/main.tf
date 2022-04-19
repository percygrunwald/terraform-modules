terraform {
  backend "s3" {}
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = var.public_key

  tags = merge(var.custom_tags, {
    Org         = var.org_name_underscore
    Team        = var.team_name_underscore
    Environment = var.env
  })
}
