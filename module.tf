module "vault" {
  vault_server_private_ips = var.vault_server_private_ips
  vault_transit_private_ip = var.vault_transit_private_ip
  environment_name   = var.environment_name
  ssh_key_location   = var.ssh_key_location
  aws_region         = var.aws_region
  subnet_id          = var.subnet_id
  key_name           = var.key_name
  ami_id             = var.ami_id
  source             = "./module"
  vpc_id             = var.vpc_id
  user               = var.user
  zone_id            = var.zone_id
  domain             = var.domain
  tags               = var.tags
}