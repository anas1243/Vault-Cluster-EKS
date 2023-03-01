# public Route Tables
resource "aws_route_table" "eks_public_rt" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = {
    Name = "eks_public_rt"
    Env = var.env
  }
}

resource "aws_route_table_association" "eks_public1_rt_association" {
  subnet_id      = aws_subnet.eks_public_subnet1.id
  route_table_id = aws_route_table.eks_public_rt.id
}


resource "aws_route_table_association" "eks_public2_rt_association" {
  subnet_id      = aws_subnet.eks_public_subnet2.id
  route_table_id = aws_route_table.eks_public_rt.id
}

# Private Route Tables

resource "aws_route_table" "eks_private_rt" {
  vpc_id = aws_vpc.eks_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_public1_ngw.id
  }
  tags = {
    Name = "eks_private_rt"
    Env = var.env
  }
}

resource "aws_route_table_association" "eks_private1_rt_association" {
  subnet_id      = aws_subnet.eks_private_subnet1.id
  route_table_id = aws_route_table.eks_private_rt.id
}


resource "aws_route_table_association" "eks_private2_rt_association" {
  subnet_id      = aws_subnet.eks_private_subnet2.id
  route_table_id = aws_route_table.eks_private_rt.id
}