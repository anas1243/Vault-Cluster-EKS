output "eip_test" {
  value = aws_eip.eks_nat1_eip.public_ip
}