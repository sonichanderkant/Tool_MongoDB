output "vpc_id" {
  value = module.vpc.vpc_id
}

output "Public_subnet_id" {
  value = module.subnet.Public_subnet_id
}

output "Private_subnet1_id" {
  value = module.subnet.Private_subnet1_id
}

output "Private_subnet2_id" {
  value = module.subnet.Private_subnet2_id
}

output "Public_route_table_id" {
  value = module.public_RT.public_route_table_id
}

output "Private_route_table_id" {
  value = module.private_RT.private_route_table_id
}

output "internet_gateway_id" {
  value = module.internet_gateway.internet_gateway_id
}

output "nat_gateway_id" {
  value = module.nat_gateway.nat_gateway_id
}

output "Public_instance_id" {
  value = module.instance.Public_instance_id
}

output "Private_instance1_id" {
  value = module.instance.Private_instance1_id
}

output "Private_instance2_id" {
  value = module.instance.Private_instance2_id
}

output "Public_security_group_id" {
  value = module.security_group.Public_SG_id
}

output "Private_security_group_id" {
  value = module.security_group.Private_SG_id
}

output "Public_NACL_id" {
  value = module.nacl.Public_NACL_id
}

output "Private_NACL_id" {
  value = module.nacl.Private_NACL_id
}

