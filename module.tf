module "vault" {
  vault_server_private_ips = var.vault_server_private_ips
  vault_transit_private_ip = var.vault_transit_private_ip
  availability_zones = var.availability_zones
  environment_name   = var.environment_name
  ssh_key_location   = var.ssh_key_location
  aws_region         = var.aws_region
  key_name           = var.key_name
  ami_id             = var.ami_id
  source             = "./module"
  user               = var.user
}