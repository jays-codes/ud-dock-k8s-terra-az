module "user_module" {
  source      = "../../terraform-modules/users"
  environment = "dev"
}

output "user_jayslabs" {
  value = module.user_module.user_jayslabs
}