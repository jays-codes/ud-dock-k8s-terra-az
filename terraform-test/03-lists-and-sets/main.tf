variable "user_names" {
  type    = list(string)
  default = ["anya", "yor", "loido", "bondo", "becky","franky"]
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

#create IAM users from list
resource "aws_iam_user" "users-jayslabs" {
  #count = length(var.user_names)
  #name  = "${var.user_names[count.index]}"
  for_each = toset(var.user_names)
  name     = each.value
}
