#create a map
# variable "users" {
#   type = map(object({
#     dept = string
#     level = string
#   }))
#   default = {
#     anya = { dept = "dev", level = "coop" }
#     yor = { dept = "hr", level = "manager" }
#     loido = { dept = "hr", level = "ceo" }
#     bondo = { dept = "dev", level = "coop" }
#     becky = { dept = "dev", level = "coop" }
#     franky = { dept = "dev", level = "lead" }
#   }
# }

#create a map of maps
variable "users" {
  default = {
    anya : { dept : "dev", level : "coop" },
    yor : { dept : "hr", level : "manager" },
    loido : { dept : "hr", level : "ceo" },
    bondo : { dept : "dev", level : "coop" },
    becky : { dept : "dev", level : "coop" },
    franky : { dept : "dev", level : "lead" },
    yuri : { dept : "dev", level : "lead" }
  }
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

#create IAM users from map
resource "aws_iam_user" "users-jayslabs" {
  for_each = var.users
  name     = each.key
  tags = {
    dept : each.value.dept
    level : each.value.level
  }
}


