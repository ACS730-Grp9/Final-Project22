resource "aws_autoscaling_policy" "asg_scaleup_policy" {
  name                   = "${var.common_name}-asg-scalup-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.application_asg.name
}


resource "aws_cloudwatch_metric_alarm" "asg-scaleup-alarm" {
  alarm_name          = "${var.common_name}-ssg-scaleup-alarm"
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

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-asg-cloudwatch-alarm-up"
      env  = var.env
  })  
}


resource "aws_autoscaling_policy" "scale_down_policy" {
  name                   = "${var.common_name}-asg-scaledown-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.application_asg.name
}


resource "aws_cloudwatch_metric_alarm" "asg-scaledown-alarm" {
  alarm_name          = "${var.common_name}-asg-scaledown-alarm"
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

  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-asg-cloudwatch-alarm-down"
      env  = var.env
  })  
}
