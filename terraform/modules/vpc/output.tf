output "eks_subnet_1_id" {
  value = aws_subnet.eks_subnet_1.id
}

output "eks_subnet_2_id" {
  value = aws_subnet.eks_subnet_2.id
}

output "eks_node_group_subnet_1_id" {
  value = aws_subnet.eks_node_group_subnet_1.id
}

output "eks_node_group_subnet_2_id" {
  value = aws_subnet.eks_node_group_subnet_2.id
}

output "bastian_subnet_id" {
  value = aws_subnet.production_public_bastian_subnet.id
}

output "allow_ssh_security_group_id" {
  value = aws_security_group.allow_ssh.id
}

output "eks_cluster_security_group_id" {
  value = aws_security_group.eks_cluster_sg.id
}