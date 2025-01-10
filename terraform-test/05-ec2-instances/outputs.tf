output "aws_security_group_details" {
  value = aws_security_group.http_server_sg
}

output "aws_instance_details" {
  value = aws_instance.http_server_ec2
}

output "aws_instance_public_dns" {
  value = aws_instance.http_server_ec2.public_dns
}

