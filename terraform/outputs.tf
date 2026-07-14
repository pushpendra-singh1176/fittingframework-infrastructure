output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_arn" {
  description = "EKS Cluster ARN"
  value       = module.eks.cluster_arn
}

output "node_group_name" {
  description = "EKS Node Group Name"
  value       = module.eks.node_group_name
}

output "bucket_name" {
  description = "S3 Bucket Name"
  value       = module.s3.bucket_name
}