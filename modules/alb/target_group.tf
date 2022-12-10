resource "aws_lb_target_group" "application_target_group" {
  name        = "${var.common_name}-TargetGroup"
  port        = 80
  target_type = "instance"
  protocol    = "HTTP"
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    port                = 80
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2

  }
  vpc_id = var.vpc_id
  
  tags = merge(var.default_tags,
    {
      Name = "${var.common_name}-Target-Group"
      env  = var.env
  })

}