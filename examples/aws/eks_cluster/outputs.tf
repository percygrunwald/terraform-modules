output "cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = module.eks_cluster.cluster_arn
}

output "cluster_endpoint" {
  description = "Endpoint for the Kubernetes API server"
  value       = module.eks_cluster.cluster_endpoint
}

output "cluster_id" {
  description = "Name/id of the EKS cluster"
  value       = module.eks_cluster.cluster_id
}

output "cluster_version" {
  description = "Kubernetes version of the cluster"
  value       = module.eks_cluster.cluster_version
}
