module "production_vpc" {
  source = "./modules/vpc"
  
}

module "iam" {
  source = "./modules/iam"
}

module "jump_server" {
  source = "./modules/ec2"
  depends_on = [ module.production_vpc ]
  bastian_subnet_id = module.production_vpc.bastian_subnet_id
  allow_ssh_security_group_id = module.production_vpc.allow_ssh_security_group_id
}

module "production_eks" {
  source = "./modules/eks"
  depends_on = [ module.iam ]
  eks_iam_role_arn = module.iam.eks_iam_role_arn
  eks_iam_node_group_role_arn = module.iam.eks_iam_node_group_role_arn
  eks_subnet_1_id = module.production_vpc.eks_subnet_1_id
  eks_subnet_2_id = module.production_vpc.eks_subnet_2_id
  eks_node_group_subnet_1_id = module.production_vpc.eks_node_group_subnet_1_id
  eks_node_group_subnet_2_id = module.production_vpc.eks_node_group_subnet_2_id
  eks_cluster_security_group_id = module.production_vpc.eks_cluster_security_group_id
}