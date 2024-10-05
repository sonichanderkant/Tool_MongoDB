#instenses ID
output "pub-instance-id" {
  value = aws_instance.mongo-public.id
}

output "private-instance1-id" {
  value = aws_instance.mongo-private-1.id
}

output "private-instance2-id" {
  value = aws_instance.mongo-private-2
}

# instences IP addresses
output "public-instance-ip" {
  value = aws_instance.mongo-public.public_ip
}

output "private-instance1-ip" {
  value = aws_instance.mongo-private-1.private_ip
}

output "private-instance2-ip" {
  value = aws_instance.mongo-private-2.private_ip
}