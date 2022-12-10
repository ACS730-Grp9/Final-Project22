resource "aws_instance" "acs_bastion" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.bastion_subnet_id
  vpc_security_group_ids      = [aws_security_group.bastion_ssh.id]
  associate_public_ip_address = true

  root_block_device {
    encrypted = true
  }
  
  metadata_options {
    http_tokens = "required"
    http_endpoint = "enabled"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-BastionHost"
      env  = var.env
  })  
}
