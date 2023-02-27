
resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks_igw"
    Env = var.env
  }
}


resource "aws_eip" "eks_nat1_eip" {
  tags = {
  Name = "eks_nat1_eip"
  Env = var.env
}
}

resource "aws_nat_gateway" "eks_public1_ngw" {
  allocation_id = aws_eip.eks_nat1_eip.id
  subnet_id     = aws_subnet.eks_public_subnet1.id

  tags = {
    Name = "gw NAT"
    Env = var.env
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks_igw]
}