resource "aws_eks_cluster" "production-eks" {
  name     = "production-eks-cluster"
  role_arn = var.eks_iam_role_arn

  vpc_config {
    subnet_ids = [var.eks_subnet_1_id, var.eks_subnet_2_id]
    endpoint_private_access = true
    endpoint_public_access = false
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  # depends_on = [
  #   var.production-eks-amazon_eks_cluster_policy,
  #   var.production-eks-amazon_eks_vpc_resource_controller,
  # ]
}