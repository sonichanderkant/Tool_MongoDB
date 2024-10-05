output "vpc_id" {
  value = aws_vpc.mongo-VPC.id
}

output "vpc_cidr" {
  value = var.vpc_cidr
}
