terraform {
  backend "s3" {}
}

resource "aws_key_pair" "this" {
  key_name   = "${var.org_name_underscore}-${var.team_name_underscore}-${var.env}-${var.user}"
  public_key = var.public_key

  tags = merge(var.custom_tags, {
    Org         = var.org_name_underscore
    Team        = var.team_name_underscore
    Environment = var.env
  })
}
