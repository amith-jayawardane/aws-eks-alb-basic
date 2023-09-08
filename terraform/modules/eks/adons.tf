resource "aws_eks_addon" "eks-vpc-cni" {
  cluster_name = aws_eks_cluster.production-eks.name
  addon_name   = "vpc-cni"
}

# resource "aws_eks_addon" "eks-coredns" {
#   cluster_name = aws_eks_cluster.production-eks.name
#   addon_name   = "coredns"
# }