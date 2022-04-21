output "aws_region" {
  description = "The AWS region"
  value       = var.aws_region
}

output "ubuntu_ami_id" {
  description = "The AMI ID for the Ubuntu AMI used"
  value       = module.ec2_instance.ubuntu_ami_id
}

output "instances" {
  description = "A map of instance hostname to instance data for all instances launched"
  value       = module.ec2_instance.instances
}
