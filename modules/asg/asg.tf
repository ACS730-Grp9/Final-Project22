locals {
  comon_name = "${var.prefix}-${var.env}"
}

resource "aws_autoscaling_group" "application_asg" {
  name                 = "${local.comon_name}-asg"
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  health_check_type    = "ELB"
  target_group_arns    = [var.target_group_arn]
  launch_configuration = aws_launch_configuration.server_launch_config.name
  vpc_zone_identifier  = var.private_subnet
  tag {
    key                 = "Name"
    value               = "${local.comon_name}-vm"
    propagate_at_launch = true
  }
}
