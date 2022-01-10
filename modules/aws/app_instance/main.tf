terraform {
  required_version = ">= 1.1.3, < 1.1.4"

  backend "s3" {}
}

locals {
  ubuntu_version = "bionic-18.04"
  name           = "${var.team_name_underscore}-${var.service_name_underscore}-${var.env}"

  ssh_port     = 22
  tcp_protocol = "tcp"
  udp_protocol = "udp"
  any_port     = 0
  any_protocol = "-1"
  all_ips      = ["0.0.0.0/0"]
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-${local.ubuntu_version}-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

data "template_cloudinit_config" "config" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "cloud-init.cfg"
    content_type = "text/cloud-config"
    content      = templatefile("${path.module}/templates/cloud-init.tpl", {})
  }

  part {
    filename     = "extra.sh"
    content_type = var.extra_userdata_type
    content      = var.extra_userdata_template != "" ? templatefile("${path.module}/templates/${var.extra_userdata_template}.tpl", {}) : ""
    merge_type   = var.extra_userdata_merge
  }
}

resource "aws_instance" "this" {
  for_each               = var.instances
  ami                    = (var.ami_custom_image_id != "" ? var.ami_custom_image_id : data.aws_ami.ubuntu.id)
  instance_type          = each.value
  vpc_security_group_ids = concat([aws_security_group.this.id], var.extra_security_group_ids)
  key_name               = var.keypair_name
  iam_instance_profile   = aws_iam_instance_profile.this.name
  user_data_base64       = data.template_cloudinit_config.config.rendered

  # Terraform will try to recreate the instance on subsequent `apply`s if this
  # is not explicitly set to `true` (because we associate an EIP).
  associate_public_ip_address = true

  # `element` "wraps around" if the index of the current hostname is greater
  # than maximum index of the subnet IDs. This will distribute the instances
  # evenly over the list of subnets provided.
  subnet_id = element(var.subnet_ids, index(keys(var.instances), each.key))

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.root_disk_size_gb
    delete_on_termination = true
    encrypted             = true
  }

  lifecycle {
    ignore_changes = [ami]
  }

  tags = merge(var.custom_tags, {
    Environment = var.env
    Name        = each.key
    Service     = var.service_name_underscore
    Team        = var.team_name_underscore
  })

  volume_tags = merge(var.custom_tags, {
    Environment = var.env
    Name        = each.key
    Service     = var.service_name_underscore
    Team        = var.team_name_underscore
  })
}

resource "aws_eip" "this" {
  for_each = var.instances
  instance = aws_instance.this[each.key].id
  vpc      = true
}

resource "aws_security_group" "this" {
  name_prefix = "${local.name}-app_instance"
  vpc_id      = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(var.custom_tags, {
    Environment = var.env
    Service     = var.service_name_underscore
    Team        = var.team_name_underscore
  })
}

resource "aws_security_group_rule" "allow_ssh_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.this.id

  from_port   = local.ssh_port
  to_port     = local.ssh_port
  protocol    = local.tcp_protocol
  cidr_blocks = local.all_ips
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.this.id

  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.any_protocol
  cidr_blocks = local.all_ips
}

resource "aws_iam_instance_profile" "this" {
  name_prefix = "${var.service_name_underscore}_${var.env}_profile"
  role        = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name_prefix = "${var.service_name_underscore}_${var.env}_role"
  path        = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
