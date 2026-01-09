output "public_subnet_id" {
  value = length(aws_subnet.public) > 0 ? aws_subnet.public[0].id : null
}
