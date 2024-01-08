output "eks_subnet_1_id" {
  value = module.production_vpc.eks_subnet_1_id
  description = "eks_subnet_1_id"
}

output "eks_subnet_2_id" {
  value = module.production_vpc.eks_subnet_2_id
  description = "eks_subnet_2_id"
}
output "eks_node_group_subnet_1_id" {
  value = module.production_vpc.eks_node_group_subnet_1_id
  description = "eks_node_group_subnet_1_id"
}
output "eks_node_group_subnet_2_id" {
  value = module.production_vpc.eks_node_group_subnet_2_id
  description = "eks_node_group_subnet_2_id"
}

# output "production-eks-endpoint" {
#   value = module.production_eks.production-eks-endpoint
#   description = "production-eks-endpoint"
# }

# output "kubeconfig-certificate-authority-data" {
#   value = module.production_eks.kubeconfig-certificate-authority-data
#   description = "kubeconfig-certificate-authority-data"
# }