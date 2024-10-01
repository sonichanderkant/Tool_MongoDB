resource "aws_instance" "Public_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.Public_subnet_id
  associate_public_ip_address = "true"
  security_groups = [var.Public_security_group_id]
  key_name = var.ssh_key_name
  tags = {
    Name = var.Public_instance_name
  }
}

resource "aws_instance" "Private_instance1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.Private_subnet1_id
  associate_public_ip_address = "false"
  security_groups = [var.Private_security_group_id]
  key_name = var.ssh_key_name
  tags = {
    Name = var.Private_instance1_name
  }
}

resource "aws_instance" "Private_instance2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.Private_subnet2_id
  associate_public_ip_address = "false"
  security_groups = [var.Private_security_group_id]
  key_name = var.ssh_key_name
  tags = {
    Name = var.Private_instance2_name
  }
}
