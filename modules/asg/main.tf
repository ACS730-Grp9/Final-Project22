locals {
  comon_name = "${var.group_name}-${var.env}"
}
resource "aws_launch_configuration" "server_launch_config" {
  name_prefix                 = "${local.comon_name}-webserver-launch-config"
  image_id                    = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  security_groups             = [var.security_groups]
  associate_public_ip_address = true
  user_data                   = filebase64("${path.module}/startup.sh")

  root_block_device {
    volume_type = "gp2"
    volume_size = 10
    encrypted   = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "application_asg" {
  name           = "${local.comon_name}-asg"
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  health_check_type    = "ELB"
  target_group_arns    = [var.target_group_arn]
  launch_configuration = aws_launch_configuration.server_launch_config.name
  vpc_zone_identifier  = [var.private_subnet]
  tag {
    key                 = "Name"
    value               = "${local.comon_name}-vm"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "asg_scaleup_policy" {
  name                   = "${local.comon_name}-asg-scalup-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.application_asg.name
}


resource "aws_cloudwatch_metric_alarm" "asg-scaleup-alarm" {
  alarm_name          = "${local.comon_name}-ssg-scaleup-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = var.scale_up_threshold
  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.application_asg.name}"
  }
  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = ["${aws_autoscaling_policy.asg_scaleup_policy.arn}"]
}


resource "aws_autoscaling_policy" "scale_down_policy" {
  name                   = "${local.comon_name}-asg-scaledown-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.application_asg.name
}


resource "aws_cloudwatch_metric_alarm" "Group_Project_ASG_ScaleDownAlarm" {
  alarm_name          = "${local.comon_name}-asg-scaledown-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = var.scale_down_threshold
  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.application_asg.name}"
  }
  alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions     = ["${aws_autoscaling_policy.scale_down_policy.arn}"]
}
