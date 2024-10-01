resource "aws_route_table" "Private_RT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = var.private_route_table_name
  }
}

resource "aws_route_table_association" "private_association1" {
  subnet_id = var.Private_subnet1_id
  route_table_id = aws_route_table.Private_RT.id
}

resource "aws_route_table_association" "private_association2" {
  subnet_id = var.Private_subnet2_id
  route_table_id = aws_route_table.Private_RT.id
}

resource "aws_route" "RT-2" {
  route_table_id = aws_route_table.Private_RT.id
  destination_cidr_block = var.default_vpc_cidr
  vpc_peering_connection_id = var.vpc_peering_id
}
