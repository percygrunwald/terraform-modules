output "cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "Endpoint for the Kubernetes API server"
  value       = module.eks.cluster_endpoint
}

output "cluster_id" {
  description = "Name/id of the EKS cluster"
  value       = module.eks.cluster_id
}

output "cluster_version" {
  description = "Kubernetes version of the cluster"
  value       = module.eks.cluster_version
}

output "load_balancer_controller_irsa_role_arn" {
  description = "The ARN of the load balancer controller IRSA role"
  value       = module.load_balancer_controller_irsa_role.iam_role_arn
}
