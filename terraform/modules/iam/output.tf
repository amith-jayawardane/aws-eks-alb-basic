output "eks_iam_role_arn" {
  value = aws_iam_role.eks_role.arn
}

output "eks_iam_node_group_role_arn" {
  value = aws_iam_role.eks-node-group-role.arn
}