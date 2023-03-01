output "eks_vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "eks_public_subnet1_id" {
  value = aws_subnet.eks_public_subnet1.id
}

output "eks_public_subnet2_id" {
  value = aws_subnet.eks_public_subnet2.id
}

output "eks_private_subnet1_id" {
  value = aws_subnet.eks_private_subnet1.id
}

output "eks_private_subnet2_id" {
  value = aws_subnet.eks_private_subnet2.id
}