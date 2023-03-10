# bastion sg
resource "aws_security_group" "eks_bastion_host_sg" {
  vpc_id = module.eks_network.eks_vpc_id
  tags = {
    Name = "eks_bastion_host_sg"
    Env  = var.env
  }
}

resource "aws_vpc_security_group_ingress_rule" "eks_bastion_host_sg_ingress" {
  security_group_id = aws_security_group.eks_bastion_host_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "eks_bastion_host_sg_egress" {
  security_group_id = aws_security_group.eks_bastion_host_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
}

# EKS security group

resource "aws_security_group" "eks_sg" {
  vpc_id = module.eks_network.eks_vpc_id
  tags = {
    Name = "eks_sg"
    Env  = var.env
  }
}

resource "aws_vpc_security_group_ingress_rule" "eks__sg_ingress_http" {
  security_group_id = aws_security_group.eks_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "eks__sg_ingress_https" {
  security_group_id = aws_security_group.eks_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

resource "aws_vpc_security_group_egress_rule" "eks_sg_egress" {
  security_group_id = aws_security_group.eks_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
}
