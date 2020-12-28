resource "null_resource" "join-vault" {
  triggers = {
    always_run = timestamp()
  }
  depends_on = [
    aws_instance.vault-server[0],
    aws_instance.vault-server[1],
    aws_instance.vault-server[2]
  ]
  provisioner "remote-exec" {
    connection {
      host        = aws_instance.vault-server[1].public_ip
      type        = "ssh"
      user        = var.user
      private_key = file(var.ssh_key_location)
    }

    inline = [
      "sleep 900",
      "vault operator raft join http://${aws_instance.vault-server[0].public_ip}:8200"
    ]
  }
  provisioner "remote-exec" {
    connection {
      host        = aws_instance.vault-server[2].public_ip
      type        = "ssh"
      user        = var.user
      private_key = file(var.ssh_key_location)
    }

    inline = [
      "vault operator raft join http://${aws_instance.vault-server[0].public_ip}:8200"
    ]
  }
}
