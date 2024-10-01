module "vpc" {
  source = "./vpc"
}

module "subnet" {
  source                     = "./subnets"
  vpc_id                     = module.vpc.vpc_id
  Public_subnet_cidr_block   = var.Public_subnet_cidr_block
  Private_subnet1_cidr_block = var.Private_subnet1_cidr_block
  Private_subnet2_cidr_block = var.Private_subnet2_cidr_block
  Public_Subnet_name         = var.Public_Subnet_name
  Private_Subnet1_name       = var.Private_Subnet1_name
  Private_Subnet2_name       = var.Private_Subnet2_name
  az1                        = var.az1
  az2                        = var.az2
}

module "security_group" {
  source          = "./security_group"
  vpc_id          = module.vpc.vpc_id
  Public_SG_name  = var.Public_SG_name
  Private_SG_name = var.Private_SG_name
  vpc_id-01       = module.vpc_peering.vpc_id-01
}

module "instance" {
  source                    = "./instance"
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  Public_subnet_id          = module.subnet.Public_subnet_id
  Public_security_group_id  = module.security_group.Public_SG_id
  Public_instance_name      = var.Public_instance_name
  Private_subnet1_id        = module.subnet.Private_subnet1_id
  Private_subnet2_id        = module.subnet.Private_subnet2_id
  Private_security_group_id = module.security_group.Private_SG_id
  Private_instance1_name    = var.Private_instance1_name
  Private_instance2_name    = var.Private_instance2_name
  ssh_key_name              = var.ssh_key_name
}

module "internet_gateway" {
  source   = "./internet_gateway"
  vpc_id   = module.vpc.vpc_id
  igw_name = var.igw_name
}

module "nat_gateway" {
  source           = "./nat_gateway"
  Public_subnet_id = module.subnet.Public_subnet_id
  nat_name         = var.nat_name
}

module "public_RT" {
  source                  = "./public_RT"
  vpc_id                  = module.vpc.vpc_id
  internet_gateway_id     = module.internet_gateway.internet_gateway_id
  Public_subnet_id        = module.subnet.Public_subnet_id
  public_route_table_name = var.public_route_table_name
  default_vpc_cidr        = var.default_vpc_cidr
  vpc_peering_id          = module.vpc_peering.vpc_peering_id
}

module "private_RT" {
  source                   = "./private_RT"
  vpc_id                   = module.vpc.vpc_id
  nat_gateway_id           = module.nat_gateway.nat_gateway_id
  Private_subnet1_id       = module.subnet.Private_subnet1_id
  Private_subnet2_id       = module.subnet.Private_subnet2_id
  private_route_table_name = var.private_route_table_name
  default_vpc_cidr         = var.default_vpc_cidr
  vpc_peering_id           = module.vpc_peering.vpc_peering_id
}

module "nacl" {
  source             = "./nacl"
  vpc_id             = module.vpc.vpc_id
  Public_subnet_id   = module.subnet.Public_subnet_id
  Private_subnet1_id = module.subnet.Private_subnet1_id
  Private_subnet2_id = module.subnet.Private_subnet2_id
}

module "vpc_peering" {
  source           = "./vpc_peering"
  vpc_id           = module.vpc.vpc_id
  region_name      = var.region_name
  vpc_peering_name = var.vpc_peering_name
  cidr_block       = var.cidr_block
  default_vpc_cidr = var.default_vpc_cidr
}
