output "vpc_id" {
  description = "ID of the newly created vpc"
  value       = aws_vpc.this.id
}

output "security_group_id" {
  value       = aws_security_group.this.id
}

output "aws_subnet_private_id" {
  value       = aws_subnet.private.id
}
