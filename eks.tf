data "aws_iam_role" "eks_cluster_role" {
  name = "iti_cluster_role"
}
data "aws_iam_role" "eks_worker_nodes_role" {
  name = "woker_node_role"
}


resource "aws_eks_cluster" "vault_cluster" {
  name     = "vault-cluster"
  role_arn = data.aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids              = [module.eks_network.eks_public_subnet1_id, module.eks_network.eks_public_subnet2_id, module.eks_network.eks_private_subnet1_id, module.eks_network.eks_private_subnet2_id]
    security_group_ids      = [aws_security_group.eks_sg.id]
    endpoint_private_access = true
    endpoint_public_access  = false
  }

}


resource "aws_eks_node_group" "eks_worker_nodes" {
  cluster_name    = aws_eks_cluster.vault_cluster.name
  node_group_name = "t2_worker_nodes"
  node_role_arn   = data.aws_iam_role.eks_worker_nodes_role.arn
  subnet_ids      = [module.eks_network.eks_private_subnet1_id, module.eks_network.eks_private_subnet2_id]
  instance_types  = ["t2.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
  remote_access {
    ec2_ssh_key = var.bastion_host_key_name
  }

}

