output "production-eks-endpoint" {
  value = aws_eks_cluster.production-eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.production-eks.certificate_authority[0].data
}