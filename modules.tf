module "eks_network" {
  source               = "./network"
  region               = var.region
  public_subnet1_zone  = var.public_subnet1_zone
  public_subnet2_zone  = var.public_subnet2_zone
  private_subnet1_zone = var.private_subnet1_zone
  private_subnet2_zone = var.private_subnet2_zone
  vpc_cidr             = var.vpc_cidr
  public_subnet1_cidr  = var.public_subnet1_cidr
  public_subnet2_cidr  = var.public_subnet2_cidr
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr
  env                  = var.env
}