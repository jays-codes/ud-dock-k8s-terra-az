output "aws_security_group_details" {
  value = aws_security_group.http_server_sg
}

output "aws_instance_details" {
  value = aws_instance.http_servers
}

output "aws_instance_public_dns" {
  value = values(aws_instance.http_servers)[*].public_dns
}


