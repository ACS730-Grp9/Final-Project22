resource "aws_autoscaling_group" "application_asg" {
  name                 = "${var.common_name}-Asg"
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  health_check_type    = "ELB"
  target_group_arns    = [var.target_group_arn]
  launch_configuration = aws_launch_configuration.server_launch_config.name
  vpc_zone_identifier  = var.private_subnet

  tag {
    key                 = "Name"
    value               = "${var.common_name}-Vm"
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.default_tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
