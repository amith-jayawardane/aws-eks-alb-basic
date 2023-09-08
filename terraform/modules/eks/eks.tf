resource "aws_eks_cluster" "production-eks" {
  name     = "production-eks-cluster"
  role_arn = var.eks_iam_role_arn
  enabled_cluster_log_types = ["api", "audit"]

  vpc_config {
    subnet_ids = [var.eks_subnet_1_id, var.eks_subnet_2_id]
    endpoint_private_access = true
    endpoint_public_access  = false
  }
}

# resource "aws_cloudwatch_log_group" "production-eks" {
#   name              = "/aws/eks/production-eks-cluster/cluster"
#   retention_in_days = 7
# }