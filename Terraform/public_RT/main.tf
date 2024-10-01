resource "aws_route_table" "Public_RT" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id = var.Public_subnet_id
  route_table_id = aws_route_table.Public_RT.id
}

resource "aws_route" "RT-1" {
  route_table_id = aws_route_table.Public_RT.id
  destination_cidr_block = var.default_vpc_cidr
  vpc_peering_connection_id = var.vpc_peering_id
}
