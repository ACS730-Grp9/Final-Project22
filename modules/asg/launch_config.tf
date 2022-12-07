resource "aws_launch_configuration" "server_launch_config" {
  name_prefix                 = "${local.comon_name}-webserver-launch-config"
  image_id                    = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = var.security_groups
  associate_public_ip_address = false
  user_data = templatefile("${path.module}/startup.sh.tpl", {
    env    = var.env,
    prefix = var.prefix
  })

  root_block_device {
    volume_type = "gp2"
    volume_size = 10
    encrypted   = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
