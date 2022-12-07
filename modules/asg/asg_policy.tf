
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
