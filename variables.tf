variable "aws_region" {}
variable "availability_zones" {}
variable "environment_name" {}
variable "key_name" {}
variable "user" {}
variable "ssh_key_location" {}
variable "ami_id" {}
variable "vault_transit_private_ip" {}
variable "vault_server_private_ips" {
  type    = list(string)
}

