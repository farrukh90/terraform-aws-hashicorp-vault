availability_zones = "us-east-1a"
key_name           = "laptop"
aws_region         = "us-east-1"
environment_name   = "learn-vault"
ssh_key_location   = "~/.ssh/id_rsa"
user               = "centos"
ami_id             = "ami-0affd4508a5d2481b" #Verified CentOS AMI should be given 

vault_transit_private_ip     = "10.0.101.21"
vault_server_private_ips = [
    "10.0.101.22", 
    "10.0.101.23", 
    "10.0.101.24"
]
