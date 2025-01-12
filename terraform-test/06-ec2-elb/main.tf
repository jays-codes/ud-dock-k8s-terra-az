
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
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "http_server_sg" {
  name = "http_server_sg"
  //vpc_id = "vpc-c49ff1be"
  vpc_id = aws_default_vpc.default.id

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

#Create Security Group for ELB
resource "aws_security_group" "elb_sg" {
  name        = "elb_sg"
  description = "Security group for ELB"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "elb" {
  name            = "elb"
  security_groups = [aws_security_group.elb_sg.id]
  subnets         = toset(data.aws_subnets.default_subnets.ids)
  instances       = values(aws_instance.http_servers).*.id

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

resource "aws_instance" "http_servers" {
  ami = "ami-05576a079321f21f8"
  #ami                    = data.aws_ami.aws-linux-2-latest.id
  instance_type          = "t2.micro"
  key_name               = "default-ec2-keypair"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]

  for_each  = toset(data.aws_subnets.default_subnets.ids)
  subnet_id = each.value

  tags = {
    name = "http_server_${each.value}"
  }

  depends_on = [
    aws_security_group.http_server_sg,
    aws_default_vpc.default,
    aws_security_group.elb_sg
  ]

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_keypair)
    timeout     = "10m"
    agent       = false

    # Add these retry settings
    #retries     = 5
    #retry_max_delay = "30s"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "echo ${self.public_dns} is active | sudo tee /var/www/html/index.html"
    ]
  }


}


