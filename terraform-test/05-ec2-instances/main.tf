variable "aws_keypair" {
  default = "C:\\jay\\training\\temp\\terraform\\aws\\aws_keys\\default-ec2-keypair.pem"
}

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

#Create Security Group
resource "aws_security_group" "http_server_sg" {
  name        = "http_server_sg"
  description = "Security group for HTTP Server"
  vpc_id      = "vpc-029dad9bd9ce1011b"

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

# #create HTTP Server on port 80 tcp, 22 tcp, cidr block 0.0.0.0/0
# resource "aws_security_group_rule" "http_server_sg_rule" {
#   type = "ingress"
#   from_port = 80
#   to_port = 80
#   protocol = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.http_server_sg.id
# }



#create ec2 instances from map
# variable "ec2_instances" {
#   type = map(object({
#     ami = string
#     instance_type = string
#   }))
# }

resource "aws_instance" "http_server_ec2" {
  ami                    = "ami-05576a079321f21f8"
  instance_type          = "t2.micro"
  key_name               = "default-ec2-keypair"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  subnet_id              = "subnet-074a363ec3a3913c3"

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_keypair)
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo yum install -y httpd",
  #     "sudo systemctl start httpd",
  #     "sudo systemctl enable httpd",
  #     "echo ${self.public_dns} is active | sudo tee /var/www/html/index.html"
  #   ]
  # }

    provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "echo ${self.public_dns} is active | sudo tee /var/www/html/index.html"
    ]
  }
}

# output "ec2_instances" {
#   value = aws_instance.ec2_instances
# }   



