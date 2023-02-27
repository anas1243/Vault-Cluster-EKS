
resource "aws_subnet" "eks_public_subnet1" {
cidr_block = var.public_subnet1_cidr
availability_zone = var.public_subnet1_zone
map_public_ip_on_launch = true
vpc_id = aws_vpc.eks_vpc.id
tags = {
  Name = "eks_public_subnet1"
  Env = var.env
}
}

resource "aws_subnet" "eks_public_subnet2" {
cidr_block = var.public_subnet2_cidr
availability_zone = var.public_subnet2_zone
map_public_ip_on_launch = true
vpc_id = aws_vpc.eks_vpc.id
tags = {
  Name = "eks_public_subnet2"
  Env = var.env
}
}
