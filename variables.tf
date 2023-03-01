variable "region" {
  type = string
}
variable "public_subnet1_zone" {
  type = string
}
variable "public_subnet2_zone" {
  type = string
}
variable "private_subnet1_zone" {
  type = string
}
variable "private_subnet2_zone" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet1_cidr" {
  type = string
}

variable "public_subnet2_cidr" {
  type = string
}

variable "private_subnet2_cidr" {
  type = string
}

variable "private_subnet1_cidr" {
  type = string
}

variable "env" {
  type = string
}

variable "bastion_host_ami_us-east-1" {
  type = string
}

variable "bastion_host_machine_type" {
  type = string
}

variable "bastion_host_key_name" {
  type = string
}