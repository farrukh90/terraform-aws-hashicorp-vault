//--------------------------------------------------------------------
// Master Key Encryption Provider instance
//    This node does not participate in the HA clustering

resource "aws_instance" "vault-transit" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.testing.id]
  associate_public_ip_address = true
  private_ip                  = var.vault_transit_private_ip
  iam_instance_profile        = aws_iam_instance_profile.vault-transit.id

  user_data = templatefile("${path.module}/templates/userdata-vault-transit.tpl", {
    tpl_vault_zip_file     = var.vault_zip_file
    tpl_vault_service_name = "vault-${var.environment_name}"
  })

  tags = var.tags


  lifecycle {
    ignore_changes = [
      ami,
      tags,
    ]
  }
}

//--------------------------------------------------------------------
// Vault Server Instance

resource "aws_instance" "vault-server" {
  count                       = length(var.vault_server_names)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.testing.id]
  associate_public_ip_address = true
  private_ip                  = var.vault_server_private_ips[count.index]
  iam_instance_profile        = aws_iam_instance_profile.vault-server.id

  # user_data = data.template_file.vault-server[count.index].rendered
  user_data = templatefile("${path.module}/templates/userdata-vault-server.tpl", {
    tpl_vault_node_name          = var.vault_server_names[count.index],
    tpl_vault_storage_path       = "/vault/${var.vault_server_names[count.index]}",
    tpl_vault_zip_file           = var.vault_zip_file,
    tpl_vault_service_name       = "vault-${var.environment_name}",
    tpl_vault_transit_addr       = aws_instance.vault-transit.private_ip
    tpl_vault_node_address_names = zipmap(var.vault_server_private_ips, var.vault_server_names)
  })

  tags = var.tags


  lifecycle {
    ignore_changes = [ami, tags]
  }
}
