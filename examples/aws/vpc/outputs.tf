output "id" {
  description = "The VPC ID"
  value       = module.vpc.id
}

output "database_subnet_ids" {
  description = "List of database subnet IDs"
  value       = module.vpc.database_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}
