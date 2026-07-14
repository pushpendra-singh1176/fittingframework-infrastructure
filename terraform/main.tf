

module "vpc" {

  source = "git::https://github.com/pushpendra-singh1176/terraform-modules.git//vpc?ref=v1.0.0"

  vpc_cidr = var.vpc_cidr

  public_subnet_cidr = var.public_subnet_cidr

  private_subnet_cidr = var.private_subnet_cidr

  public_availability_zone = var.public_availability_zone

  private_availability_zone = var.private_availability_zone

  enable_dns_support = true

  enable_dns_hostnames = true

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-vpc"
    }
  )

}
module "eks_cluster_role" {

  source = "git::https://github.com/pushpendra-singh1176/terraform-modules.git//iam?ref=v1.0.0"

  role_name = "${local.name_prefix}-eks-cluster-role"

  trusted_services = [
    "eks.amazonaws.com"
  ]

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  ]

  create_instance_profile = false

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-eks-cluster-role"
    }
  )

}
module "eks_node_role" {

  source = "git::https://github.com/pushpendra-singh1176/terraform-modules.git//iam?ref=v1.0.0"

  role_name = "${local.name_prefix}-eks-node-role"

  trusted_services = [
    "ec2.amazonaws.com"
  ]

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  ]

  create_instance_profile = true

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-eks-node-role"
    }
  )

}
module "eks_security_group" {

  source = "git::https://github.com/pushpendra-singh1176/terraform-modules.git//security-group?ref=v1.0.0"

  name        = "${local.name_prefix}-eks-sg"
  description = "Security Group for EKS Cluster"

  vpc_id = module.vpc.vpc_id

  ingress_rules = [
    {
      description = "HTTPS Access"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      description = "Allow All Outbound Traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-eks-sg"
    }
  )

}
module "s3" {

  source = "git::https://github.com/pushpendra-singh1176/terraform-modules.git//s3?ref=v1.0.0"

  bucket_name = "${local.name_prefix}-artifacts"

  force_destroy = false

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-artifacts"
    }
  )

}
module "eks" {

  source = "git::https://github.com/pushpendra-singh1176/terraform-modules.git//eks?ref=v1.0.0"

  cluster_name    = "${local.name_prefix}-eks"
  cluster_version = var.cluster_version

  subnet_ids = [
    module.vpc.public_subnet_id,
    module.vpc.private_subnet_id
  ]

  cluster_role_arn = module.eks_cluster_role.role_arn
  node_role_arn    = module.eks_node_role.role_arn

  security_group_ids = [
    module.eks_security_group.security_group_id
  ]

  endpoint_public_access  = true
  endpoint_private_access = false

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]
  node_group = {
    name           = "default"
    instance_types = ["t3.medium"]

    desired_size = 2
    min_size     = 1
    max_size     = 3

    disk_size     = 20
    ami_type      = "AL2_x86_64"
    capacity_type = "ON_DEMAND"

    labels = {
      role = "worker"
    }

    tags = {}
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${local.name_prefix}-eks"
    }
  )

}
