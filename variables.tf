variable "aws_region" {}
variable "environment_name" {}
variable "key_name" {}
variable "user" {}
variable "ssh_key_location" {}
variable "ami_id" {}
variable "vault_transit_private_ip" {}
variable "subnet_id" {}
variable "vpc_id" {}
variable "vault_server_private_ips" {
  type    = list(string)
}

