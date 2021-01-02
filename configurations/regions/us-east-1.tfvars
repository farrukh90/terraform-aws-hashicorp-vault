key_name                 = "bastion"
zone_id                  = "Z32OHGRMBVZ9LR"
domain                   = "acirrustech.com"
aws_region               = "us-east-1"
environment_name         = "dev"
ssh_key_location         = "~/.ssh/id_rsa"
user                     = "centos"
ami_id                   = "ami-0affd4508a5d2481b" #Verified CentOS AMI should be given 
subnet_id                = "subnet-08e90a971c8396880"
vpc_id                   = "vpc-0ab3b5f4a72c3eb45"
vault_transit_private_ip = "10.0.101.21"
vault_server_private_ips = [
  "10.0.101.22",
  "10.0.101.23",
  "10.0.101.24"
]

tags = {
  "Name"      = "Vault",
  "something" = "something"
}