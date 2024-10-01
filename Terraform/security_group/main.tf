data "aws_security_group" "default_sg" {
  vpc_id = var.vpc_id-01
  filter {
    name = "group-name"
    values = ["default"]
  }
}

resource "aws_security_group" "Public_SG" {
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.Public_ingress_port
    content {
    from_port = ingress.value
    to_port   = ingress.value
    protocol  = "tcp"
    cidr_blocks = var.Public_ingress_cidr_block
    }
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.Public_SG_name
  }
}

resource "aws_security_group" "Private_SG" {
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.Private_ingress_port
    content {
    from_port = ingress.value
    to_port   = ingress.value
    protocol  = "tcp"
    cidr_blocks = var.Public_ingress_cidr_block
    }
  }
ingress {
    from_port   = -1                
    to_port     = -1                
    protocol    = "icmp"
    cidr_blocks = []                 
    security_groups = [data.aws_security_group.default_sg.id] 
    ipv6_cidr_blocks = []
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.Private_SG_name
  }
}
