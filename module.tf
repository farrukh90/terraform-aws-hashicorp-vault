module "vault" {
  availability_zones = var.availability_zones
  environment_name   = var.environment_name
  ssh_key_location   = var.ssh_key_location
  aws_region         = var.aws_region
  key_name           = var.key_name
  source             = "./module"
  user               = var.user
}