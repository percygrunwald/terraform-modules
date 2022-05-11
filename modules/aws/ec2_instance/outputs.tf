output "ubuntu_ami_id" {
  description = "The AMI ID for the Ubuntu AMI used"
  value       = data.aws_ami.ubuntu.id
}

output "instances" {
  description = "A map of instance hostname to instance data for all instances launched"
  value = {
    for hostname, instance in aws_instance.this : hostname => {
      id         = instance.id
      public_ip  = var.assign_public_ip ? aws_eip.this[hostname].public_ip : null
      private_ip = aws_instance.this[hostname].private_ip
    }
  }
}

output "security_group_id" {
  value       = aws_security_group.this.id
  description = "The EC2 Instance Security Group ID"
}

output "aws_iam_role_name" {
  value       = aws_iam_role.role.name
  description = "Instance Role Name"
}
