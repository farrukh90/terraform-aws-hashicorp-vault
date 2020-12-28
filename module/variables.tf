# AWS region and AZs in which to deploy
variable "aws_region" {}
variable "vault_transit_private_ip" {}


# SSH key name to access EC2 instances (should already exist) in the AWS Region
variable "key_name" {}
variable "user" {}
variable "ssh_key_location" {}
variable "ami_id" {}

variable "availability_zones" {
  default = "us-east-1a"
}

# All resources will be tagged with this
variable "environment_name" {
  default = "raft-demo"
}



variable "vault_server_names" {
  description = "Names of the Vault nodes that will join the cluster"
  type        = list(string)
  default     = ["vault_2", "vault_3", "vault_4"]
}

variable "vault_server_private_ips" {
  type    = list(string)
}


# URL for Vault OSS binary
variable "vault_zip_file" {
  default = "https://releases.hashicorp.com/vault/1.6.0/vault_1.6.0_linux_amd64.zip"
}

# Instance size
variable "instance_type" {
  default = "m5.large"
}