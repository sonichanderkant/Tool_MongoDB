variable "cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "vpc_name" {
  type    = string
  default = "Tool_vpc"
}

variable "az1" {
  type    = string
  default = "ap-south-1a"
}

variable "az2" {
  type    = string
  default = "ap-south-1b"
}

variable "Public_subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/27"
}

variable "Public_Subnet_name" {
  type    = string
  default = "Public_Subnet"
}

variable "Private_Subnet1_name" {
  type    = string
  default = "Private_Subnet1"
}

variable "Private_Subnet2_name" {
  type    = string
  default = "Private_Subnet2"
}

variable "Private_subnet1_cidr_block" {
  type    = string
  default = "10.0.0.32/27"
}

variable "Private_subnet2_cidr_block" {
  type    = string
  default = "10.0.0.64/27"
}

variable "Public_SG_name" {
  type    = string
  default = "Public_SG"
}

variable "Private_SG_name" {
  type    = string
  default = "Private_SG"
}

variable "ami_id" {
  type    = string
  default = "ami-0522ab6e1ddcc7055"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "Public_instance_name" {
  type    = string
  default = "Public_EC2"
}

variable "Private_instance1_name" {
  type    = string
  default = "Mongodb"
}

variable "Private_instance2_name" {
  type    = string
  default = "Mongodb_replica"
}

variable "igw_name" {
  type    = string
  default = "IGW"
}

variable "nat_name" {
  type    = string
  default = "NAT"
}

variable "public_route_table_name" {
  type    = string
  default = "Public_RT"
}

variable "private_route_table_name" {
  type    = string
  default = "Private_RT"
}

variable "Public_ingress_port" {
  type    = list(number)
  default = ["22", "443", "80"]
}

variable "Public_ingress_cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "Private_ingress_port" {
  type    = list(number)
  default = ["22", "27017"]
}

variable "Private_ingress_cidr_block" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "ssh_key_name" {
  type    = string
  default = "chandu"
}

variable "region_name" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_peering_name" {
  type    = string
  default = "VPC_Peering"
}

variable "default_vpc_cidr" {
  type    = string
  default = "172.31.0.0/16"
}
