resource "aws_instance" "eks_bastion_host1" {
  ami                    = var.bastion_host_ami_us-east-1
  subnet_id              = module.eks_network.eks_public_subnet1_id
  instance_type          = var.bastion_host_machine_type
  key_name               = var.bastion_host_key_name
  vpc_security_group_ids = [aws_security_group.eks_bastion_host_sg.id]
  user_data              = <<EOF
#!/bin/bash
apt update
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
apt install -y bash-completion
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
apt install -y unzip
unzip awscliv2.zip
./aws/install
EOF
}