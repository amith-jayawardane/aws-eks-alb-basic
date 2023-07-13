resource "aws_vpc" "production_vpc" {
  cidr_block = "172.10.10.0/24" 
  enable_dns_hostnames = "true"
  
  tags = {
    Name = "production_vpc"
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "eks_cidr" {
  vpc_id = aws_vpc.production_vpc.id
  cidr_block = "172.10.11.0/24"
}

resource "aws_vpc_ipv4_cidr_block_association" "eks_node_group_cidr" {
  vpc_id = aws_vpc.production_vpc.id
  cidr_block = "172.10.12.0/24"
}


