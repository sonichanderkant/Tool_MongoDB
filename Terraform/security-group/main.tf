# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Default VPC Security Group
resource "aws_security_group" "default_vpc_sg" {
  vpc_id = data.aws_vpc.default.id
  name   = "default-vpc-sg"
  
  # Allow inbound traffic from the custom VPC
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]   # Corrected variable reference for VPC CIDR
  }

  # Allow all outbound traffic (optional)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"        # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Public Security Group
resource "aws_security_group" "public-SG" {
  vpc_id = var.vpc_id   # Corrected to use 'var.vpc_id'

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]   # Allow all outbound traffic
  }

  # Ingress rule for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0" ]
  }

  # Ingress rule for HTTP (port 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rule for ICMP (ping) from the default VPC security group
  ingress {
    from_port        = -1                # ICMP type (all types)
    to_port          = -1                # ICMP code (all codes)
    protocol         = "icmp"
    cidr_blocks      = ["172.31.0.0/16"]
     
    ipv6_cidr_blocks = []
  }

  tags = {
    Name = "public-sg"
  }
}

# Private Security Group
resource "aws_security_group" "private-SG" {
  vpc_id = var.vpc_id   # Corrected to use 'var.vpc_id'

  # Ingress rule for mongo (port 27017)
  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]  # Custom CIDR block
  }

  # Ingress rule for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  # Ingress rule for ICMP (ping) from the default VPC security group
  ingress {
    from_port        = -1                # ICMP type (all types)
    to_port          = -1                # ICMP code (all codes)
    protocol         = "icmp"
    cidr_blocks  = ["172.31.0.0/16"]  # Reference to the resource
    ipv6_cidr_blocks = []
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"        # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}

/* Genrate Key
resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Genrate pen Key 
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

# pem Key download in sysytem
resource "local_file" "private_key" {
  content = tls_private_key.rsa_4096.private_key_pem
  filename = var.key_name
}*/