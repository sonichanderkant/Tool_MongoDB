resource "aws_network_acl" "Public_NACL" {
  vpc_id = var.vpc_id

  ingress {
   protocol   = "tcp"
   rule_no    = 100
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 1024
   to_port    = 65535
}
  ingress {
   protocol   = "tcp"
   rule_no    = 110
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 22
   to_port    = 22
}
  ingress {
   protocol   = "tcp"
   rule_no    = 120
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 80
   to_port    = 80
}
  ingress {
   protocol   = "tcp"
   rule_no    = 130
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 443
   to_port    = 443
}
  egress {
   protocol   = "tcp"
   rule_no    = 100
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 1024
   to_port    = 65535
}
  egress {
   protocol   = "tcp"
   rule_no    = 110
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 80
   to_port    = 80
}
  egress {
   protocol   = "tcp"
   rule_no    = 120
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 443
   to_port    = 443
}
  egress {
   protocol   = "tcp"
   rule_no    = 130
   action     = "allow"
   cidr_block = "10.0.0.32/27"
   from_port  = 22
   to_port    = 22
}
  egress {
   protocol   = "tcp"
   rule_no    = 140
   action     = "allow"
   cidr_block = "10.0.0.64/27"
   from_port  = 22
   to_port    = 22
}
tags = {
    Name = "Public_NACL"
  }
}

resource "aws_network_acl_association" "public_association" {
  network_acl_id = aws_network_acl.Public_NACL.id
  subnet_id = var.Public_subnet_id
}

resource "aws_network_acl" "Private_NACL" {
  vpc_id = var.vpc_id

  ingress {
   protocol   = "tcp"
   rule_no    = 100
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 1024
   to_port    = 65535
}
  ingress {
   protocol   = "tcp"
   rule_no    = 110
   action     = "allow"
   cidr_block = "10.0.0.0/27"
   from_port  = 22
   to_port    = 22
}
  ingress {
   protocol   = "tcp"
   rule_no    = 120
   action     = "allow"
   cidr_block = "10.0.0.32/27"
   from_port  = 27017
   to_port    = 27017
}
ingress {
   protocol   = "tcp"
   rule_no    = 130
   action     = "allow"
   cidr_block = "10.0.0.64/27"
   from_port  = 27017
   to_port    = 27017
}
ingress {
   protocol   = "tcp"
   rule_no    = 140
   action     = "allow"
   cidr_block = "172.31.0.0/16"
   from_port  = 22
   to_port    = 22
}
  egress {
   protocol   = "tcp"
   rule_no    = 100
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 1024
   to_port    = 65535
}
  egress {
   protocol   = "tcp"
   rule_no    = 110
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 80
   to_port    = 80
}
  egress {
   protocol   = "tcp"
   rule_no    = 120
   action     = "allow"
   cidr_block = "0.0.0.0/0"
   from_port  = 443
   to_port    = 443
}
egress {
   protocol   = "tcp"
   rule_no    = 130
   action     = "allow"
   cidr_block = "10.0.0.32/27"
   from_port  = 27017
   to_port    = 27017
}
egress {
   protocol   = "tcp"
   rule_no    = 140
   action     = "allow"
   cidr_block = "10.0.0.64/27"
   from_port  = 27017
   to_port    = 27017
}
tags = {
    Name = "Private_NACL"
  }
}

resource "aws_network_acl_association" "private_association1" {
  network_acl_id = aws_network_acl.Private_NACL.id
  subnet_id = var.Private_subnet1_id
}

resource "aws_network_acl_association" "private_association2" {
  network_acl_id = aws_network_acl.Private_NACL.id
  subnet_id = var.Private_subnet2_id
}
