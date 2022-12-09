output "bastion_public_ip" {
  value = aws_instance.acs_bastion.public_ip
}

output "bastion_security_group_id" {
  value = aws_security_group.bastion_ssh.id
}