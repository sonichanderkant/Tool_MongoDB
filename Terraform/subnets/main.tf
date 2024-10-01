resource "aws_subnet" "Public_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.Public_subnet_cidr_block
  availability_zone = var.az1
  tags = {
    Name = var.Public_Subnet_name
  }
}

resource "aws_subnet" "Private_subnet1" {
  vpc_id     = var.vpc_id
  cidr_block = var.Private_subnet1_cidr_block
  availability_zone = var.az1
  tags = {
    Name = var.Private_Subnet1_name
  }
}

resource "aws_subnet" "Private_subnet2" {
  vpc_id     = var.vpc_id
  cidr_block = var.Private_subnet2_cidr_block
  availability_zone = var.az2
  tags = {
    Name = var.Private_Subnet2_name
  }
}
