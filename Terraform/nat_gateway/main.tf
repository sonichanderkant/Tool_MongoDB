resource "aws_eip" "NAT" {
  domain = "vpc"
}

resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.NAT.id
  subnet_id = var.Public_subnet_id
  tags = {
    Name = var.nat_name
  }
}
