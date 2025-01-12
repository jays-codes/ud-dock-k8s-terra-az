
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#Create Default VPC
resource "aws_default_vpc" "default_vpc" {

}

#Create Security Group
resource "aws_security_group" "http_server_sg" {
  name        = "http_server_sg"
  description = "Security group for HTTP Server"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "http_server_sg"
  }
}

resource "aws_instance" "http_servers" {
  ami = "ami-05576a079321f21f8"
  #ami                    = data.aws_ami.aws-linux-2-latest.id
  instance_type          = "t2.micro"
  key_name               = "default-ec2-keypair"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  
  for_each = toset(data.aws_subnets.default_subnets.ids)
  subnet_id = each.value

  tags = {
    name = "http_server_${each.value}"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_keypair)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "echo ${self.public_dns} is active | sudo tee /var/www/html/index.html"
    ]
  }
}


