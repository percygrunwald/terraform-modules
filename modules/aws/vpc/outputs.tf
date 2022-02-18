output "id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "database_subnet_ids" {
  description = "List of database subnet IDs"
  value       = module.vpc.database_subnets
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets
}

output "database_subnet_group_name" {
  description = "ID of database subnet group"
  value       = module.vpc.database_subnet_group
}
