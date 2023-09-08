# EKS subnets
resource "aws_subnet" "eks_subnet_1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.eks_cidr.vpc_id
  cidr_block = "172.10.11.0/25"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "eks_subnet_1"
    Environment = "production"
  }
}

resource "aws_subnet" "eks_subnet_2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.eks_cidr.vpc_id
  cidr_block = "172.10.11.128/25"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "eks_subnet_2"
    Environment = "production"
  }
}

# EKS EC2 node group subnets
resource "aws_subnet" "eks_node_group_subnet_1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.eks_node_group_cidr.vpc_id
  cidr_block = "172.10.12.0/25"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "eks_node_group_subnet_1"
    Environment = "production"
  }
}

resource "aws_subnet" "eks_node_group_subnet_2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.eks_node_group_cidr.vpc_id
  cidr_block = "172.10.12.128/25"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "eks_node_group_subnet_2"
    Environment = "production"
  }
}

# Public subnets
resource "aws_subnet" "production_public_subnet" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.production_public_CIDR.vpc_id
  cidr_block = "172.10.20.0/25"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "production_public_subnet"
    Environment = "production"
  }
}

resource "aws_subnet" "production_public_bastian_subnet" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.production_public_CIDR.vpc_id
  cidr_block = "172.10.20.128/25"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "production_public_bastian_subnet"
    Environment = "production"
  }
}