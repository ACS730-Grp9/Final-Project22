resource "aws_launch_configuration" "server_launch_config" {
  name_prefix                 = "${var.common_name}-WebServer-Launch-Config"
  image_id                    = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = var.security_groups
  associate_public_ip_address = false
  iam_instance_profile        = "LabInstanceProfile"
  user_data = templatefile("${path.module}/web-html.tpl", {
    env    = lower(var.env),
    prefix = var.prefix,
    name1  = var.members[0],
    name2  = var.members[1],
    name3  = var.members[2],
    name4  = var.members[3]
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
